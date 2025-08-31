class UserModel {
  String userName;
  String? imageSource;
  String? motivationQuote;

  UserModel({required this.userName, this.imageSource, this.motivationQuote});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['user name'],
      imageSource: json['image source'] ?? 'assets/images/profile_picture.png',
      motivationQuote:
          json['motivation quote'] ?? 'One task at a time. One step closer.',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user name': userName,
      'image source': imageSource,
      'motivation quote': motivationQuote,
    };
  }
}
