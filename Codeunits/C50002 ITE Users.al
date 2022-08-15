codeunit 50002 "ITE Users"
{
    // version ITE1.0

    /*
    Dialog med brugere - kaldt fra CompanyOpen i den gamle Codeunit 1
    IF (NOT IsWebservice) AND GUIALLOWED THEN
        ITESusers.SetUser();
    */

    trigger OnRun();
    begin
        ForceSetUser();
    end;

    procedure GetUser() ReturnVal: Text[100];
    var
        ITEUserRec: Record IteUsers;
        NavUserRec: Record User;
        UserTxt: Text[100];
        emp: Record Employee;
        // For testing Dialog
        LogInMng: Codeunit LogInManagement;
    begin

        CLEAR(emp);
        UserTxt := USERID;
        ReturnVal := '';

        NavUserRec.SETFILTER("User Name", FORMAT(UserTxt));

        IF NavUserRec.FINDFIRST THEN BEGIN
            ITEUserRec.SETFILTER(UserSecurityId, NavUserRec."User Security ID");
            IF ITEUserRec.FINDFIRST THEN
                IF emp.GET(ITEUserRec.Employee) THEN
                    ReturnVal := emp.Initials;
        END
    end;

    procedure SetUser(): Text[20];
    var
        ITEUserRec: Record IteUsers;
        NavUserRec: Record User;
        UserTxt: Text[100];
        Options: Text;
        mySelected: Integer;
        UserArr: array[25] of Text[100];
        i: Integer;
        emp: Record Employee;
        ITEUserRecnew: Record IteUsers;
    begin
        i := 0;
        UserTxt := USERID;

        CLEAR(NavUserRec);
        CLEAR(ITEUserRecnew);
        CLEAR(ITEUserRec);
        CLEAR(emp);

        NavUserRec.SETFILTER("User Name", FORMAT(UserTxt));

        //Find nav user
        IF NavUserRec.FINDFIRST THEN BEGIN
            //Find employee

            emp.SETFILTER(emp.TopUser, NavUserRec."User Security ID");
            IF emp.FINDSET(FALSE, FALSE) THEN BEGIN  //Employee fund
                WriteUser(emp."No.", NavUserRec."User Security ID");

            END
            ELSE BEGIN
                //No employee mapped => Select employee
                CLEAR(emp);
                IF emp.FINDSET(FALSE, FALSE) THEN BEGIN
                    REPEAT
                        i := i + 1;
                        Options += emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name" + ',';
                        UserArr[i] := emp."No.";
                    UNTIL emp.NEXT = 0;

                    mySelected := DIALOG.STRMENU(Options, 1, 'Vælg medarbejder');

                    IF mySelected = 0 THEN
                        mySelected := 1;

                    WriteUser(UserArr[mySelected], NavUserRec."User Security ID");
                END
                ELSE  //ingen medarbejdere
                  BEGIN
                    WriteUser(NavUserRec."User Name", NavUserRec."User Security ID");
                    //skriv nav bruger?
                END
            END
        END
    end;

    local procedure WriteUser(UserID: Text[100]; UserGuid: Guid);
    var
        ITEUserRec: Record IteUsers;
    begin
        CLEAR(ITEUserRec);

        ITEUserRec.SETFILTER(UserSecurityId, UserGuid);
        IF ITEUserRec.FINDSET(TRUE, FALSE) THEN BEGIN
            ITEUserRec.Employee := UserID;
            ITEUserRec.MODIFY;

        END
        ELSE BEGIN
            ITEUserRec.INIT;
            ITEUserRec.UserSecurityId := UserGuid;
            ITEUserRec.Employee := UserID;
            ITEUserRec.INSERT;
        END;
    end;

    procedure ForceSetUser(): Text[100];
    var
        ITEUserRec: Record IteUsers;
        NavUserRec: Record User;
        UserTxt: Text[50];
        Options: Text;
        mySelected: Integer;
        UserArr: array[25] of Text[100];
        i: Integer;
        emp: Record Employee;
        ITEUserRecnew: Record IteUsers;
        myCurrentUser: Code[100];
        selectedint: Integer;
    begin
        i := 0;
        UserTxt := USERID;
        selectedint := 1;

        CLEAR(NavUserRec);
        CLEAR(ITEUserRec);
        CLEAR(emp);

        NavUserRec.SETFILTER("User Name", FORMAT(UserTxt));

        IF NavUserRec.FINDFIRST THEN BEGIN

            ITEUserRec.SETFILTER(UserSecurityId, NavUserRec."User Security ID");
            IF ITEUserRec.FINDFIRST THEN
                myCurrentUser := ITEUserRec.Employee
            ELSE
                myCurrentUser := '0';

            NavUserRec.SETFILTER("User Name", FORMAT(UserTxt));

            //Find nav user
            IF NavUserRec.FINDFIRST THEN BEGIN
                //No employee mapped => Select employee
                CLEAR(emp);
                IF emp.FINDSET(FALSE, FALSE) THEN BEGIN
                    REPEAT
                        i := i + 1;
                        Options += emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name" + ',';
                        UserArr[i] := emp."No.";
                        IF FORMAT(myCurrentUser) = emp."No." THEN
                            selectedint := i;
                    UNTIL emp.NEXT = 0;

                    mySelected := DIALOG.STRMENU(Options, selectedint, 'Vælg medarbejder');

                    IF mySelected = 0 THEN
                        mySelected := selectedint;

                    WriteUser(UserArr[mySelected], NavUserRec."User Security ID");
                END
                ELSE  //ingen medarbejdere
                  BEGIN
                    WriteUser(NavUserRec."User Name", NavUserRec."User Security ID");
                    //skriv nav bruger?
                END
            END
        END
    end;
}

