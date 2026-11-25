# api.api.SettingApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSettings**](SettingApi.md#getsettings) | **GET** /setting/list_settings | 
[**updateSettings**](SettingApi.md#updatesettings) | **PATCH** /setting/update_settings | 


# **getSettings**
> Settings getSettings()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getSettingApi();

try {
    final response = api.getSettings();
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingApi->getSettings: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Settings**](Settings.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSettings**
> Settings updateSettings(settings)



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getSettingApi();
final Settings settings = ; // Settings | 

try {
    final response = api.updateSettings(settings);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingApi->updateSettings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **settings** | [**Settings**](Settings.md)|  | 

### Return type

[**Settings**](Settings.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

