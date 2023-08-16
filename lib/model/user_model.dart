class AppUser {
  final String fullName;
  final String email;
  final String phone;
  final String wallet;
  final String userType;
  final String userId;
  const AppUser({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.wallet,
    required this.userType,
    required this.userId,
  });

  AppUser copy({
    String? fullName,
    String? email,
    String? phone,
    String? wallet,
    String? userType,
    String? userId,
  }) =>
      AppUser(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        wallet: wallet ?? this.wallet,
        userType: userType ?? this.userType,
        userId: userId ?? this.userId,
      );

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
    fullName: json['fullName'],
    email: json['email'],
    phone: json['phone'],
    wallet: json['wallet'],
    userType: json['userType'],
    userId: json['_id'],
  );

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'email': email,
    'phone': phone,
    'wallet': wallet,
    'userType': userType,
    '_id': userId,
  };
}