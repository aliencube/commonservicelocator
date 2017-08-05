# This script runs solution build.
Param(
	[string] [Parameter(Mandatory=$false)] $Configuration = "Debug",
	[string] [Parameter(Mandatory=$false)] $Platform = "Any CPU"
)

# Restores NuGet packages
Write-Host "Restoring NuGet packages ..." -ForegroundColor Green

nuget restore .\commonservicelocator.sln

Write-Host "NuGet packages restored" -ForegroundColor Green

# Builds solution
Write-Host "Building commonservicelocator.sln ..." -ForegroundColor Green

msbuild .\commonservicelocator.sln /t:Rebuild /p:Configuration=$Configuration /p:Platform=$Platform

Write-Host "commonservicelocator.sln built" -ForegroundColor Green

# Builds NuGet package

Write-Host "Building NuGet package..." -ForegroundColor Green

# dotnet pack .\src\Microsoft.Practices.ServiceLocation\Microsoft.Practices.ServiceLocation.csproj --configuration $Configuration --include-symbols --no-build --output "bin\$Configuration"

Write-Host "NuGet package built" -ForegroundColor Green
