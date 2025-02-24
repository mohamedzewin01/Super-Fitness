import 'package:json_annotation/json_annotation.dart';

part 'upLoad_image_response.g.dart';

@JsonSerializable()
class UpLoadImageResponse {
  @JsonKey(name: "message")
  final String? message;

  UpLoadImageResponse ({
    this.message,
  });

  factory UpLoadImageResponse.fromJson(Map<String, dynamic> json) {
    return _$UpLoadImageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpLoadImageResponseToJson(this);
  }
}


