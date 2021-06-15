class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String createdAt;
  final String lastUpdated;

  UserProfile({this.id, this.fullName, this.email, this.createdAt, this.lastUpdated});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "createdAt": createdAt,
      "lastUpdated": lastUpdated
    };
  }
}