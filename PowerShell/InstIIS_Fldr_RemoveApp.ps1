$IISFeatures = "Web-WebServer","Web-Common-Http","Web-Default-Doc","Web-Dir-Browsing","Web-Http-Errors","Web-Static-Content","Web-Http-Logging","Web-Log-Libraries","Web-Request-Monitor" ,"Web-Stat-Compression","Web-Filtering","Web-Mgmt-Tools","Web-Mgmt-Console", "Web-Metabase"

Install-WindowsFeature -Name $IISFeatures

mkdir C:\inetpub\wwwroot\ActiveDirectoryService

Remove-Website -Name "Default Web Site"$defaultAppPools = @(".NET v2.0",".NET v2.0 Classic",".NET v4.5",".NET v4.5 Classic","Classic .NET AppPool","DefaultAppPool")Foreach ($defaultAppPool in $defaultAppPools){    IF (Test-path "IIS:\AppPools\$defaultAppPool"){Remove-WebAppPool -name $DefaultAppPool}}