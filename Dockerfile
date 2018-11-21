FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 59518
EXPOSE 44364

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY CompassionJournal/CompassionJournal.csproj CompassionJournal/
RUN dotnet restore CompassionJournal/CompassionJournal.csproj
COPY . .
WORKDIR /src/CompassionJournal
RUN dotnet build CompassionJournal.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish CompassionJournal.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "CompassionJournal.dll"]
