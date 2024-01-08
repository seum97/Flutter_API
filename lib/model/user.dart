class ApiUser {
  int? id;
  String? fname;
  String? lname;
  String? gender;
  String? dob;
  String? email;
  Map<String, dynamic>? address;

  ApiUser(this.id, this.fname, this.lname, this.gender, this.dob, this.email,
      this.address);
}