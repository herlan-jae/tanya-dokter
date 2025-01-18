class DoctorModel {
  String name;
  String code;
  String category;
  String description;
  String image;
  int patient;
  String rating;
  String price;
  bool status;

  DoctorModel({
    required this.name,
    required this.code,
    required this.category,
    required this.description,
    required this.image,
    required this.patient,
    required this.rating,
    required this.price,
    required this.status,
  });
}
