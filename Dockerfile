FROM mcr.microsoft.com/dotnet/dotnet/sdk:6.0 as build-env
#.net versino should match devContainer

COPY . ./

RUN dotnet restore . 

RUN dotnet publish . -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0 

WORKDIR /App

COPY --from=build /out .

EXPOSE 80

