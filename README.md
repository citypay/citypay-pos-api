CityPay POS API
===============

CityPay's Point of Sale API is a full, standalone payment interface for secure payment devices. 

The API:
   
- Allows for EMV card acceptance to any system whether web or mobile frameworks on iOS, Android or desktop, essentially 
    anything that talks HTTP
- Defers the complexity and security of payment processes to a segregated device
- Has devices already accredited with leading UK Acquiring Banks

## API Overview

The API is written using [Swagger](https://swagger.io) and can easily generate client code using the [Swagger Codegen](https://swagger.io/swagger-codegen/) 
project. These will work with the centralised CityPay pos server however for portable devices, a pre-built library will
be required which bridges between this API and the device drivers directly. Supported applications are provided directly
by modules within this project.

## API Specification

API documentation can be created by running the `build-docs.sh` script. You will need a docker
runtime to run the process. 

