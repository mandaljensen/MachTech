codeunit 50016 REUpgradeCode
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany();
    var
        Module: ModuleInfo;

    begin
        NavApp.GetCurrentModuleInfo(Module);
        NavApp.RestoreArchiveData(50000);
        NavApp.RestoreArchiveData(50001);
        NavApp.RestoreArchiveData(50002);
        NavApp.RestoreArchiveData(50006);
        NavApp.RestoreArchiveData(50007);
        NavApp.RestoreArchiveData(50008);
        NavApp.RestoreArchiveData(50009);

        if Module.DataVersion.Major = 1 then begin

        end;
    end;
}
