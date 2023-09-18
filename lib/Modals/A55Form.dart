import 'package:flutter/foundation.dart';

class A55Form {
  final int id;
  final String site;
  final String cluster;
  final String work_required;
  final String exchange;
  final String onsite_eng;
  final String telephone_no;
  final String pia_order_number;
  final String date;
  final String surface;
  final String local_authority;
  final String cp_def_ref;
  final String os_ref;
  final String private_property;
  final String traffic_lights;
  final String percentage_bore_full;
  final String no_of_cables_in_bore;
  final String proposed_cable;
  final String proposed_sub_duct_diameter;
  final String duct_section_number;
  final String duct_type;
  final String blockage_comments;
  final String box_a_type;
  final String box_b_type;
  final String bore;
  final String l1_soft;
  final String l1_footway;
  final String l1_carriageway;
  final String l2_soft;
  final String l2_footway;
  final String l2_carriageway;
  final String l3_soft;
  final String l3_footway;
  final String l3_carriageway;
  final String chamber_1;
  final String chamber_2;
  final String gis_view;
  final String apx_view;
  final String chamber_1_1;
  final String chamber_1_2;
  final String chamber_1_3;
  final String chamber_1_4;
  final String chamber_2_1;
  final String chamber_2_2;
  final String chamber_2_3;
  final String chamber_2_4;
  final int resp_id;

  A55Form(
      {required this.id,
        required this.site,
        required this.cluster,
        required this.work_required,
        required this.exchange,
        required this.onsite_eng,
        required this.telephone_no,
        required this.pia_order_number,
        required this.date,
        required this.surface,
        required this.local_authority,
        required this.cp_def_ref,
        required this.os_ref,
        required this.private_property,
        required this.traffic_lights,
        required this.percentage_bore_full,
        required this.no_of_cables_in_bore,
        required this.proposed_cable,
        required this.proposed_sub_duct_diameter,
        required this.duct_section_number,
        required this.duct_type,
        required this.blockage_comments,
        required this.box_a_type,
        required this.box_b_type,
        required this.bore,
        required this.l1_soft,
        required this.l1_footway,
        required this.l1_carriageway,
        required this.l2_soft,
        required this.l2_footway,
        required this.l2_carriageway,
        required this.l3_soft,
        required this.l3_footway,
        required this.l3_carriageway,
        required this.chamber_1,
        required this.chamber_2,
        required this.gis_view,
        required this.apx_view,
        required this.chamber_1_1,
        required this.chamber_1_2,
        required this.chamber_1_3,
        required this.chamber_1_4,
        required this.chamber_2_1,
        required this.chamber_2_2,
        required this.chamber_2_3,
        required this.chamber_2_4,
        required this.resp_id});

  factory A55Form.fromSqfliteDatabase(Map<String, dynamic> map) => A55Form(
      id: map['id']?.toInt() ?? 0,
      site: map['site'] ?? "",
      cluster: map['cluster'] ?? "",
      work_required: map['work_required'] ?? "",
      exchange: map['exchange'] ?? "",
      onsite_eng: map['onsite_eng'] ?? "",
      telephone_no: map['telephone_no'] ?? "",
      pia_order_number: map['pia_order_number'] ?? "",
      date: map['date'] ?? "",
      surface: map['surface'] ?? "",
      local_authority: map['local_authority'] ?? "",
      cp_def_ref: map['cp_def_ref'] ?? "",
      os_ref: map['os_ref'] ?? "",
      private_property: map['private_property'] ?? "",
      traffic_lights: map['traffic_lights'] ?? "",
      percentage_bore_full: map['percentage_bore_full'] ?? "",
      no_of_cables_in_bore: map['no_of_cables_in_bore'] ?? "",
      proposed_cable: map['proposed_cable'] ?? "",
      proposed_sub_duct_diameter: map['proposed_sub_duct_diameter'] ?? "",
      duct_section_number: map['duct_section_number'] ?? "",
      duct_type: map['duct_type'] ?? "",
      blockage_comments: map['blockage_comments'] ?? "",
      box_a_type: map['box_a_type'] ?? "",
      box_b_type: map['box_b_type'] ?? "",
      bore: map['bore'] ?? "",
      l1_soft: map['l1_soft'] ?? "",
      l1_footway: map['l1_footway'] ?? "",
      l1_carriageway: map['l1_carriageway'] ?? "",
      l2_soft: map['l2_soft'] ?? "",
      l2_footway: map['l2_footway'] ?? "",
      l2_carriageway: map['l2_carriageway'] ?? "",
      l3_soft: map['l3_soft'] ?? "",
      l3_footway: map['l3_footway'] ?? "",
      l3_carriageway: map['l3_carriageway'] ?? "",
      chamber_1: map['chamber_1'] ?? "",
      chamber_2: map['chamber_2'] ?? "",
      gis_view: map['gis_view'] ?? "",
      apx_view: map['apx_view'] ?? "",
      chamber_1_1: map['chamber_1_1'] ?? "",
      chamber_1_2: map['chamber_1_2'] ?? "",
      chamber_1_3: map['chamber_1_3'] ?? "",
      chamber_1_4: map['chamber_1_4'] ?? "",
      chamber_2_1: map['chamber_2_1'] ?? "",
      chamber_2_2: map['chamber_2_2'] ?? "",
      chamber_2_3: map['chamber_2_3'] ?? "",
      chamber_2_4: map['chamber_2_4'] ?? "",
      resp_id: map['resp_id']?.toInt() ?? -1
  );
}