import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

PermissionStatus? permissionStorageStatus;
PermissionStatus? permissionCameraStatus;
PermissionStatus? permissionNotificationStatus;

Future<bool> isPermissionStorageGranted() async {
  if (Platform.isAndroid &&
      await DeviceInfoPlugin()
          .androidInfo
          .then((info) => info.version.sdkInt >= 33)) {
    final imagePermissionStatus = await Permission.photos.status;
    final videoPermissionStatus = await Permission.videos.status;

    if (imagePermissionStatus == PermissionStatus.denied ||
        videoPermissionStatus == PermissionStatus.denied) {
      final requestedImagePermission = await Permission.photos.request();
      final requestedVideoPermission = await Permission.videos.request();

      return requestedImagePermission == PermissionStatus.granted &&
          requestedVideoPermission == PermissionStatus.granted;
    } else {
      return imagePermissionStatus == PermissionStatus.granted &&
          videoPermissionStatus == PermissionStatus.granted;
    }
  } else {
    permissionStorageStatus = await Permission.storage.status;

    if (permissionStorageStatus == PermissionStatus.denied) {
      permissionStorageStatus = await Permission.storage.request();
      return permissionStorageStatus == PermissionStatus.granted;
    } else {
      return permissionStorageStatus == PermissionStatus.granted;
    }
  }
}

Future<bool> isPermissionCameraGranted() async {
  permissionCameraStatus = await Permission.camera.status;

  if (permissionCameraStatus == PermissionStatus.denied) {
    permissionCameraStatus = await Permission.camera.request();
    return permissionCameraStatus == PermissionStatus.granted;
  } else {
    return permissionCameraStatus == PermissionStatus.granted;
  }
}
