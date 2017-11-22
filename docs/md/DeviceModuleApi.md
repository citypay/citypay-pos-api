# DeviceModuleApi

All URIs are relative to *https://pos.citypay.com/citypay-pos-api/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deviceInfo**](DeviceModuleApi.md#deviceInfo) | **GET** /device/{deviceId}/info | Device Information
[**ping**](DeviceModuleApi.md#ping) | **GET** /device/{deviceId}/ping | Device Ping


<a name="deviceInfo"></a>
# **deviceInfo**
> DeviceInfo deviceInfo(deviceId)

Device Information

Obtains information regarding the device and to review the current status of a device such as the battery charge, serial number and device type. 

### Example
```java
// Import classes:
//import com.citypay.pos.ApiException;
//import com.citypay.pos.api.DeviceModuleApi;


DeviceModuleApi apiInstance = new DeviceModuleApi();
String deviceId = "deviceId_example"; // String | The name of the target device used by the API.
try {
    DeviceInfo result = apiInstance.deviceInfo(deviceId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DeviceModuleApi#deviceInfo");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| The name of the target device used by the API. |

### Return type

[**DeviceInfo**](DeviceInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

<a name="ping"></a>
# **ping**
> Result ping(deviceId)

Device Ping

To monitor or to check whether a device is available, the host can send a simple &#x60;GET&#x60; request to the URL at &#x60;/device/{deviceId}/ping&#x60; to see if the device is responding and available. 

### Example
```java
// Import classes:
//import com.citypay.pos.ApiException;
//import com.citypay.pos.api.DeviceModuleApi;


DeviceModuleApi apiInstance = new DeviceModuleApi();
String deviceId = "deviceId_example"; // String | The name of the target device used by the API.
try {
    Result result = apiInstance.ping(deviceId);
    System.out.println(result);
} catch (ApiException e) {
    System.err.println("Exception when calling DeviceModuleApi#ping");
    e.printStackTrace();
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| The name of the target device used by the API. |

### Return type

[**Result**](Result.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

