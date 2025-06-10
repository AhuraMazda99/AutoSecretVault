FROM mcr.microsoft.com/powershell:lts-alpine-3.15
WORKDIR /app
COPY ../scripts/entry.ps1 .
CMD ["pwsh", "./entry.ps1"]
