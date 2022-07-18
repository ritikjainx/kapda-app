import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsheets/gsheets.dart';
import 'package:kapda/modals/ApiModels/user_modal.dart';

class GSheetsApi {
  static const _spreadsheetid = '1ZsD-OH9MzsiPjHJlczBYb0Gsrv7nEZGOztg0WFKW2R4';

  static var _gsheets;
  static Worksheet _userSheet;
  static Spreadsheet _spreadsheet;

  static Future init() async {
    // TODO: add your own cred.json file
    String cred = await rootBundle.loadString('assets/cred.json');
    _gsheets = GSheets(cred);
    _spreadsheet = await _gsheets.spreadsheet(_spreadsheetid);
    print(_spreadsheet);
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet, {String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
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

  static Future<bool> checkUser({String phoneNumber}) async {
    _userSheet = _spreadsheet.worksheetByTitle("Users");
    List<String> users = await _userSheet.values.columnByKey("phoneNumber", fromRow: 2);
    if (users.contains(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<UserData> getUser(String phoneNumber) async {
    _userSheet = _spreadsheet.worksheetByTitle("Users");
    if (_userSheet == null) {
      return null;
    }

    var users = await _userSheet.values.columnByKey("phoneNumber");
    int index = users.indexOf(phoneNumber.substring(3));
    final json = await _userSheet.values.row(index + 2);
    final user = UserData.fromList(json);
    return user;
  }

  static Future getAllProducts() async {
    _userSheet = _spreadsheet.worksheetByTitle("Products");
    if (_userSheet == null) {
      print('null');
      return;
    }
    return await _userSheet.values.map.allRows();
  }

  static manageFavStatusInUserData({@required UserData user}) {
    _userSheet = _spreadsheet.worksheetByTitle("Users");
    _userSheet.values.insertValueByKeys(user.favItems.toString(), columnKey: 'favItems', rowKey: user.id);
  }

}
