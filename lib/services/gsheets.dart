import 'package:gsheets/gsheets.dart';

class GSheetsApi {
  static const _spreadsheetid = '1ZsD-OH9MzsiPjHJlczBYb0Gsrv7nEZGOztg0WFKW2R4';
  // TODO: add GCP service account json credentials here
  static const _cred = r'''

''';

  static final _gsheets = GSheets(_cred);
  static Worksheet _userSheet;
  static Spreadsheet _spreadsheet;

  static Future init() async {
    _spreadsheet = await _gsheets.spreadsheet(_spreadsheetid);
    print(_spreadsheet);
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet, {String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      print(e);
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static Future insert(Map<String, dynamic> userData) async {
    _userSheet = await _getWorkSheet(_spreadsheet, title: 'Users');
    if (_userSheet == null) {
      print('null');
      return;
    }
    await _userSheet.values.map.appendRow(userData);
    print('added');
  }

  static Future getAllProducts() async {
    _userSheet = _spreadsheet.worksheetByTitle("Products");
    if (_userSheet == null) {
      print('null');
      return;
    }
    return await _userSheet.values.map.allRows();
  }

  static updateProductbyKey({String id, String key, String value}) {
    _userSheet = _spreadsheet.worksheetByTitle("Products");

    _userSheet.values.insertValueByKeys(value, columnKey: key, rowKey: id);
  }

  static Future<bool> checkUser({String phoneNumber}) async {
    _userSheet = _spreadsheet.worksheetByTitle("Users");
    List<String> users = await _userSheet.values.columnByKey("phoneNumber", fromRow: 2);
    if (users.contains(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }
}
