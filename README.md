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

- Android Client  https://github.com/citypay/citypay-pos-android-client 
- Java Client https://github.com/citypay/citypay-pos-java-client 
- Java PHP https://github.com/citypay/citypay-pos-php-client 


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



