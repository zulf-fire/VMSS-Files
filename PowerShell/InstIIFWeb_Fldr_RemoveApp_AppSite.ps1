﻿$IISFeatures = "Web-WebServer","Web-Common-Http","Web-Default-Doc","Web-Dir-Browsing","Web-Http-Errors","Web-Static-Content","Web-Http-Logging","Web-Log-Libraries","Web-Request-Monitor" ,"Web-Stat-Compression","Web-Filtering","Web-Mgmt-Tools","Web-Mgmt-Console", "Web-Metabase"

Install-WindowsFeature -Name $IISFeatures

########################################################################

mkdir C:\inetpub\wwwroot\ActiveDirectoryService

Remove-Website -Name "Default Web Site"
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


#Of course this is after Creating App Pool and Sites