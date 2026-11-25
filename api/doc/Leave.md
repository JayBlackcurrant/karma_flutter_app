# api.model.Leave

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**from** | [**DateTime**](DateTime.md) |  | [optional] 
**to** | [**DateTime**](DateTime.md) |  | [optional] 
**reason** | [**LeaveReason**](LeaveReason.md) |  | [optional] 
**description** | **String** |  | [optional] 
**type** | [**LeaveType**](LeaveType.md) |  | [optional] 
**count** | **num** |  | [optional] 
**status** | [**LeaveStatus**](LeaveStatus.md) |  | [optional] 
**markedBy** | **String** |  | [optional] 
**isUnpaid** | **num** | 0 or 1 | [optional] 
**additionalNotes** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**employeeId** | **int** |  | [optional] 
**employee** | [**LeaveEmployee**](LeaveEmployee.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


