<# 
A simple script to produce a secure yet human readable password that copies to
the clipboard 
#>

$WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong"
$WebContent = $WebResponse.Content | clip
$msg = "Random password copied ^_^"
Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * /time:1 $msg"  


<#
#Add-Type -AssemblyName PresentationCore,PresentationFramework
$MessageTitle = "https://www.dinopass.com/password/strong"
$Messagebody = "Random password copied ^_^"
$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle)
#>

# Need to close or click okay on this box after .5 sec

<#
$MessageTitle = "https://www.dinopass.com/password/strong"
$Messagebody = "Random password copied ^_^"
$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle)
#>

#$Result::Destroy

###############################################################################

<#
do this correctly
$wait
$Result::Destroy()
#>

<# 
Old message dialog box
$Messagebody = "Random password copied ^_^"
$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle)
#>

<# 
Show output 
$WebContent = $WebResponse.Content
$WebContent 
#>

<# 
If run from .PS1 
Write-Host -NoNewLine 'Press any key to quit...'; 
#>

<#
Exit
[void][System.Console]::ReadKey($true)
#>

