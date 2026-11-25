# api.api.HolidayApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addHoliday**](HolidayApi.md#addholiday) | **POST** /holiday/add_holiday | 
[**deleteHoliday**](HolidayApi.md#deleteholiday) | **DELETE** /holiday/{id} | 
[**getHolidays**](HolidayApi.md#getholidays) | **GET** /holiday | 
[**getNumberOfWorkingDays**](HolidayApi.md#getnumberofworkingdays) | **GET** /holiday/number-of-working-days | 


# **addHoliday**
> MessageResponse addHoliday(holidayRequest)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getHolidayApi();
final HolidayRequest holidayRequest = ; // HolidayRequest | 

try {
    final response = api.addHoliday(holidayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling HolidayApi->addHoliday: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **holidayRequest** | [**HolidayRequest**](HolidayRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteHoliday**
> MessageResponse deleteHoliday(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getHolidayApi();
final int id = 56; // int | 

try {
    final response = api.deleteHoliday(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling HolidayApi->deleteHoliday: $e\n');
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

# **getHolidays**
> List<Holiday> getHolidays(startDate, endDate)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getHolidayApi();
final String startDate = startDate_example; // String | 
final String endDate = endDate_example; // String | 

try {
    final response = api.getHolidays(startDate, endDate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling HolidayApi->getHolidays: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **startDate** | **String**|  | [optional] 
 **endDate** | **String**|  | [optional] 

### Return type

[**List&lt;Holiday&gt;**](Holiday.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNumberOfWorkingDays**
> Map<String, Object> getNumberOfWorkingDays(startDate, endDate)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getHolidayApi();
final String startDate = startDate_example; // String | 
final String endDate = endDate_example; // String | 

try {
    final response = api.getNumberOfWorkingDays(startDate, endDate);
    print(response);
} catch on DioException (e) {
    print('Exception when calling HolidayApi->getNumberOfWorkingDays: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **startDate** | **String**|  | [optional] 
 **endDate** | **String**|  | [optional] 

### Return type

**Map&lt;String, Object&gt;**

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

