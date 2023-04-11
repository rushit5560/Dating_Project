class UploadUserImage {
  String imageUrl;
  bool isImageFromNetwork;

  UploadUserImage({required this.imageUrl, required this.isImageFromNetwork});

  factory UploadUserImage.fromJson(Map<String, dynamic> json) => UploadUserImage(
    imageUrl: json['image'],
    isImageFromNetwork: json['isImageFromNetwork']
  );

}