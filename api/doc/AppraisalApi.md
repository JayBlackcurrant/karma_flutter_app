# api.api.AppraisalApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAppraisal**](AppraisalApi.md#getappraisal) | **GET** /appraisal/{id} | 
[**getAppraisalAnswers**](AppraisalApi.md#getappraisalanswers) | **GET** /appraisal/{id}/answers | 
[**getAppraisalCycles**](AppraisalApi.md#getappraisalcycles) | **GET** /appraisal/cycles | 
[**getMyAppraisals**](AppraisalApi.md#getmyappraisals) | **GET** /appraisal/my | 
[**saveAppraisalAnswers**](AppraisalApi.md#saveappraisalanswers) | **PUT** /appraisal/{id}/answers | 


# **getAppraisal**
> Appraisal getAppraisal(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAppraisalApi();
final int id = 56; // int | 

try {
    final response = api.getAppraisal(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AppraisalApi->getAppraisal: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Appraisal**](Appraisal.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAppraisalAnswers**
> AppraisalAnswers getAppraisalAnswers(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAppraisalApi();
final int id = 56; // int | 

try {
    final response = api.getAppraisalAnswers(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AppraisalApi->getAppraisalAnswers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AppraisalAnswers**](AppraisalAnswers.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAppraisalCycles**
> List<AppraisalCycle> getAppraisalCycles()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAppraisalApi();

try {
    final response = api.getAppraisalCycles();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AppraisalApi->getAppraisalCycles: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;AppraisalCycle&gt;**](AppraisalCycle.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyAppraisals**
> List<Appraisal> getMyAppraisals()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAppraisalApi();

try {
    final response = api.getMyAppraisals();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AppraisalApi->getMyAppraisals: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;Appraisal&gt;**](Appraisal.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveAppraisalAnswers**
> Appraisal saveAppraisalAnswers(id, saveAnswersRequest)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAppraisalApi();
final int id = 56; // int | 
final SaveAnswersRequest saveAnswersRequest = ; // SaveAnswersRequest | 

try {
    final response = api.saveAppraisalAnswers(id, saveAnswersRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AppraisalApi->saveAppraisalAnswers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **saveAnswersRequest** | [**SaveAnswersRequest**](SaveAnswersRequest.md)|  | 

### Return type

[**Appraisal**](Appraisal.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

