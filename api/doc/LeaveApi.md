# api.api.LeaveApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**applyForLeave**](LeaveApi.md#applyforleave) | **POST** /leave | 
[**applyLeaveForUser**](LeaveApi.md#applyleaveforuser) | **POST** /leave/apply_for_user | 
[**cancelLeave**](LeaveApi.md#cancelleave) | **DELETE** /leave/cancel-leave | 
[**getLeaves**](LeaveApi.md#getleaves) | **GET** /leave | 
[**getPastRecords**](LeaveApi.md#getpastrecords) | **GET** /leave/getPastRecords | 
[**getPendingLeaves**](LeaveApi.md#getpendingleaves) | **GET** /leave/getPendingRecords | 
[**markLeave**](LeaveApi.md#markleave) | **POST** /leave/{id} | 
[**refundLeave**](LeaveApi.md#refundleave) | **DELETE** /leave/{id} | 


# **applyForLeave**
> MessageResponse applyForLeave(applyLeaveRequest)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();
final ApplyLeaveRequest applyLeaveRequest = ; // ApplyLeaveRequest | 

try {
    final response = api.applyForLeave(applyLeaveRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->applyForLeave: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **applyLeaveRequest** | [**ApplyLeaveRequest**](ApplyLeaveRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **applyLeaveForUser**
> MessageResponse applyLeaveForUser(applyLeaveForUserRequest)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();
final ApplyLeaveForUserRequest applyLeaveForUserRequest = ; // ApplyLeaveForUserRequest | 

try {
    final response = api.applyLeaveForUser(applyLeaveForUserRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->applyLeaveForUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **applyLeaveForUserRequest** | [**ApplyLeaveForUserRequest**](ApplyLeaveForUserRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelLeave**
> MessageResponse cancelLeave(leaveId)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();
final int leaveId = 56; // int | 

try {
    final response = api.cancelLeave(leaveId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->cancelLeave: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **leaveId** | **int**|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLeaves**
> LeaveSummary getLeaves()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();

try {
    final response = api.getLeaves();
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->getLeaves: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**LeaveSummary**](LeaveSummary.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPastRecords**
> List<Leave> getPastRecords(year)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();
final int year = 56; // int | 

try {
    final response = api.getPastRecords(year);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->getPastRecords: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **year** | **int**|  | [optional] 

### Return type

[**List&lt;Leave&gt;**](Leave.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPendingLeaves**
> List<Leave> getPendingLeaves()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();

try {
    final response = api.getPendingLeaves();
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->getPendingLeaves: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;Leave&gt;**](Leave.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markLeave**
> MessageResponse markLeave(id, leaveId, markLeaveRequest)



Approve / reject. `id` is the employee id (inferred from the web client).

### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();
final int id = 56; // int | 
final int leaveId = 56; // int | 
final MarkLeaveRequest markLeaveRequest = ; // MarkLeaveRequest | 

try {
    final response = api.markLeave(id, leaveId, markLeaveRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->markLeave: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **leaveId** | **int**|  | 
 **markLeaveRequest** | [**MarkLeaveRequest**](MarkLeaveRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refundLeave**
> MessageResponse refundLeave(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getLeaveApi();
final int id = 56; // int | 

try {
    final response = api.refundLeave(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaveApi->refundLeave: $e\n');
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

