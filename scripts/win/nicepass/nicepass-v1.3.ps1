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

$WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong" #Thank you dino :)
$Password = $WebResponse.Content #Grab output of password on webpage
$AddRandomSymbol = @('!','@','#','$','%','&','*','=') | Get-Random -Count 1 #Grab random symbol, nothing too abstract
if ( $Password -match '\W' ) #If password has a symbol copy to clipboard
{
    #Write-Host -ForegroundColor Green "True" #For testing
    Set-Clipboard -Value $Password #Copies item to clipboard without a new line
    $msg = "Random password copied" #Processing the password takes time, old message box will destroy itself to let user know when they can paste.
    Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * /time:1 $msg" #Destroy message box after 1 second
}
else #If password from dinopass has no symbol
{
    #Write-Host -ForegroundColor Red "False" 
    $Password + $AddRandomSymbol | Set-Clipboard 
    $msg = "Random password copied" 
    Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * /time:1 $msg"  
}

<##############################################################################
###############################################################################
                            Old workings and notes
###############################################################################
##############################################################################>

<#
if ( Select-String -Path-Content -Path C:\process.txt = $true )
{
    Get-Content -Path C:\process.txt | clip
}
else
{
    
}
#>

<#
$WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong"
#$WebResponse.Content | Out-File -FilePath C:\process.txt
#$PasswordCheck = Select-String -Path C:\process.txt -Quiet '[!@#$%^&*()+=]'
$WebResponse.Content | Select-String -Quiet 
$symbols = @('!','@','#','$','%','^','&','*','(',')','-','+','=','-') | Get-Random -Count 1 
#$Password =  Get-Content -Path C:\process.txt
#$PasswordCheck

if ( $PasswordCheck = $true )
{
   $Password | clip
}
else
{
    $Password + $symbols | clip
}
#>

<#
$WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong"
$WebResponse.Content | Select-String -AllMatches '[!@#$%^&*()+=]'

#
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

$WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong"

If($WebResponse.Content | Select-String -Quiet '[!@#$%^&*()+=]'){
    

    $WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong"
$WebResponse.Content | Out-File -FilePath C:\temp\process.txt
Select-String -Path C:\temp\process.txt -Quiet '[!@#$%^&*()+=]'

####
$WebResponse = Invoke-Webrequest -Uri "https://www.dinopass.com/password/strong"
$WebResponse.Content | Out-File -FilePath C:\process.txt
$PasswordCheck = Select-String -Path C:\process.txt -Quiet '[!@#$%^&*()+=]'
$symbols = @('!','@','#','$','%','^','&','*','(',')','-','+','=','-') | Get-Random -Count 1 
$Password =  Get-Content -Path C:\process.txt
$PasswordCheck

if ( $PasswordCheck = $true )
{
   $Password | clip
}
else
{
    
    $Password + $symbols | clip
}

#
https://powershellexplained.com/2019-08-11-Powershell-if-then-else-equals-operator/#else
https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.1

#
Learn Regex expressions
https://regexone.com/lesson/letters_and_digits?

match . = wildcard
match ...\.

[1-4]+.....?........

^Mission: successful$

^(file_.+)\.pdf = all pdf files starting with file_xxxxx

^(\w+\s(\d+)) = 

capture (\d*)x(\d*)= capture all digits

Lesson Notes
abc…	Letters
123…	Digits
\d	Any Digit
\D	Any Non-digit character
.	Any Character
\.	Period
[abc]	Only a, b, or c
[^abc]	Not a, b, nor c
[a-z]	Characters a to z
[0-9]	Numbers 0 to 9
\w	Any Alphanumeric character
\W	Any Non-alphanumeric character
{m}	m Repetitions
{m,n}	m to n Repetitions
*	Zero or more repetitions
+	One or more repetitions
?	Optional character
\s	Any Whitespace
\S	Any Non-whitespace character
^…$	Starts and ends
(…)	Capture Group
(a(bc))	Capture Sub-group
(.*)	Capture all
(abc|def)	Matches abc or def

https://regex101.com/ to test regex
#>

#$Password | clip #Old basic ver
#$Password + $AddRandomSymbol | clip #Old basic ver