// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadLink _$DownloadLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DownloadLink',
      json,
      ($checkedConvert) {
        final val = DownloadLink(
          link: $checkedConvert('link', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DownloadLinkToJson(DownloadLink instance) =>
    <String, dynamic>{
      if (instance.link case final value?) 'link': value,
    };
