# api.model.ApplyLeaveForUserRequest

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**employeeId** | **int** |  | 
**reason** | [**LeaveReason**](LeaveReason.md) |  | 
**type** | [**LeaveType**](LeaveType.md) |  | 
**description** | **String** |  | [optional] 
**from** | **int** | epoch ms of the start day (local midnight) - the web sends moment().valueOf() | 
**to** | **int** | epoch ms of the end day (local midnight) | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


