$CertificateFriendlyName = "WinUI-Gallery-Test"
$Publisher = "CN=WinUI-Gallery-Test"

$cert = New-SelfSignedCertificate -Type Custom `
    -Subject $Publisher `
    -KeyUsage DigitalSignature `
    -FriendlyName $CertificateFriendlyName `
    -CertStoreLocation "Cert:\CurrentUser\My" `
    -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")

$certificateBytes = $cert.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Pkcs12)
mkdir -Force "$PSScriptRoot\..\build" > $null
[System.IO.File]::WriteAllBytes("$PSScriptRoot\..\build\WinUI-Gallery-Test.pfx", $certificateBytes)