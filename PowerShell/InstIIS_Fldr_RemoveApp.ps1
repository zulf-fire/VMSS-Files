﻿$IISFeatures = "Web-WebServer","Web-Common-Http","Web-Default-Doc","Web-Dir-Browsing","Web-Http-Errors","Web-Static-Content","Web-Http-Logging","Web-Log-Libraries","Web-Request-Monitor" ,"Web-Stat-Compression","Web-Filtering","Web-Mgmt-Tools","Web-Mgmt-Console", "Web-Metabase"

Install-WindowsFeature -Name $IISFeatures

mkdir C:\inetpub\wwwroot\ActiveDirectoryService

Remove-Website -Name "Default Web Site"