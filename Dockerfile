FROM mcr.microsoft.com/dotnet/core/sdk AS build
WORKDIR /build
COPY . .
RUN dotnet build --configuration Release

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
WORKDIR /app
COPY --from=build /build/AzWebApp/bin/Release/netcoreapp3.1/ .
CMD ["dotnet","AzWebApp.dll"]
