# ---------- BUILD ----------
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

RUN apt-get update && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs
RUN npm install -g pnpm

COPY src/Directory.Packages.props ./Directory.Packages.props
COPY src/global.json ./global.json
COPY src/GZCTF/GZCTF.csproj src/GZCTF/

RUN dotnet restore src/GZCTF/GZCTF.csproj

COPY . .

RUN dotnet publish src/GZCTF/GZCTF.csproj \
    -c Release \
    -o /app/publish


# ---------- RUNTIME ----------
FROM mcr.microsoft.com/dotnet/aspnet:10.0

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libgdiplus \
    tzdata \
    ca-certificates \
    wget \
    libkrb5-3

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
    ASPNETCORE_URLS=http://0.0.0.0:8080

COPY --from=build /app/publish .

EXPOSE 8080

ENTRYPOINT ["dotnet", "GZCTF.dll"]
