
class Account {
  final String username;
  final String password;
  final String email;

  Account(
      {required this.username, required this.password, required this.email});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        username: json['username'],
        password: json['password'],
        email: json['email']
    );
  }

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'email': email,
  };
}
