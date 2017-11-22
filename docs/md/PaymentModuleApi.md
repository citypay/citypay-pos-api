# PaymentModuleApi

All URIs are relative to *https://pos.citypay.com/citypay-pos-api/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**receipt**](PaymentModuleApi.md#receipt) | **POST** /receipt | Receipt Print
[**refund**](PaymentModuleApi.md#refund) | **POST** /refund | Refund Transaction
[**reversal**](PaymentModuleApi.md#reversal) | **POST** /reversal | Reversal Tranasction
[**sale**](PaymentModuleApi.md#sale) | **POST** /sale | Sale Transaction
[**transaction**](PaymentModuleApi.md#transaction) | **POST** /transaction | Transaction Status


<a name="receipt"></a>
# **receipt**
> TransactionResult receipt(body)

Receipt Print

Reprint a merchant or customer receipt for a transaction that exists on the device (i.e. has not been cleared by End of Day process). 

### Example
```java
// Import classes:
//import com.citypay.pos.ApiException;
//import com.citypay.pos.api.PaymentModuleApi;


PaymentModuleApi apiInstance = new PaymentModuleApi();
TransactionProgress body = new TransactionProgress(); // TransactionProgress | 
try {
    TransactionResult result = apiInstance.receipt(body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PaymentModuleApi#receipt");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransactionProgress**](TransactionProgress.md)|  | [optional]

### Return type

[**TransactionResult**](TransactionResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="refund"></a>
# **refund**
> SaleResponse refund(body)

Refund Transaction

Initiates a new refund to a device. The action will contact the device and request a transaction start including the amount and a unique reference to track the transaction through it&#39;s lifecycle. 

### Example
```java
// Import classes:
//import com.citypay.pos.ApiException;
//import com.citypay.pos.api.PaymentModuleApi;


PaymentModuleApi apiInstance = new PaymentModuleApi();
SaleRequest body = new SaleRequest(); // SaleRequest | 
try {
    SaleResponse result = apiInstance.refund(body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PaymentModuleApi#refund");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SaleRequest**](SaleRequest.md)|  |

### Return type

[**SaleResponse**](SaleResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="reversal"></a>
# **reversal**
> SaleResponse reversal(body)

Reversal Tranasction

Initiates a reversal to a device. No confirmation is made and the transaction reversal process is run. 

### Example
```java
// Import classes:
//import com.citypay.pos.ApiException;
//import com.citypay.pos.api.PaymentModuleApi;


PaymentModuleApi apiInstance = new PaymentModuleApi();
ReversalRequest body = new ReversalRequest(); // ReversalRequest | 
try {
    SaleResponse result = apiInstance.reversal(body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PaymentModuleApi#reversal");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ReversalRequest**](ReversalRequest.md)|  |

### Return type

[**SaleResponse**](SaleResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="sale"></a>
# **sale**
> SaleResponse sale(body)

Sale Transaction

Initiates a new sale to a device. The action will contact the device and request a transaction start including the amount and a unique reference to track the transaction through it&#39;s lifecycle. 

### Example
```java
// Import classes:
//import com.citypay.pos.ApiException;
//import com.citypay.pos.api.PaymentModuleApi;


PaymentModuleApi apiInstance = new PaymentModuleApi();
SaleRequest body = new SaleRequest(); // SaleRequest | 
try {
    SaleResponse result = apiInstance.sale(body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PaymentModuleApi#sale");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SaleRequest**](SaleRequest.md)|  |

### Return type

[**SaleResponse**](SaleResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="transaction"></a>
# **transaction**
> TransactionResult transaction(body)

Transaction Status

Request the status of a transaction in progress or a complete transaction using the identifier as the reference. Depending on the state of the transaction, the response will indicate if it is not found, in progress (and the current stage in the transaction workflow) or complete (with all transaction data). 

### Example
```java
// Import classes:
//import com.citypay.pos.ApiException;
//import com.citypay.pos.api.PaymentModuleApi;


PaymentModuleApi apiInstance = new PaymentModuleApi();
TransactionProgress body = new TransactionProgress(); // TransactionProgress | 
try {
    TransactionResult result = apiInstance.transaction(body);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling PaymentModuleApi#transaction");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransactionProgress**](TransactionProgress.md)|  | [optional]

### Return type

[**TransactionResult**](TransactionResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

