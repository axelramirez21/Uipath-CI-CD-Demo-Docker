FROM mcr.microsoft.com/windows/servercore:ltsc2019
ADD https://download.uipath.com/UiPathStudio.msi C:\\UipathStudio.msi
RUN PowerShell -Command New-Item -Path "C:\\" -ItemType "directory" -Name "UiPath";
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Start-Process C:\\UiPathStudio.msi -ArgumentList 'ADDLOCAL=DesktopFeature,Robot,Studio APPLICATIONFOLDER=C:\\UiPath /quiet' -Wait; 
RUN Remove-Item "C:\\UiPathStudio.msi" -Force; 
RUN Install-PackageProvider -Name NuGet -Force; 
RUN Register-PSRepository -Name UiPath -SourceLocation https://www.myget.org/F/uipath-dev/api/v2; 
RUN Install-Module -Repository UiPath -Name UiPath.Powershell -Force
CMD ["cmd"]