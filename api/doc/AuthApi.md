# api.api.AuthApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *https://api.karma.blackcurrantlabs.com/production*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgotPassword**](AuthApi.md#forgotpassword) | **POST** /auth/forgotPassword | 
[**getRole**](AuthApi.md#getrole) | **GET** /auth/getRole | 
[**login**](AuthApi.md#login) | **POST** /auth/login | 
[**updatePassword**](AuthApi.md#updatepassword) | **PUT** /auth/updatePassword/{uuid} | 
[**verifyUuid**](AuthApi.md#verifyuuid) | **GET** /auth/verifyUuid/{uuid} | 


# **forgotPassword**
> MessageResponse forgotPassword(forgotPasswordRequest)



### Example
```dart
import 'package:api/api.dart';

final api = Api().getAuthApi();
final ForgotPasswordRequest forgotPasswordRequest = ; // ForgotPasswordRequest | 

try {
    final response = api.forgotPassword(forgotPasswordRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->forgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forgotPasswordRequest** | [**ForgotPasswordRequest**](ForgotPasswordRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRole**
> AuthUser getRole()



### Example
```dart
import 'package:api/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api = Api().getAuthApi();

try {
    final response = api.getRole();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->getRole: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AuthUser**](AuthUser.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> LoginResponse login(loginRequest)



### Example
```dart
import 'package:api/api.dart';

final api = Api().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    final response = api.login(loginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePassword**
> MessageResponse updatePassword(uuid, updatePasswordRequest)



### Example
```dart
import 'package:api/api.dart';

final api = Api().getAuthApi();
final String uuid = uuid_example; // String | 
final UpdatePasswordRequest updatePasswordRequest = ; // UpdatePasswordRequest | 

try {
    final response = api.updatePassword(uuid, updatePasswordRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->updatePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String**|  | 
 **updatePasswordRequest** | [**UpdatePasswordRequest**](UpdatePasswordRequest.md)|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyUuid**
> MessageResponse verifyUuid(uuid)



### Example
```dart
import 'package:api/api.dart';

final api = Api().getAuthApi();
final String uuid = uuid_example; // String | 

try {
    final response = api.verifyUuid(uuid);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->verifyUuid: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String**|  | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

