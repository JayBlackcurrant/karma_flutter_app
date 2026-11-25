//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Payment {
  /// Returns a new [Payment] instance.
  Payment({
    this.id,
    this.amount,
    this.date,
    this.description,
    this.structure,
    this.TDS,
    this.category,
    this.paymentForDate,
    this.slipS3Link,
    this.createdAt,
    this.updatedAt,
    this.employeeId,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  int? id;

  @JsonKey(
    name: r'amount',
    required: false,
    includeIfNull: false,
  )
  num? amount;

  @JsonKey(
    name: r'date',
    required: false,
    includeIfNull: false,
  )
  DateTime? date;

  @JsonKey(
    name: r'description',
    required: false,
    includeIfNull: false,
  )
  String? description;

  /// JSON-encoded breakdown
  @JsonKey(
    name: r'structure',
    required: false,
    includeIfNull: false,
  )
  String? structure;

  @JsonKey(
    name: r'TDS',
    required: false,
    includeIfNull: false,
  )
  num? TDS;

  @JsonKey(
    name: r'category',
    required: false,
    includeIfNull: false,
  )
  String? category;

  @JsonKey(
    name: r'paymentForDate',
    required: false,
    includeIfNull: false,
  )
  DateTime? paymentForDate;

  @JsonKey(
    name: r'slipS3Link',
    required: false,
    includeIfNull: false,
  )
  String? slipS3Link;

  @JsonKey(
    name: r'createdAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? createdAt;

  @JsonKey(
    name: r'updatedAt',
    required: false,
    includeIfNull: false,
  )
  DateTime? updatedAt;

  @JsonKey(
    name: r'EmployeeId',
    required: false,
    includeIfNull: false,
  )
  int? employeeId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Payment &&
          other.id == id &&
          other.amount == amount &&
          other.date == date &&
          other.description == description &&
          other.structure == structure &&
          other.TDS == TDS &&
          other.category == category &&
          other.paymentForDate == paymentForDate &&
          other.slipS3Link == slipS3Link &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.employeeId == employeeId;

  @override
  int get hashCode =>
      id.hashCode +
      amount.hashCode +
      date.hashCode +
      (description == null ? 0 : description.hashCode) +
      (structure == null ? 0 : structure.hashCode) +
      (TDS == null ? 0 : TDS.hashCode) +
      category.hashCode +
      paymentForDate.hashCode +
      (slipS3Link == null ? 0 : slipS3Link.hashCode) +
      createdAt.hashCode +
      updatedAt.hashCode +
      employeeId.hashCode;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
