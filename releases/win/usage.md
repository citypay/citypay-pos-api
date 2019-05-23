CityPay Pos Api .Net
===

The latest version the .Net Pos Api client is available 
from https://github.com/citypay/citypay-pos-api/tree/master/releases 

The windows release target version 4.6 of .Net

The releases folder will contain a zip of the release and a sha512 digest
file to verify the contents.

The zip file contains dlls necessary to integrate into the pos-api service
  
 * AutoMapper.dll  
 * CityPay.Pos.Api.dll - citypay api client in .net
 * CityPay.Pos.Impl.dll - main implementation which connects the api and devices
 * CityPay.Pos.Kinetic.dll - citypay kinetic client in .net
 * Newtonsoft.Json.dll - json implementation 
 * RestSharp.dlluse CityPay.Pos.Impl;
 * System.ValueTuple.dll
 
## Device Setup 

Initially you will need to setup a device that the client will communicate to. 
The device can be created and registered with a `DeviceFactory` which should 
subsequently be saved within a device manager. 

Device managers can be setup for a local instance programmatically. The device 
manager will be used later to target a device for payment. 
 
```csharp 
...

IDeviceManager dmgr = new DeviceManager();

//deviceName - anything you choose
//DeviceDriveId - only Kinetic/IP supported at present
Device d = DeviceFactory.Create(deviceName:"Device1", DeviceDriverId:"Kinetic/IP");
d.Address = "192.168.7.169";
d.Username = "username";
d.Password = "password";
d.AuthenticationType = AuthenticationType.Basic;
dmgr.save(d);

dmgr.list();
```

	
## DeviceApi

The device API is used to check a device is available and to obtain information on a device. 

```csharp
use CityPay.Pos.Impl;

...
DeviceModule dm = new DeviceModule(dmgr);
var pingResult=dm.ping(dmgr.list()[0].FriendlyDeviceId);
var devInfoResult = await dm.deviceInformation(dmgr.list()[0].FriendlyDeviceId);	

```
	
## PaymentApi

The payment API is used to conduct sales and refunds with the device.

```csharp
CityPay.Pos;
use CityPay.Pos.Impl;

...

PaymentModule pm;
public async Task WaitForTransactionCompletion(string txId)
{
    Api.Model.TransactionProgress request = new Api.Model.TransactionProgress(dmgr.list()[0].FriendlyDeviceId,txId);
    int attempts = 0;
    do
    { result = await pm.transactionStatus(request);
        await Task.Delay(1000);
        attempts++;
        Debug.WriteLine(string.Format("Waiting for transaction completion {0}", attempts));
    }
    while ((!(result.Success.HasValue && result.Success.Value) && attempts < 20));
    if (attempts==20) throw new ApplicationExcption("Transaction not complete");
}

...

try
{
    pm=new PaymentModule(dmgr);
    
    //sale
    // Amount in pence
    // Identifier unique transaction id
    var txId=Guid.NewGuid().ToString();
    var saleRequest = new Api.Model.SaleRequest(dmgr.list()[0].FriendlyDeviceId, Amount:199, Identifier:txId);
    var saleResult = await pm.sale(saleRequest);
    
    WaitForTransactionCompletion();// before any other api calls
    
    // receipt
    var receiptRequest = new Api.Model.PrintRequest(dmgr.list()[0].FriendlyDeviceId, txId);
    var receiptResult = await pm.receipt(receiptRequest);

    WaitForTransactionCompletion();// before any other api calls
    
    // refund
    var txId2=Guid.NewGuid().ToString();
    var refundRequest = new Api.Model.SaleRequest(dmgr.list()[0].FriendlyDeviceId, Amount:1050, txId2);
    var refundResult = await pm.refund(refundRequest);
    
    WaitForTransactionCompletion();// before any other api calls

    // reverse previous sale
    reversalRequest = new Api.Model.ReversalRequest(dmgr.list()[0].FriendlyDeviceId,  txId);
    reversalResult = await pm.reversal(reversalRequest);
}
catch (Exception ex)
{
    Console.WriteLine(ex.Message);
}
	
```	