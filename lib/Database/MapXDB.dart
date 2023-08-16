import 'package:mapx/Modals/A55Form.dart';
import 'package:mapx/Modals/Draft.dart';
import 'package:mapx/Modals/History.dart';
import 'package:mapx/Modals/Location.dart';
import 'package:mapx/Modals/Networking.dart';
import 'package:mapx/Database/DatabaseService.dart';

class MapXDB {
  Future<void> createTable() async{
    final database = await DatabaseService().database;
    // A55 Form Query
    await database.execute("""
    CREATE TABLE IF NOT EXISTS A55Form (
    id INTEGER PRIMARY KEY,
    site TEXT NOT NULL,
    cluster TEXT NOT NULL,
    work_required TEXT NOT NULL,
    exchange TEXT NOT NULL,
    onsite_eng TEXT NOT NULL,
    telephone_no TEXT NOT NULL,
    pia_order_number TEXT NOT NULL,
    date TEXT NOT NULL,
    surface TEXT NOT NULL,
    local_authority TEXT NOT NULL,
    cp_def_ref TEXT NOT NULL,
    os_ref TEXT NOT NULL,
    private_property TEXT NOT NULL,
    traffic_lights TEXT NOT NULL,
    percentage_bore_full TEXT NOT NULL,
    no_of_cables_in_bore TEXT NOT NULL,
    proposed_cable TEXT NOT NULL,
    proposed_sub_duct_diameter TEXT NOT NULL,
    duct_section_number TEXT NOT NULL,
    duct_type TEXT NOT NULL,
    blockage_comments TEXT NOT NULL,
    box_a_type TEXT NOT NULL,
    box_b_type TEXT NOT NULL,
    bore TEXT NOT NULL,
    l1_soft TEXT NOT NULL,
    l1_footway TEXT NOT NULL,
    l1_carriageway TEXT NOT NULL,
    l2_soft TEXT NOT NULL,
    l2_footway TEXT NOT NULL,
    l2_carriageway TEXT NOT NULL,
    l3_soft TEXT NOT NULL,
    l3_footway TEXT NOT NULL,
    l3_carriageway TEXT NOT NULL,
    chamber_1 TEXT NOT NULL,
    chamber_2 TEXT NOT NULL,
    gis_view TEXT NOT NULL,
    apx_view TEXT NOT NULL,
    chamber_1_1 TEXT NOT NULL,
    chamber_1_2 TEXT NOT NULL,
    chamber_1_3 TEXT NOT NULL,
    chamber_1_4 TEXT NOT NULL,
    chamber_2_1 TEXT NOT NULL,
    chamber_2_2 TEXT NOT NULL,
    chamber_2_3 TEXT NOT NULL,
    chamber_2_4 TEXT NOT NULL,
    resp_id INTEGER NOT NULL)
    """);
    // Draft Query
    await database.execute("""
    CREATE TABLE IF NOT EXISTS Draft (
    id INTEGER PRIMARY KEY,
    form_id INTEGER NOT NULL,
    form_name TEXT NOT NULL,
    duct_section_number TEXT,
    site TEXT,
    cluster TEXT,
    date TEXT,
    time TEXT)
    """);
    // History Query
    await database.execute("""
    CREATE TABLE IF NOT EXISTS History (
      id INTEGER PRIMARY KEY,
      form_name TEXT NOT NULL,
      site TEXT NOT NULL,
      area TEXT NOT NULL,
      date TEXT NOT NULL,
      time TEXT NOT NULL,
      time_taken INTEGER NOT NULL,
      lat TEXT NOT NULL,
      lng TEXT NOT NULL,
      status TEXT NOT NULL
    )""");
    // Location Query
    await database.execute("""
    CREATE TABLE IF NOT EXISTS Location (
      id INTEGER PRIMARY KEY,
      form_name TEXT NOT NULL,
      site_name TEXT NOT NULL,
      area_name TEXT NOT NULL
    )""");
    // Networking Query
    await database.execute("""
    CREATE TABLE IF NOT EXISTS Network (
      id INTEGER PRIMARY KEY,
      site TEXT NOT NULL,
      cluster TEXT NOT NULL,
      exchange TEXT NOT NULL,
      crf TEXT NOT NULL,
      or_reference TEXT NOT NULL,
      noi TEXT NOT NULL,
      issue TEXT NOT NULL,
      date TEXT NOT NULL,
      cp_name TEXT NOT NULL,
      id_pole TEXT NOT NULL,
      grid_reference TEXT NOT NULL,
      post_code_lat TEXT NOT NULL,
      post_code_long TEXT NOT NULL,
      address TEXT NOT NULL,
      dp_id TEXT NOT NULL,
      secondIssue TEXT NOT NULL,
      issue_note TEXT NOT NULL,
      exciting_wires TEXT NOT NULL,
      forcost_wires TEXT NOT NULL,
      furniture_issue TEXT NOT NULL,
      max_pole_capacity TEXT NOT NULL,
      third_issue TEXT NOT NULL,
      picOne TEXT NOT NULL,
      picTwo TEXT NOT NULL,
      picThird TEXT NOT NULL,
      picFourth TEXT NOT NULL,
      resp_id INTEGER NOT NULL
    )""");
  }

  Future<int> insertA55Form({required id, required site, required cluster, required work_required, required exchange, required onsite_eng, required telephone_no, required pia_order_number, required date, required surface, required local_authority, required cp_def_ref, required os_ref, required private_property, required traffic_lights, required percentage_bore_full, required no_of_cables_in_bore, required proposed_cable, required proposed_sub_duct_diameter, required duct_section_number, required duct_type, required blockage_comments, required box_a_type, required box_b_type, required bore, required l1_soft, required l1_footway, required l1_carriageway, required l2_soft, required l2_footway, required l2_carriageway, required l3_soft, required l3_footway, required l3_carriageway, required chamber_1, required chamber_2, required gis_view, required apx_view, required chamber_1_1, required chamber_1_2, required chamber_1_3, required chamber_1_4, required chamber_2_1, required chamber_2_2, required chamber_2_3, required chamber_2_4, required resp_id}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert("""
      INSERT INTO A55Form(id, cluster, work_required, exchange, onsite_eng, telephone_no, pia_order_number, date, surface, local_authority, cp_def_ref, os_ref, private_property, traffic_lights, percentage_bore_full, no_of_cables_in_bore, proposed_cable, proposed_sub_duct_diameter, duct_section_number, duct_type, blockage_comments, box_a_type, box_b_type, bore, l1_soft, l1_footway, l1_carriageway, l2_soft, l2_footway, l2_carriageway, l3_soft, l3_footway, l3_carriageway, chamber_1, chamber_2, gis_view, apx_view, chamber_1_1, chamber_1_2, chamber_1_3, chamber_1_4, chamber_2_1, chamber_2_2, chamber_2_3, chamber_2_4, resp_id)           
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    """, [
        id, cluster, work_required, exchange, onsite_eng, telephone_no, pia_order_number, date, surface, local_authority, cp_def_ref, os_ref, private_property, traffic_lights, percentage_bore_full, no_of_cables_in_bore, proposed_cable, proposed_sub_duct_diameter, duct_section_number, duct_type, blockage_comments, box_a_type, box_b_type, bore, l1_soft, l1_footway, l1_carriageway, l2_soft, l2_footway, l2_carriageway, l3_soft, l3_footway, l3_carriageway, chamber_1, chamber_2, gis_view, apx_view, chamber_1_1, chamber_1_2, chamber_1_3, chamber_1_4, chamber_2_1, chamber_2_2, chamber_2_3, chamber_2_4, resp_id
    ]);
  }

  Future<int> insertDraft({required id, required form_id, required form_name, duct_section_number, site, cluster, date, time}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert("""
      INSERT INTO Draft(id, form_id, form_name, duct_section_number, site, cluster, date, time)           
      VALUES (?, ?, ?, ?, ?, ?, ?, ?);
    """, [
      id, form_id, form_name, duct_section_number, site, cluster, date, time
    ]);
  }

  Future<int> insertHistory({required id,required form_name,required site,required area,required date,required time,required time_taken,required lat,required lng,required status}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert("""
      INSERT INTO Draft(id, form_name, site, area, date, time_taken, lat, lng, status)           
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
    """, [
      id, form_name, site, area, date, time_taken, lat, lng, status
    ]);
  }

  Future<int> insertLocation({required id,required form_name,required site_name,required area_name}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert("""
      INSERT INTO Draft(id, form_name, site_name, area_name)           
      VALUES (?, ?, ?, ?);
    """, [
      id, form_name, site_name, area_name
    ]);
  }

  Future<int> insertNetwork({required id,required site,required cluster,required exchange,required crf,required or_reference,required noi,required issue,required date,required cp_name,required id_pole,required grid_reference,required post_code_lat,required post_code_long,required address,required dp_id,required secondIssue,required issue_note,required exciting_wires,required forcost_wires,required furniture_issue,required max_pole_capacity,required third_issue,required picOne,required picTwo,required picThird,required picFourth,required resp_id}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert("""
      INSERT INTO Draft(id,site,cluster,exchange,crf,or_reference,noi,issue,date,cp_name,id_pole,grid_reference,post_code_lat,post_code_long,address,dp_id,secondIssue,issue_note,exciting_wires,forcost_wires,furniture_issue,max_pole_capacity,third_issue,picOne,picTwo,picThird,picFourth,resp_id)           
      VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
    """, [
      id,site,cluster,exchange,crf,or_reference,noi,issue,date,cp_name,id_pole,grid_reference,post_code_lat,post_code_long,address,dp_id,secondIssue,issue_note,exciting_wires,forcost_wires,furniture_issue,max_pole_capacity,third_issue,picOne,picTwo,picThird,picFourth,resp_id
    ]);
  }

  Future<List<A55Form>> fetchAllA55Forms() async {
    final database = await DatabaseService().database;
    final forms = await database.rawQuery("""SELECT * FROM A55Form ORDER BY id DESC;""");
    return forms.map((form) => A55Form.fromSqfliteDatabase(form)).toList();
  }

  Future<List<Draft>> fetchAllDraft() async {
    final database = await DatabaseService().database;
    final forms = await database.rawQuery("""SELECT * FROM Draft ORDER BY id DESC;""");
    return forms.map((draft) => Draft.fromSqfliteDatabase(draft)).toList();
  }

  Future<List<History>> fetchAllHistory() async {
    final database = await DatabaseService().database;
    final forms = await database.rawQuery("""SELECT * FROM History ORDER BY id DESC;""");
    return forms.map((history) => History.fromSqfliteDatabase(history)).toList();
  }

  Future<List<Location>> fetchAllLocation() async {
    final database = await DatabaseService().database;
    final forms = await database.rawQuery("""SELECT * FROM History ORDER BY id DESC;""");
    return forms.map((location) => Location.fromSqfliteDatabase(location)).toList();
  }

  Future<List<Network>> fetchAllNetwork() async {
    final database = await DatabaseService().database;
    final forms = await database.rawQuery("""SELECT * FROM History ORDER BY id DESC;""");
    return forms.map((network) => Network.fromSqfliteDatabase(network)).toList();
  }

  Future<A55Form?> fetchA55FormById(int id) async {
    final database = await DatabaseService().database;
    final form = await database.rawQuery("SELECT * FROM A55Form WHERE id = ?;", [id]);
    if (form.isNotEmpty) {
      return A55Form.fromSqfliteDatabase(form.first);
    }
    return null;
  }

  Future<Draft?> fetchDraftById(int id) async {
    final database = await DatabaseService().database;
    final draft = await database.rawQuery("SELECT * FROM Draft WHERE id = ?;", [id]);
    if (draft.isNotEmpty) {
      return Draft.fromSqfliteDatabase(draft.first);
    }
    return null;
  }

  Future<History?> fetchHistoryById(int id) async {
    final database = await DatabaseService().database;
    final history = await database.rawQuery("SELECT * FROM History WHERE id = ?;", [id]);
    if (history.isNotEmpty) {
      return History.fromSqfliteDatabase(history.first);
    }
    return null;
  }

  Future<Location?> fetchLocationById(int id) async {
    final database = await DatabaseService().database;
    final location = await database.rawQuery("SELECT * FROM Location WHERE id = ?;", [id]);
    if (location.isNotEmpty) {
      return Location.fromSqfliteDatabase(location.first);
    }
    return null;
  }

  Future<Network?> fetchNetworkById(int id) async {
    final database = await DatabaseService().database;
    final network = await database.rawQuery("SELECT * FROM Network WHERE id = ?;", [id]);
    if (network.isNotEmpty) {
      return Network.fromSqfliteDatabase(network.first);
    }
    return null;
  }

  Future<void> deleteAllData() async {
    final database = await DatabaseService().database;
    await database.transaction((txn) async {
      await txn.delete('A55Form');
      await txn.delete('Draft');
      await txn.delete('History');
      await txn.delete('Location');
      await txn.delete('Network');
    });
  }

  Future<void> deleteA55FormById(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete("DELETE FROM A55Form WHERE id = ?", [id]);
  }

  Future<void> deleteDraftById(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete("DELETE FROM Draft WHERE id = ?", [id]);
  }

  Future<void> deleteHistoryById(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete("DELETE FROM History WHERE id = ?", [id]);
  }

  Future<void> deleteLocationById(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete("DELETE FROM Location WHERE id = ?", [id]);
  }

  Future<void> deleteNetworkById(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete("DELETE FROM Network WHERE id = ?", [id]);
  }

  Future<int> getNextA55FormId() async {
    final database = await DatabaseService().database;
    final result = await database.rawQuery("SELECT MAX(id) FROM A55Form;");
    final maxId = result.first.values.first ?? 0;
    return (maxId as int?) ?? 0 + 1;;
  }

  Future<int> getNextDraftId() async {
    final database = await DatabaseService().database;
    final result = await database.rawQuery("SELECT MAX(id) FROM Draft;");
    final maxId = result.first.values.first ?? 0;
    return (maxId as int?) ?? 0 + 1;;
  }

  Future<int> getNextHistoryId() async {
    final database = await DatabaseService().database;
    final result = await database.rawQuery("SELECT MAX(id) FROM History;");
    final maxId = result.first.values.first ?? 0;
    return (maxId as int?) ?? 0 + 1;;
  }

  Future<int> getNextLocationId() async {
    final database = await DatabaseService().database;
    final result = await database.rawQuery("SELECT MAX(id) FROM Location;");
    final maxId = result.first.values.first ?? 0;
    return (maxId as int?) ?? 0 + 1;;
  }

  Future<int> getNextNetworkId() async {
    final database = await DatabaseService().database;
    final result = await database.rawQuery("SELECT MAX(id) FROM Network;");
    final maxId = result.first.values.first ?? 0;
    return (maxId as int?) ?? 0 + 1;;
  }

}