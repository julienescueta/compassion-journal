FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 59518
EXPOSE 44364

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY CompassionJournalApp/CompassionJournalApp.csproj CompassionJournalApp/
RUN dotnet restore CompassionJournalApp/CompassionJournalApp.csproj
COPY . ./
WORKDIR /src/CompassionJournalApp
RUN dotnet build CompassionJournalApp.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish CompassionJournalApp.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "CompassionJournalApp.dll"]
