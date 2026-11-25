// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Payment',
      json,
      ($checkedConvert) {
        final val = Payment(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          amount: $checkedConvert('amount', (v) => v as num?),
          date: $checkedConvert(
              'date', (v) => v == null ? null : DateTime.parse(v as String)),
          description: $checkedConvert('description', (v) => v as String?),
          structure: $checkedConvert('structure', (v) => v as String?),
          TDS: $checkedConvert('TDS', (v) => v as num?),
          category: $checkedConvert('category', (v) => v as String?),
          paymentForDate: $checkedConvert('paymentForDate',
              (v) => v == null ? null : DateTime.parse(v as String)),
          slipS3Link: $checkedConvert('slipS3Link', (v) => v as String?),
          createdAt: $checkedConvert('createdAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          employeeId:
              $checkedConvert('EmployeeId', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'employeeId': 'EmployeeId'},
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.amount case final value?) 'amount': value,
      if (instance.date?.toIso8601String() case final value?) 'date': value,
      if (instance.description case final value?) 'description': value,
      if (instance.structure case final value?) 'structure': value,
      if (instance.TDS case final value?) 'TDS': value,
      if (instance.category case final value?) 'category': value,
      if (instance.paymentForDate?.toIso8601String() case final value?)
        'paymentForDate': value,
      if (instance.slipS3Link case final value?) 'slipS3Link': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
      if (instance.employeeId case final value?) 'EmployeeId': value,
    };
