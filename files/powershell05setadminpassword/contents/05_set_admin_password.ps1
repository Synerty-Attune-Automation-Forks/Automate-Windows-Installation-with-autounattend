$securePassword = ConvertTo-SecureString `
    '${newOsWindowsUserAdministrator.password}' `
    -AsPlainText `
    -Force
Chk $?

Set-LocalUser `
    -Name "${newOsWindowsUserAdministrator.user}" `
    -Password $securePassword
Chk $?