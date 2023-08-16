
class History {
  final int id;
  final String form_name;
  final String site;
  final String area;
  final String date;
  final String time;
  final int time_taken;
  final String lat;
  final String lng;
  final String status;

  History(
      {required this.id,
      required this.form_name,
      required this.site,
      required this.area,
      required this.date,
      required this.time,
      required this.time_taken,
      required this.lat,
      required this.lng,
      required this.status});

  factory History.fromSqfliteDatabase(Map<String, dynamic> map) => History(
      id: map['id']?.toInt() ?? 0,
      form_name: map['form_name'] ?? "",
      site: map['site'] ?? "",
      area: map['area'] ?? "",
      date: map['date'] ?? "",
      time: map['time'] ?? "",
      time_taken: map['time_taken'] ?? "",
      lat: map['lat'] ?? "",
      lng: map['lng'] ?? "",
      status: map['status'] ?? ""
  );
}
