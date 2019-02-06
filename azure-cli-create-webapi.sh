#Create a web API from Scaffold web API project
#Run the following .NET Core CLI command
dotnet new webapi -o RetailApi

#Go to code directory
cd ./RetailApi

#Open RetailApi project in Azure Cloud Shell Editor
code .

#Build
dotnet run > RetailApi.log &

#Send an HTTP GET request to the web API:
curl -k -s https://localhost:5001/api/values | python -m json.tool

#Stop dotnet service
kill $(pidof dotnet)

#Add a data store
