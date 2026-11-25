# api.api.KudosApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getColleagues**](KudosApi.md#getcolleagues) | **GET** /kudos/colleagues | 
[**getKudosReceived**](KudosApi.md#getkudosreceived) | **GET** /kudos/received/{employeeId} | 
[**getKudosWall**](KudosApi.md#getkudoswall) | **GET** /kudos | 
[**giveKudos**](KudosApi.md#givekudos) | **POST** /kudos | 
[**removeKudos**](KudosApi.md#removekudos) | **DELETE** /kudos/{id} | 


# **getColleagues**
> List<Colleague> getColleagues()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getKudosApi();

try {
    final response = api.getColleagues();
    print(response);
} catch on DioException (e) {
    print('Exception when calling KudosApi->getColleagues: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;Colleague&gt;**](Colleague.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getKudosReceived**
> List<Kudos> getKudosReceived(employeeId, from, to)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getKudosApi();
final int employeeId = 56; // int | 
final String from = from_example; // String | 
final String to = to_example; // String | 

try {
    final response = api.getKudosReceived(employeeId, from, to);
    print(response);
} catch on DioException (e) {
    print('Exception when calling KudosApi->getKudosReceived: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employeeId** | **int**|  | 
 **from** | **String**|  | [optional] 
 **to** | **String**|  | [optional] 

### Return type

[**List&lt;Kudos&gt;**](Kudos.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getKudosWall**
> List<Kudos> getKudosWall(limit)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getKudosApi();
final int limit = 56; // int | 

try {
    final response = api.getKudosWall(limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling KudosApi->getKudosWall: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**|  | [optional] [default to 60]

### Return type

[**List&lt;Kudos&gt;**](Kudos.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **giveKudos**
> Kudos giveKudos(kudosRequest)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getKudosApi();
final KudosRequest kudosRequest = ; // KudosRequest | 

try {
    final response = api.giveKudos(kudosRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling KudosApi->giveKudos: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kudosRequest** | [**KudosRequest**](KudosRequest.md)|  | 

### Return type

[**Kudos**](Kudos.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeKudos**
> MessageResponse removeKudos(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getKudosApi();
final int id = 56; // int | 

try {
    final response = api.removeKudos(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling KudosApi->removeKudos: $e\n');
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

