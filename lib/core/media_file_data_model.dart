enum MediaType { videos, images, localeFile, networkImage }

class MediaFileDataEntity {
  final String? url;
  final MediaType? type;

  const MediaFileDataEntity({required this.url, required this.type});

  @override
  List<Object?> get props => [url, type];
}

class MediaFileDataModel extends MediaFileDataEntity {
  final String? url;
  final MediaType? type;

  const MediaFileDataModel({required this.url, required this.type})
      : super(type: type, url: url);
}