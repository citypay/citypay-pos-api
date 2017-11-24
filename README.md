CityPay POS API
===============

CityPay's Point of Sale API is a full, standalone payment interface for secure payment devices. 

The API:
   
- Allows for EMV card acceptance to any system whether web or mobile frameworks on iOS, Android or desktop, essentially 
    anything that talks HTTP
- Defers the complexity and security of payment processes to a segregated device
- Has devices already accredited with leading UK Acquiring Banks

## Generated Clients

We have provided a number of clients to use with the API available at

- [Android Client](https://github.com/citypay/citypay-pos-android-client) 
- [Java Client](https://github.com/citypay/citypay-pos-java-client) 
- [JavaScript Client](https://github.com/citypay/citypay-pos-javascript-client) 
- [PHP Client](https://github.com/citypay/citypay-pos-php-client) 
- [C# Client](https://github.com/citypay/citypay-pos-csharp-client) 
- [Go Client](https://github.com/citypay/citypay-pos-go-client) 
- [Python Client](https://github.com/citypay/citypay-pos-python-client) 
- [Scala Akka Client](https://github.com/citypay/citypay-pos-akka-scala-client) 


## API Overview

The API is written using [Swagger](https://swagger.io) and can easily generate client code using the [Swagger Codegen](https://swagger.io/swagger-codegen/) 
project. These will work with the centralised CityPay pos server however for portable devices, a pre-built library will
be required which bridges between this API and the device drivers directly. Supported applications are provided directly
by modules within this project.

## API Specification

API documentation can be created by running the `build-docs.sh` script. You will need a docker
runtime to run the process. 


Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DeviceModuleApi* | [**deviceInfo**](docs/md/DeviceModuleApi.md#deviceInfo) | **GET** /device/{deviceId}/info | Device Information
*DeviceModuleApi* | [**ping**](docs/md/DeviceModuleApi.md#ping) | **GET** /device/{deviceId}/ping | Device Ping
*PaymentModuleApi* | [**receipt**](docs/md/PaymentModuleApi.md#receipt) | **POST** /receipt | Receipt Print
*PaymentModuleApi* | [**refund**](docs/md/PaymentModuleApi.md#refund) | **POST** /refund | Refund Transaction
*PaymentModuleApi* | [**reversal**](docs/md/PaymentModuleApi.md#reversal) | **POST** /reversal | Reversal Tranasction
*PaymentModuleApi* | [**sale**](docs/md/PaymentModuleApi.md#sale) | **POST** /sale | Sale Transaction
*PaymentModuleApi* | [**transaction**](docs/md/PaymentModuleApi.md#transaction) | **POST** /transaction | Transaction Status


## Documentation for Models

 - [DeviceInfo](docs/md/DeviceInfo.md)
 - [PrintRequest](docs/md/PrintRequest.md)
 - [Receipt](docs/md/Receipt.md)
 - [Result](docs/md/Result.md)
 - [ReversalRequest](docs/md/ReversalRequest.md)
 - [SaleRequest](docs/md/SaleRequest.md)
 - [SaleResponse](docs/md/SaleResponse.md)
 - [SuccessResponse](docs/md/SuccessResponse.md)
 - [TransactionData](docs/md/TransactionData.md)
 - [TransactionProgress](docs/md/TransactionProgress.md)
 - [TransactionResult](docs/md/TransactionResult.md)



## Included Scripts

The scripts are intended to be run in Linux or Mac OS and requires docker to be installed.

The following scripts are included for working with the api

### `build-clients.sh`

Bulk builds and initalises client libraries in "android" "php" "java" "akka-scala" "python" "javascript" "go" "csharp" "typescript-angular".

An integrator is recommended to manually clone the client library from its respective Github 
location rather than running this script. The script will attempt to initially clone each languages
repository from Github first. 

### `build-docs.sh`

Builds the documentation into the _docs_ directory

### `mock-server.sh`

Runs a mock server on port 8000 using [swagger-mock-api](https://www.npmjs.com/package/swagger-mock-api)

HTTP headers for Cross-Origin Resource Sharing (CORS) are automatically set to allow any kind of access.

| Header | Value |
| -------|-------|
| Access-Control-Allow-Origin | If the HTTP request includes an Origin header, then this value is echoed back; otherwise value is a wildcard * |
| Access-Control-Allow-Credentials | If the Access-Control-Allow-Origin is a wildcard * value is false; otherwise true. |
| Access-Control-Allow-Methods | All HTTP methods are always sent. |
| Access-Control-Allow-Headers | If the HTTP request includes an Access-Control-Request-Headers header, then this value is echoed back; otherwise it is not set. |
