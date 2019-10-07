param (
    [string]$name= "www.whattttttttttttttt.com",    
    [Parameter(Mandatory=$true)][string]$password = $( Read-Host "Enter password (required)" )    
)

Write-Host "Generating Self Signed certificate..."

$cert = New-SelfSignedCertificate -DnsName $name -Subject $name -Provider "microsoft enhanced rsa and aes cryptographic provider" -CertStoreLocation cert:\CurrentUser\My
$securePassword = ConvertTo-SecureString -String $password -Force -AsPlainText
Export-PfxCertificate -Cert "cert:\CurrentUser\My\$($cert.Thumbprint)" -Password $securePassword -FilePath ".\$($name).pfx"
Export-Certificate -Cert $cert -FilePath ".\$($name).cer"

Write-Host ""
Write-Host ""
Write-Host "Self Signed certificate generated succesfully"
Write-Host "Thumbprint: $($cert.Thumbprint)"
