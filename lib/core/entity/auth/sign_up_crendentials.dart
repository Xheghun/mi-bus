class SignUpCredential {
  final String email;
  final String password;
  final String fullName;
  String createdAt = DateTime.now().toIso8601String();
  String updatedAt = DateTime.now().toIso8601String();

  SignUpCredential({this.email, this.password, this.fullName});
}