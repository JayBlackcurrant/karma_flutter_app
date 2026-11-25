//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/notice_acknowledgement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notice_acknowledgements.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NoticeAcknowledgements {
  /// Returns a new [NoticeAcknowledgements] instance.
  NoticeAcknowledgements({
    this.acknowledged,
    this.pending,
  });

  @JsonKey(
    name: r'acknowledged',
    required: false,
    includeIfNull: false,
  )
  List<NoticeAcknowledgement>? acknowledged;

  @JsonKey(
    name: r'pending',
    required: false,
    includeIfNull: false,
  )
  List<NoticeAcknowledgement>? pending;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoticeAcknowledgements &&
          other.acknowledged == acknowledged &&
          other.pending == pending;

  @override
  int get hashCode => acknowledged.hashCode + pending.hashCode;

  factory NoticeAcknowledgements.fromJson(Map<String, dynamic> json) =>
      _$NoticeAcknowledgementsFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeAcknowledgementsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
