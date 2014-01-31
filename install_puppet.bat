if not exist "C:\vagrant\puppet.msi" (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://pm.puppetlabs.com/cgi-bin/download.cgi?ver=latest&dist=win', 'C:\vagrant\puppet.msi')" <NUL
)

ntrights +r SeServiceLogonRight -u "vagrant"

:: http://docs.puppetlabs.com/pe/latest/install_windows.html
msiexec /qn /i C:\vagrant\puppet.msi PUPPET_MASTER_SERVER=puppet-master /log C:\Windows\Temp\puppet.log

net stop pe-puppet

sc config pe-puppet obj= .\vagrant password= vagrant

net start pe-puppet
