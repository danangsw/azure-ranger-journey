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
#Create a Models directory and empty Product.cs file
mkdir Models && touch $_/Product.cs

#Update file explorer by clicking the editor's refresh icon.
#Add the following code to Models/Product.cs
#Copy/paste code in Product.cs file

#Create a Data directory in the project root with empty ProductsContext.cs and SeedData.cs files.
mkdir Data && touch $_/ProductsContext.cs $_/SeedData.cs

#Refresh file explorer, and add the following code to Data/ProductsContext.cs.
#Copy/paste code in ProductsContext.cs file
#Save your changes.

#Replace the Startup.cs code with Startup.cs file
#Add the following code to Data/SeedData.cs from SeedData.cs. Save your changes.

#Build the web API Project
dotnet build

#Add a controller
#Create an empty class file named ProductsController.cs the Controllers directory. 
touch ./Controllers/ProductsController.cs

#Refresh file explorer, and add the following code to Controllers/ProductsController.cs from ProductsController.cs file. Save your changes.

#Start the web API by running the following command:
dotnet run > RetailApi.log &

#Run the web API project by the following command:
curl -k -s https://localhost:5001/api/products | python -m json.tool

#Response result:
#[
#  {
#    "id": 1,
#    "name": "Squeaky Bone",
#    "price": 20.99
#  },
#  {
#    "id": 2,
#    "name": "Knotted Rope",
#    "price": 12.99
#  }
#]

#Test web API actions
#1. Send an invalid HTTP POST request to the web API:
curl -v -k \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"Plush Squirrel\",\"price\":0.00}" \
    https://localhost:5001/api/Products
    
#In the preceding command:
# -v enables verbose output.
# -d implies an HTTP POST operation and defines the request body.
# -H indicates that the request body is in JSON format. The header's value overrides the default content type of application/x-www-form-urlencoded.

#Response result:
# < HTTP/1.1 400 Bad Request
# < Date: Fri, 18 Jan 2019 22:20:10 GMT
# < Content-Type: application/problem+json; charset=utf-8
# < Server: Kestrel
# < Transfer-Encoding: chunked
# <
# * Connection #0 to host localhost left intact
# {
#   "errors": {
#     "Price": ["The field Price must be between 0.01 and 7.92281625142643E+28."]
#   },
#   title": "One or more validation errors occurred.",
#   "status": 400,
#   "traceId":"0HLJTI2R5GKOJ:00000001"
# }

#2. Send a valid HTTP POST request to the web API:
curl -v -k \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"Plush Squirrel\",\"price\":12.99}" \
    https://localhost:5001/api/Products
    
#Response result:
# < HTTP/1.1 201 Created
# < Date: Fri, 18 Jan 2019 22:23:49 GMT
# < Content-Type: application/json; charset=utf-8
# < Server: Kestrel
# < Transfer-Encoding: chunked
# < Location: https://localhost:5001/api/Products/3
# <
# * Connection #0 to host localhost left intact
# {
#   "id": 3,
#   "name": "Plush Squirrel",
#   "price": 12.99
# }

#3. Send an valid HTTP GET request to the web API:
curl -k -s https://localhost:5001/api/Products/3 | python -m json.tool

#Response result:
# {
#   "id": 3,
#   "name": "Plush Squirrel",
#   "price": 12.99
# }

#4. Send an invalid HTTP GET request to the web API:
curl -k -s https://localhost:5001/api/Products/13 | python -m json.tool

#Response result:
# {
#     "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
#     "title": "Not Found",
#     "status": 404,
#     "traceId": "0HLKC2T3HK3NC:00000001"
# }

#5. Send an HTTP PUT request to the web API:
curl -k -X PUT \
    -H "Content-Type: application/json" \
    -d "{\"id\":2,\"name\":\"Knotted Rope\",\"price\":14.99}" \
    https://localhost:5001/api/Products/2

#Response result: no result

#6. Send an HTTP DELETE request to the web API:
curl -v -k -X DELETE https://localhost:5001/api/Products/1

#Response result:
# < HTTP/1.1 204 No Content
# < Date: Wed, 06 Feb 2019 09:51:39 GMT
# < Server: Kestrel
# <
# * Connection #0 to host localhost left intact

#Stop all running .NET Core apps:
kill $(pidof dotnet)
