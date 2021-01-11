<#                   
         d8b                                                      
         Y8P                                                      
                                                                  
88888b.  888  .d8888b .d88b.  88888b.   8888b.  .d8888b  .d8888b  
888 "88b 888 d88P"   d8P  Y8b 888 "88b     "88b 88K      88K      
888  888 888 888     88888888 888  888 .d888888 "Y8888b. "Y8888b. 
888  888 888 Y88b.   Y8b.     888 d88P 888  888      X88      X88 
888  888 888  "Y8888P "Y8888  88888P"  "Y888888  88888P'  88888P' 
                              888                                 
                              888                                 
                              888

A simple script to produce a secure yet human readable password that copies
to the clipboard with at least one random symbol. The script will query 
dinopass.com over SSL so an internet connection is <required>
#>

$WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong"
$symbols = @('!','@','#','$','%','^','&','*','(',')','-','+','=','-') | Get-Random -Count 1 
$WebContent = $WebResponse.Content + $symbols | clip
$msg = "Random password copied"
Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * /time:1 $msg"  

<#
References
https://ascii.today/

Random Code
#$symbols = @('!','@','#','$','%','^','&','*','(',')','-','+','=','-')
#$RandomSymbol = -join ((33,36,37,61,63,64,126,43) | Get-Random -Count 1 | % {[char]$_}) 
#$symbols[0..14]