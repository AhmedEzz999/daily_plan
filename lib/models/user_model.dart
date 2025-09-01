class UserModel {
  String userName;
  String? imageSource;
  String? motivationQuote;
  bool? darkMode;

  UserModel({
    required this.userName,
    this.imageSource,
    this.motivationQuote,
    this.darkMode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['user name'],
      imageSource: json['image source'] ?? 'assets/images/profile_picture.png',
      motivationQuote:
          json['motivation quote'] ?? 'One task at a time. One step closer.',
      darkMode: json['dark mode'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user name': userName,
      'image source': imageSource,
      'motivation quote': motivationQuote,
      'dark mode': darkMode,
    };
  }
}
