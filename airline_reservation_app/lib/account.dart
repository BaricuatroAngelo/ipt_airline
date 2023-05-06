class Account {
  final String userId;
  final String username;
  final String password;
  final String fName;
  final String lName;
  final String email;

  Account(
      {required this.userId,
      required this.username,
      required this.password,
      required this.email,
      required this.fName,
      required this.lName});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        userId: json['id'],
        username: json['username'],
        fName: json['first_name'],
        lName: json['last_name'],
        password: json['password'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() => {
        'id': userId,
        'username': username,
        'first_name': fName,
        'last_name': lName,
        'password': password,
        'email': email,
      };
}
