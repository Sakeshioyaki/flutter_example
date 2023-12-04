class UserModal {
  String? name;
  int? age;
  String? email;

  UserModal({this.name, this.age, this.email});

  UserModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['email'] = this.email;
    return data;
  }
}