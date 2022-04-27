#Install New apps
$apps = @(
    @{name = "TheDocumentFoundation.LibreOffice" }, 
    @{name = "Zoom.Zoom" }, 
    @{name = "Adobe.Acrobat.Reader.64-bit" }, 
    @{name = "Google.Chrome" }, 
);
Foreach ($app in $apps) {
    #check if the app is already installed
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing:" $app.name
        if ($app.source -ne $null) {
            winget install --exact --silent $app.name --source $app.source
        }
        else {
            winget install --exact --silent $app.name 
        }
    }
    else {
        Write-host "Skipping Install of " $app.name
    }
}

winget install --id=TheDocumentFoundation.LibreOffice -e  ; winget install --id=Zoom.Zoom -e  ; winget install --id=Adobe.Acrobat.Reader.64-bit -e  ; winget install --id=Google.Chrome -e 