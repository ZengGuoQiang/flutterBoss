class Company {
  final String id;
  final String inc;
  final List companyImgsResult;

  Company({this.id, this.inc, this.companyImgsResult});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        inc: json['inc'],
        companyImgsResult: json['companyImgsResult'] as List);
  }
}