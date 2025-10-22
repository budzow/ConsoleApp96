dotnet tool uninstall --global dotnet-sonarscanner 
dotnet tool install --global dotnet-sonarscanner --version 10.3
dotnet sonarscanner begin /k:"ConsoleApp96" /d:sonar.host.url=http://l:20255 /d:sonar.cs.vscoveragexml.reportsPaths=coverage.xml /d:sonar.verbose=true
rem msbuild /t:rebuild -v:n
rem dotnet build --no-incremental --verbosity d
dotnet build
dotnet-coverage collect "dotnet test" -f xml -o "coverage.xml"
dotnet sonarscanner end
rm -rf .sonarqube
