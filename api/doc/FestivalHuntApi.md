# api.api.FestivalHuntApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getActiveHunt**](FestivalHuntApi.md#getactivehunt) | **GET** /festival-hunt/active | 
[**getFestivalTheme**](FestivalHuntApi.md#getfestivaltheme) | **GET** /festival-hunt/theme | 


# **getActiveHunt**
> ActiveHuntResponse getActiveHunt()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getFestivalHuntApi();

try {
    final response = api.getActiveHunt();
    print(response);
} catch on DioException (e) {
    print('Exception when calling FestivalHuntApi->getActiveHunt: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ActiveHuntResponse**](ActiveHuntResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFestivalTheme**
> FestivalThemeResponse getFestivalTheme()



### Example
```dart
import 'package:api/api.dart';

final api = Api().getFestivalHuntApi();

try {
    final response = api.getFestivalTheme();
    print(response);
} catch on DioException (e) {
    print('Exception when calling FestivalHuntApi->getFestivalTheme: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**FestivalThemeResponse**](FestivalThemeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

