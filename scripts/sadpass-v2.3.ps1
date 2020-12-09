Function Generate365PW
{
	Param($max = 1)
	For ($i = 0; $i -lt $max; $i++){
		$pw = Get-Random -Count 1 -InputObject ((65..72)+(74..75)+(77..78)+(80..90)) | % -begin {$UC=$null} -process {$UC += [char]$_} -end {$UC}
		$pw += Get-Random -Count 5 -InputObject (97..122) | % -begin {$LC=$null} -process {$LC += [char]$_} -end {$LC}
		$pw += Get-Random -Count 2 -InputObject (48..57) | % -begin {$NB=$null} -process {$NB += [char]$_} -end {$NB}
        $pw += Get-Random -Count 2 -InputObject (33,36,37,61,63,64,126,43) | % -begin {$Sym=$null} -process {$Sym += [char]$_} -end {$Sym}
		write-output $pw
	}
}
Generate365PW | clip

$msg = "Random password copied ^_^"
Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * /time:1 $msg"  