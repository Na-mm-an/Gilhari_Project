REM
REM A script to invoke some sample curl commands on a Windows machine
REM against a running container image of the app-specific Gilhari microservice.
REM
REM The responses are recorded in a log file (curl.log).
REM
REM Note that these curl commands use a default mapped port number of 80
REM even though the port number exposed by the app-specific
REM microservice may be different (e.g., 8082) inside the container shell.
REM
REM You may optionally specify a non-default port number as the first
REM command line argument to this script. For example, to specify a
REM port number of 8899, use the following command:
REM     curlCommands 8899

IF %1.==. GOTO DefaultPort
SET port=%1
GOTO Proceed

:DefaultPort
SET port=80
GOTO Proceed

:Proceed

echo ** BEGIN OUTPUT ** > curl.log
echo. >> curl.log

echo Using PORT number %port% >> curl.log
echo. >> curl.log

REM Delete all Customer objects to start fresh
echo ** Delete all Customer objects to start fresh >> curl.log
curl -X DELETE "http://localhost:%port%/gilhari/v1/Customer" >> curl.log
echo. >> curl.log
echo. >> curl.log

REM Insert one Customer object
echo ** Insert one Customer object >> curl.log
curl -X POST "http://localhost:%port%/gilhari/v1/Customer" -H "Content-Type: application/json" -d "{""entity"":{""customer_id"":1,""name"":""Alice"",""email"":""alice@example.com"",""phone"":""1234567890"",""address"":""123 Main St""}}" >> curl.log
echo. >> curl.log
echo. >> curl.log

REM Query all Customer objects
echo ** Query all Customer objects >> curl.log
curl -X GET "http://localhost:%port%/gilhari/v1/Customer" -H "Content-Type: application/json" >> curl.log
echo. >> curl.log
echo. >> curl.log

REM Insert multiple Customer objects
echo ** Insert multiple (two) Customer objects >> curl.log
curl -X POST "http://localhost:%port%/gilhari/v1/Customer" -H "Content-Type: application/json" -d "{""entity"":[{""customer_id"":2,""name"":""Bob"",""email"":""bob@example.com"",""phone"":""2345678901"",""address"":""456 Elm St""}, {""customer_id"":3,""name"":""Charlie"",""email"":""charlie@example.com"",""phone"":""3456789012"",""address"":""789 Oak St""}]}" >> curl.log
echo. >> curl.log
echo. >> curl.log

REM Query all Customer objects
echo ** Query all Customer objects >> curl.log
curl -X GET "http://localhost:%port%/gilhari/v1/Customer" -H "Content-Type: application/json" >> curl.log
echo. >> curl.log
echo. >> curl.log

REM Query a specific Customer object by ID
echo ** Query a specific Customer object by ID >> curl.log
curl -X GET "http://localhost:%port%/gilhari/v1/Customer?filter=customer_id=1" -H "Content-Type: application/json" >> curl.log
echo. >> curl.log
echo. >> curl.log

REM Delete all Customer objects
echo ** Delete all Customer objects >> curl.log
curl -X DELETE "http://localhost:%port%/gilhari/v1/Customer" >> curl.log
echo. >> curl.log
echo. >> curl.log

REM Query the count of all Customer objects
echo ** Query the count of all Customer objects >> curl.log
curl -X GET "http://localhost:%port%/gilhari/v1/Customer/getAggregate?attribute=customer_id&aggregateType=COUNT" -H "Content-Type: application/json" >> curl.log
echo. >> curl.log
echo. >> curl.log

echo ** END OUTPUT ** >> curl.log
echo. >> curl.log

type curl.log
