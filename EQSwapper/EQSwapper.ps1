### Read file names in C:\Program Files\EqualizerAPO\config\headphones
### Ask what headphones are used
### copy selected headphone file to "C:\Program Files\EqualizerAPO\config\config.txt"
$destinationPath = "C:\Program Files\EqualizerAPO\config\config.txt"
$headphonesPath = "C:\Program Files\EqualizerAPO\config\headphones\"

### Read file names in C:\Program Files\EqualizerAPO\config\headphones
$headphones = Get-ChildItem -Path $headphonesPath -Name
for ($count = 0; $count -lt $headphones.Length; $count++ ) {
    Write-Host $count":" $headphones[$count]
}
### Ask what headphones are used
$usedHeadphones = Read-Host "What headphones are plugged in?"
$connectedHeadphone = $headphones[$usedHeadphones]

### copy selected headphone file to "C:\Program Files\EqualizerAPO\config\config.txt"
$sourcePath = Join-Path -Path $headphonesPath -ChildPath $connectedHeadphone

try { Copy-Item $sourcePath -Destination $destinationPath }
catch {
    Write-Host "An error occurred:"
    Write-Host $_
}
Finally {
    Write-Host $connectedHeadphone "EQ used."
    Start-Sleep -s 2
}
