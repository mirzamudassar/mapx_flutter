class BlockageData {
  final String site;
  final String area;
  final String userId;
  final String lat;
  final String lng;
  final String workRequired;
  final String exchange;
  final String onsiteEng;
  final String telephoneNo;
  final String piaOrderNo;
  final String date;
  final String localAuthority;
  final String surface;
  final String cpDefRef;
  final String osRef;
  final String privateProperty;
  final String trafficLight;
  final String percentageBoreFull;
  final String noOfCablesInBore;
  final String proposedCable;
  final String proposedSubDuctDiameter;
  final String ductSectionNo;
  final String ductType;
  final String blockageComments;
  final String boxAType;
  final String boxBType;
  final String bore;
  final int l1Soft;
  final int l1Footway;
  final int l1Carriageway;
  final int l2Soft;
  final int l2Footway;
  final int l2Carriageway;
  final int l3Soft;
  final int l3Footway;
  final int l3Carriageway;
  final int chamber1;
  final int chamber2;
  final String apx;
  final String gis;
  final String chamber1_1;
  final String chamber1_2;
  final String chamber1_3;
  final String chamber1_4;
  final String chamber2_1;
  final String chamber2_2;
  final String chamber2_3;
  final String chamber2_4;

  BlockageData({
    required this.site,
    required this.area,
    required this.userId,
    required this.lat,
    required this.lng,
    required this.workRequired,
    required this.exchange,
    required this.onsiteEng,
    required this.telephoneNo,
    required this.piaOrderNo,
    required this.date,
    required this.localAuthority,
    required this.surface,
    required this.cpDefRef,
    required this.osRef,
    required this.privateProperty,
    required this.trafficLight,
    required this.percentageBoreFull,
    required this.noOfCablesInBore,
    required this.proposedCable,
    required this.proposedSubDuctDiameter,
    required this.ductSectionNo,
    required this.ductType,
    required this.blockageComments,
    required this.boxAType,
    required this.boxBType,
    required this.bore,
    required this.l1Soft,
    required this.l1Footway,
    required this.l1Carriageway,
    required this.l2Soft,
    required this.l2Footway,
    required this.l2Carriageway,
    required this.l3Soft,
    required this.l3Footway,
    required this.l3Carriageway,
    required this.chamber1,
    required this.chamber2,
    required this.apx,
    required this.gis,
    required this.chamber1_1,
    required this.chamber1_2,
    required this.chamber1_3,
    required this.chamber1_4,
    required this.chamber2_1,
    required this.chamber2_2,
    required this.chamber2_3,
    required this.chamber2_4,
  });

  Map<String, dynamic> toJson() {
    return {
      'site': site,
      'area': area,
      'user_id': userId,
      'lat': lat,
      'lng': lng,
      'work_required': workRequired,
      'exchange': exchange,
      'onsite_eng': onsiteEng,
      'telephone_no': telephoneNo,
      'pia_order_no': piaOrderNo,
      'date': date,
      'local_authority': localAuthority,
      'surface': surface,
      'cp_def_ref': cpDefRef,
      'os_ref': osRef,
      'private_property': privateProperty,
      'traffic_light': trafficLight,
      'percentage_bore_full': percentageBoreFull,
      'no_of_cables_in_bore': noOfCablesInBore,
      'proposed_cable': proposedCable,
      'proposed_sub_duct_diameter': proposedSubDuctDiameter,
      'duct_section_no': ductSectionNo,
      'duct_type': ductType,
      'blockageComments': blockageComments,
      'box_A_type': boxAType,
      'box_B_type': boxBType,
      'bore': bore,
      'l1_soft': l1Soft,
      'l1_footway': l1Footway,
      'l1_carriageway': l1Carriageway,
      'l2_soft': l2Soft,
      'l2_footway': l2Footway,
      'l2_carriageway': l2Carriageway,
      'l3_soft': l3Soft,
      'l3_footway': l3Footway,
      'l3_carriageway': l3Carriageway,
      'chamber1': chamber1,
      'chamber2': chamber2,
      'apx': apx,
      'gis': gis,
      'chamber1_1': chamber1_1,
      'chamber1_2': chamber1_2,
      'chamber1_3': chamber1_3,
      'chamber1_4': chamber1_4,
      'chamber2_1': chamber2_1,
      'chamber2_2': chamber2_2,
      'chamber2_3': chamber2_3,
      'chamber2_4': chamber2_4,
    };
  }
}
