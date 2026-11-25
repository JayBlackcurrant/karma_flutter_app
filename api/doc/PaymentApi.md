# api.api.PaymentApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSlipDownloadLink**](PaymentApi.md#getslipdownloadlink) | **GET** /payment/get-download-link/{id} | 
[**getUserPayments**](PaymentApi.md#getuserpayments) | **GET** /payment/get-user-payments | 


# **getSlipDownloadLink**
> DownloadLink getSlipDownloadLink(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getPaymentApi();
final int id = 56; // int | 

try {
    final response = api.getSlipDownloadLink(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PaymentApi->getSlipDownloadLink: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**DownloadLink**](DownloadLink.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserPayments**
> List<Payment> getUserPayments()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getPaymentApi();

try {
    final response = api.getUserPayments();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PaymentApi->getUserPayments: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;Payment&gt;**](Payment.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

