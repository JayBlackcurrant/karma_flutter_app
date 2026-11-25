# api.api.NoticeApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acknowledgeNotice**](NoticeApi.md#acknowledgenotice) | **POST** /notice/{id}/acknowledge | 
[**addNotice**](NoticeApi.md#addnotice) | **POST** /notice | 
[**deleteNotice**](NoticeApi.md#deletenotice) | **DELETE** /notice/{id} | 
[**editNotice**](NoticeApi.md#editnotice) | **PUT** /notice/{id} | 
[**getNoticeAcknowledgements**](NoticeApi.md#getnoticeacknowledgements) | **GET** /notice/{id}/acknowledgements | 
[**getNotices**](NoticeApi.md#getnotices) | **GET** /notice | 


# **acknowledgeNotice**
> MessageResponse acknowledgeNotice(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getNoticeApi();
final int id = 56; // int | 

try {
    final response = api.acknowledgeNotice(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NoticeApi->acknowledgeNotice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addNotice**
> MessageResponse addNotice(noticeRequest)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getNoticeApi();
final NoticeRequest noticeRequest = ; // NoticeRequest | 

try {
    final response = api.addNotice(noticeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NoticeApi->addNotice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **noticeRequest** | [**NoticeRequest**](NoticeRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteNotice**
> MessageResponse deleteNotice(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getNoticeApi();
final int id = 56; // int | 

try {
    final response = api.deleteNotice(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NoticeApi->deleteNotice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editNotice**
> MessageResponse editNotice(id, noticeRequest)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getNoticeApi();
final int id = 56; // int | 
final NoticeRequest noticeRequest = ; // NoticeRequest | 

try {
    final response = api.editNotice(id, noticeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NoticeApi->editNotice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **noticeRequest** | [**NoticeRequest**](NoticeRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNoticeAcknowledgements**
> NoticeAcknowledgements getNoticeAcknowledgements(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getNoticeApi();
final int id = 56; // int | 

try {
    final response = api.getNoticeAcknowledgements(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NoticeApi->getNoticeAcknowledgements: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**NoticeAcknowledgements**](NoticeAcknowledgements.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotices**
> List<Notice> getNotices()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getNoticeApi();

try {
    final response = api.getNotices();
    print(response);
} catch on DioException (e) {
    print('Exception when calling NoticeApi->getNotices: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;Notice&gt;**](Notice.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

