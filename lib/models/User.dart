class UserDetails {
  String name = "";
  String height;
  String weight;
  String gender;
  String age;
  String email;
  String photoUrl;

  UserDetails(String name, String height, String weight, String gender,
      String age, String email, String photoUrl) {
    this.name = name;
    this.height = height;
    this.weight = weight;
    this.gender = gender;
    this.age = age;
    this.email = email;
    this.photoUrl = photoUrl;
  }
}

class UserName {
  String name;

  UserName(String name) {
    this.name = name;
  }
}
