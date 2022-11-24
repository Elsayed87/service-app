// class UserModel {
//   final DataModel data;

//   UserModel({required this.data});
//   factory UserModel.fromJson(json) {
//     return UserModel(data: DataModel.fromJson(json['data']));
//   }
// }

// class DataModel {
//    User? user;
//    String ?token;

//   DataModel({required this.user, required this.token});
//   factory DataModel.fromJson(json) {
//     return DataModel(user: User.fromJson(json['user']), token: json['token']);
//   }
// }

// class User {
//   final String name;
//   final String email;
//   final String city;
//   final String joined_date;

//   User(
//       {required this.name,
//       required this.email,
//       required this.city,
//       required this.joined_date});
//   factory User.fromJson(json) {
//     return User(
//         name: json['name'],
//         email: json['email'],
//         city: json['city'],
//         joined_date: json['joined_date']);
//   }
// }





// {
//     "message": "User registered successfully",
//     "data": {
//         "token": "330|ce5p78aLxPhaOOqn13ghRazaeeKGttBXOgLfBYZa",
//         "user": {
//             "name": "sayed mohamed nasser",
//             "email": "sayed1231@gmail.com",
//             "city": "Abnūb",
//             "joined_date": "2022-11-22"
//         }
//     }


class UserModel {
  String? message;
  Data? data;

  UserModel({this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? city;
  String? joinedDate;

  User({this.name, this.email, this.city, this.joinedDate});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    city = json['city'];
    joinedDate = json['joined_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['city'] = this.city;
    data['joined_date'] = this.joinedDate;
    return data;
  }
}