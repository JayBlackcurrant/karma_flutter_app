// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

abstract final class AppUtils {
  /// Opens [url]; pay slips and documents come back as short-lived presigned
  /// S3 links, so open them right after fetching.
  static Future<void> openUrl(
    String url, {
    VoidCallback? onError,
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    final uri = Uri.tryParse(url);
    if (uri == null || !await launchUrl(uri, mode: mode)) {
      onError?.call();
    }
  }

  static Future<void> launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
