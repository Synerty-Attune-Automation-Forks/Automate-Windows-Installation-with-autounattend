Enable-PSRemoting -SkipNetworkProfileCheck -Force
Chk $?

Remove-Item -Path WSMan:\Localhost\listener\listener* -Recurse
Chk $?

New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint (New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName '${newOsNode.hostname}' -NotAfter (get-date).AddYears(6)).Thumbprint -Force
Chk $?

Enable-WSManCredSSP -Role Server -Force
Chk $?

Stop-Service -Force WinRM
Chk $?

Set-Service WinRM -startuptype automatic
Chk $?

New-NetFirewallRule -DisplayName 'WinRM HTTPS' -Name 'WinRM_HTTPS' -Profile Any -LocalPort 5986 -Protocol TCP
Chk $?