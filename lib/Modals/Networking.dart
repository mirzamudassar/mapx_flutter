class Network {
  final int id;
  final String site;
  final String cluster;
  final String exchange;
  final String crf;
  final String or_reference;
  final String noi;
  final String issue;
  final String date;
  final String cp_name;
  final String id_pole;
  final String grid_reference;
  final String post_code_lat;
  final String post_code_long;
  final String address;
  final String dp_id;
  final String secondIssue;
  final String issue_note;
  final String exciting_wires;
  final String forcost_wires;
  final String furniture_issue;
  final String max_pole_capacity;
  final String third_issue;
  final String picOne;
  final String picTwo;
  final String picThird;
  final String picFourth;
  final int resp_id;

  Network(
      {required this.id,
      required this.site,
      required this.cluster,
      required this.exchange,
      required this.crf,
      required this.or_reference,
      required this.noi,
      required this.issue,
      required this.date,
      required this.cp_name,
      required this.id_pole,
      required this.grid_reference,
      required this.post_code_lat,
      required this.post_code_long,
      required this.address,
      required this.dp_id,
      required this.secondIssue,
      required this.issue_note,
      required this.exciting_wires,
      required this.forcost_wires,
      required this.furniture_issue,
      required this.max_pole_capacity,
      required this.third_issue,
      required this.picOne,
      required this.picTwo,
      required this.picThird,
      required this.picFourth,
      required this.resp_id});

  factory Network.fromSqfliteDatabase(Map<String, dynamic> map) => Network(
      id: map['id']?.toInt() ?? 0,
      site: map['site'] ?? "",
      cluster: map['cluster'] ?? "",
      exchange: map['exchange'] ?? "",
      crf: map['crf'] ?? "",
      or_reference: map['or_reference'] ?? "",
      noi: map['noi'] ?? "",
      issue: map['issue'] ?? "",
      date: map['date'] ?? "",
      cp_name: map['cp_name'] ?? "",
      id_pole: map['id_pole'] ?? "",
      grid_reference: map['grid_reference'] ?? "",
      post_code_lat: map['post_code_lat'] ?? "",
      post_code_long: map['post_code_long'] ?? "",
      address: map['address'] ?? "",
      dp_id: map['dp_id'] ?? "",
      secondIssue: map['secondIssue'] ?? "",
      issue_note: map['issue_note'] ?? "",
      exciting_wires: map['exciting_wires'] ?? "",
      forcost_wires: map['forcost_wires'] ?? "",
      furniture_issue: map['furniture_issue'] ?? "",
      max_pole_capacity: map['max_pole_capacity'] ?? "",
      third_issue: map['third_issue'] ?? "",
      picOne: map['picOne'] ?? "",
      picTwo: map['picTwo'] ?? "",
      picThird: map['picThird'] ?? "",
      picFourth: map['picFourth'] ?? "",
      resp_id: map['id']?.toInt() ?? 0
  );
}
