$IISFeatures = "Web-WebServer","Web-Common-Http","Web-Default-Doc","Web-Dir-Browsing","Web-Http-Errors","Web-Static-Content","Web-Http-Logging","Web-Log-Libraries","Web-Request-Monitor" ,"Web-Stat-Compression","Web-Filtering","Web-Mgmt-Tools","Web-Mgmt-Console", "Web-Metabase"

Install-WindowsFeature -Name $IISFeatures

########################################################################

mkdir C:\inetpub\wwwroot\ActiveDirectoryService

Remove-Website -Name "Default Web Site"$defaultAppPools = @(".NET v2.0",".NET v2.0 Classic",".NET v4.5",".NET v4.5 Classic","Classic .NET AppPool","DefaultAppPool")Foreach ($defaultAppPool in $defaultAppPools){    IF (Test-path "IIS:\AppPools\$defaultAppPool"){Remove-WebAppPool -name $DefaultAppPool}}#########################################################################Application Poo and Site Creation$iisAppPoolName = "ActiveDirectoryService"
$iisAppPoolDotNetVersion = "No Managed Code"
$iisAppName = "ActiveDirectoryService"
$directoryPath = "C:\inetpub\wwwroot\ActiveDirectoryService"

#navigate to the app pools root
cd IIS:\AppPools\

#check if the app pool exists
if (!(Test-Path $iisAppPoolName -pathType container))
{
    #create the app pool
    $appPool = New-Item $iisAppPoolName
    $appPool | Set-ItemProperty -Name "managedRuntimeVersion" -Value $iisAppPoolDotNetVersion
}
else
{
    return
}

#navigate to the sites root
cd IIS:\Sites\

#check if the site exists
if (!(Test-Path $iisAppName -pathType container))
{
    #create the site
    $iisApp = New-Item $iisAppName -bindings @{protocol="http";bindingInformation=":80:" + $iisAppName} -physicalPath $directoryPath
    $iisApp | Set-ItemProperty -Name "applicationPool" -Value $iisAppPoolName
}
else
{
    return
}


#Of course this is after Creating App Pool and Sites#Increase max entity sizeSet-WebConfigurationProperty -PSPath "iis:\Sites" -location "ActiveDirectoryService" -filter "system.webserver/serverruntime" -name "uploadreadaheadsize" -value 2049152#Get-WebConfigurationProperty -PSPath "iis:\Sites" -location "ActiveDirectoryService" -filter "system.webserver/serverruntime" -name "uploadreadaheadsize" -value 2049152#########################################################################Setting th3 variable on each host [System.Environment]::SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", "Release", "Machine")