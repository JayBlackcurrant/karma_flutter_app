# api.api.EmployeeApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createEmployee**](EmployeeApi.md#createemployee) | **POST** /employee | 
[**editEmployee**](EmployeeApi.md#editemployee) | **PUT** /employee/{id} | 
[**getAbsentEmployees**](EmployeeApi.md#getabsentemployees) | **GET** /employee/get-absent-employees | 
[**getAllEmployeeDetails**](EmployeeApi.md#getallemployeedetails) | **GET** /employee | 
[**getEmployeeDetails**](EmployeeApi.md#getemployeedetails) | **GET** /employee/{id} | 
[**getEmployeeEvents**](EmployeeApi.md#getemployeeevents) | **GET** /employee/events | 


# **createEmployee**
> MessageResponse createEmployee(employee)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getEmployeeApi();
final Employee employee = ; // Employee | 

try {
    final response = api.createEmployee(employee);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeApi->createEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee** | [**Employee**](Employee.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editEmployee**
> MessageResponse editEmployee(id, employee)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getEmployeeApi();
final int id = 56; // int | 
final Employee employee = ; // Employee | 

try {
    final response = api.editEmployee(id, employee);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeApi->editEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **employee** | [**Employee**](Employee.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAbsentEmployees**
> List<AbsentEmployee> getAbsentEmployees()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getEmployeeApi();

try {
    final response = api.getAbsentEmployees();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeApi->getAbsentEmployees: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;AbsentEmployee&gt;**](AbsentEmployee.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllEmployeeDetails**
> List<Employee> getAllEmployeeDetails()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getEmployeeApi();

try {
    final response = api.getAllEmployeeDetails();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeApi->getAllEmployeeDetails: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;Employee&gt;**](Employee.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEmployeeDetails**
> Employee getEmployeeDetails(id)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getEmployeeApi();
final int id = 56; // int | 

try {
    final response = api.getEmployeeDetails(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeApi->getEmployeeDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Employee**](Employee.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEmployeeEvents**
> EmployeeEvents getEmployeeEvents()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getEmployeeApi();

try {
    final response = api.getEmployeeEvents();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeApi->getEmployeeEvents: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**EmployeeEvents**](EmployeeEvents.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

