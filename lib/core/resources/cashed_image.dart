import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../api/api_constants.dart';

String getFileExtensionFromUrl(String url) {
  List<String> parts = url.split('.');
  String lastPart = parts.last;
  List<String> extensionParts = lastPart.split('?');
  String extension = extensionParts.first;
  return extension;
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.sizeIndicator,
    this.boxFit,
  });

  final String url;
  final double? height;
  final double? width;
  final double? sizeIndicator;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return getFileExtensionFromUrl(url) == 'svg'
        ? SvgPicture.network(
            url.isNotEmpty ? '${ApiConstants.baseUrl}$url' : '',
            fit: BoxFit.fill,
            placeholderBuilder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : CachedNetworkImage(
            height: height,
            width: width ?? MediaQuery.sizeOf(context).width,
            imageUrl: url.isNotEmpty ? '${ApiConstants.baseUrl}$url' : '',
            fit: boxFit ?? BoxFit.fill,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          );
  }
}
