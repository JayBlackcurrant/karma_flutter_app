# api.api.AttendanceApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMyMonths**](AttendanceApi.md#getmymonths) | **GET** /attendance/my | 
[**getMyReport**](AttendanceApi.md#getmyreport) | **GET** /attendance/my/{month} | 


# **getMyMonths**
> List<AttendanceMonth> getMyMonths()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAttendanceApi();

try {
    final response = api.getMyMonths();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AttendanceApi->getMyMonths: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;AttendanceMonth&gt;**](AttendanceMonth.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyReport**
> AttendanceReport getMyReport(month)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAttendanceApi();
final String month = month_example; // String | 

try {
    final response = api.getMyReport(month);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AttendanceApi->getMyReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **month** | **String**|  | 

### Return type

[**AttendanceReport**](AttendanceReport.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

