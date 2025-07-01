FROM mcr.microsoft.com/azure-powershell
WORKDIR /app
COPY ../scripts/entry.ps1 .
CMD ["pwsh", "./entry.ps1"]
