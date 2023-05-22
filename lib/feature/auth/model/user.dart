class User {
 final String email;
 final String name;
  int? phoneNum;
  int? birthDate;
  String id;

  User(
      {required this.email, required this.name, this.phoneNum, this.birthDate, required this.id});

 factory User.fromJson(Map<String, dynamic> json) {

   return User(
       email : json['email'],
       name : json['name'],
       phoneNum : json['phone_num'],
   birthDate : json['birth_date'],
   id : json['id'],

   );
  }

  Map<String, dynamic> toJson() => {

   'email'  : this.email,
    'name' : this.name,
   'phone_num' : this.phoneNum,
   'birth_date' :  this.birthDate,
    'id' : this.id,

  };
}





