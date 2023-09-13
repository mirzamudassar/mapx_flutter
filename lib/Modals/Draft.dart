class Draft {
  final int id;
  final int form_id;
  final String form_name;
  final String duct_section_number;
  final String site;
  final String cluster;
  final String date;
  final String time;

  Draft({
    required this.id,
    required this.form_id,
    required this.form_name,
    required this.duct_section_number,
    required this.site,
    required this.cluster,
    required this.date,
    required this.time,
  });

  factory Draft.fromSqfliteDatabase(Map<String, dynamic> map) => Draft(
      id: map['id']?.toInt() ?? 0,
      form_id: map['form_id'] ?? "",
      form_name: map['form_name'] ?? "",
      duct_section_number: map['duct_section_number'] ?? "",
      site: map['site'] ?? "",
      cluster: map['cluster'] ?? "",
      date: map['date'] ?? "",
      time: map['time'] ?? ""
  );
}