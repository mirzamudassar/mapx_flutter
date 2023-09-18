class Location {
  final int id;
  final String form_name;
  final String site_name;
  final String area_name;

  Location(
      {required this.id,
      required this.form_name,
      required this.site_name,
      required this.area_name});

  factory Location.fromSqfliteDatabase(Map<String, dynamic> map) => Location(
      id: map['id']?.toInt() ?? 0,
      form_name: map['form_name'] ?? "",
      site_name: map['site_name'] ?? "",
      area_name: map['area_name'] ?? ""
  );
}
