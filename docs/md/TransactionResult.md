
# TransactionResult

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **String** | A description of the status of a transaction |  [optional]
**identifier** | **String** | The indentifier uniquely identifying the transaction |  [optional]
**isComplete** | **Boolean** | A boolean value stating whether the transaction has completed. The value will be false if the transaction is in progress. Should the value be true, a property containing the transaction details is made available. |  [optional]
**data** | [**TransactionData**](TransactionData.md) |  |  [optional]



