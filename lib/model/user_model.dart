

class UserModel {

  String id;
  String? name;
  String? contacts;
  String? iconUrl;
  
 
  UserModel({required this.id, this.name, this.contacts, this.iconUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      id: json['id'],
      name: json['name'],
      contacts: json['Contacts'],
      iconUrl: json['url'],
      );
  }



}