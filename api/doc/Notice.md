# api.model.Notice

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**title** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**expirationDate** | **Object** | ISO date string or epoch ms (sent as epoch ms) - parse with NoticeExt.expiresOn | [optional] 
**acknowledgedByMe** | **bool** |  | [optional] 
**acknowledgedOn** | [**DateTime**](DateTime.md) |  | [optional] 
**acknowledgedCount** | **int** |  | [optional] 
**activeEmployeeCount** | **int** | admin only | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


