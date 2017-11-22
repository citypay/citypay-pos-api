
# SaleRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**device** | **String** | The name of the target device used by the API. The device will be setup prior to the sale but allows targeting of multiple devices. | 
**amount** | **Integer** | The amount to process in the lowest denomination and in the base currency of the device. 4798 for instance would process the transaction for £47.98 | 
**identifier** | **String** | An identifier or reference for the sale as taken by the point of sale system. This should be used to cross reference transactions after it has processed. The value should be unique and will be used to check on the processing of the transaction. | 



