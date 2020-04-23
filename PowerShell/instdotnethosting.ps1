Invoke-WebRequest -Uri 'https://download.visualstudio.microsoft.com/download/pr/ff658e5a-c017-4a63-9ffe-e53865963848/15875eef1f0b8e25974846e4a4518135/dotnet-hosting-3.1.3-win.exe' -OutFile 'c:\temp\dotnet-hosting-3.1.3-win.exe'

Start-Sleep -Seconds 10

Invoke-Expression -Command 'C:\temp\dotnet-hosting-3.1.3-win.exe /install /quiet /norestart'