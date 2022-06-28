import 'package:gsheets/gsheets.dart';

class GSheetsApi {
  static const _spreadsheetid = '1ZsD-OH9MzsiPjHJlczBYb0Gsrv7nEZGOztg0WFKW2R4';
  static const _cred = r'''
{
  "type": "service_account",
  "project_id": "kapda-app-354506",
  "private_key_id": "1817d49d59feff5fbd6d445ec6f42cde599d4cdc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1+fpYO3MwwEI0\nfS2SObCPIG606ZVyBm0hOfHbHZOMlgdDlJZt6LETqcZ06ewOFLBqmpAHjPgdUbCX\n2eR64UNkTZnGEEtylxt4iVQwe5lbDy+ddYDkDyzsCMMr7RYZNo4+AL5jIV3yWWaK\nB1+NUVs6wp4pS9qaLaogC4cfTiOzSsLYbLnl7cY9IXJ0H3MdC4rKhBorXC5eqoHf\nNU9dpZS6glXdcG7NUEoUHdUTLob9wX3O14DIunXKBmnNO4f88r4cGuUujyrOdGqW\nqY2YGlMCrB9qQmuGoilaEsAohG20rhSTyhV6NTYheVOc7BzUp3l3LZlrsOZn9eTx\nmkrw5t0LAgMBAAECggEAMJ63end30WCsz6VaVaVAPR1nNsLqAOsioSwAKJEAaSF0\nk2PRxU/Ub/J+aaJORXzVncXqEXpimELJMekvmH0zKktpeHfGELm6xzu52LJNSP0H\ntcQ9SbGcSPwWWVgg/V+MJZjBRW8W0Ld+JAbQSsuf2lVBOLthjqwAtkseMQkJlM9C\nkFC9wliD91VlXM40wT9ue3Gm0QWL17EQGY4pEydFYfIlvZ+hYtUMaSWcGYK6ukr5\nvH38qij9klMabEFYzh4Qjr7chA1Q62J11ZLVQMPeFkn/lVpAGCC+iYlRWmQy4x0W\nS9kD1L4rogIvbYiLbJl5QEyM1U+UQovWmXzIa7ndIQKBgQDzaJghp3rPAmZkwfty\nAvXCNhBVK5QJIyJZN7CJfkqFmZ+WGjC7hxpYoO4EhYKjM3LpFjwyChi1cSVqwppH\nxDuzSbZizAUg7TzmlOMNgQnamH9+jq02pgellJHHttM2xl0xLtliu6Ctr0KFhiLk\ncAUrFIqRhMaQaK5ccpGBO+1hQwKBgQC/Y9oeu+pwBhty89mm/akhSFZhC6Xr5zft\nFSMhQkViVDWmeRqyRfhurxIlifmbfjLNVqBC9Wd6peNpi2h6zEdc+cI8VznCZ+hJ\nFkNfyQjTfxR6RRWydaE69W5U0aL8Ku6INX46A6VmM/a/Wx8OYxmycwsrMn7xLKFB\nXTZRDa+UmQKBgD+jAtMZpEPmzrpc9M4z8+iYleCOih9xbhOBOchYmkcfiNeHdWIx\nyjONr2zDMwpT8yD5TTeP6DHXqP6mbguBRFJ1XRerW1PmclueZVYsfFUINZzy1FpL\nQgiKNSrPo5zYc5jeNLtZboK6JVwfW5P5rYA72JZ+7iLnG17UHTJ6Zm9dAoGACcJ/\nxv1yMRA+qhgBS2C4FThpHz3G0kbSNUbUqceFXkRJEBow4FJtHsfStxNYJTPER3BZ\nb9Cv3DNFa4ZuZ4SvRvB9lTIlgeJmmAOIoAPSbWaXlrybJKSW+ji1zaF7HDzcORnx\nO+gfsRyJQqzU4pjvIIh5U1SZ4JaUCo9ES9HU2FECgYEAhvhdnIBU+LS7t6x3wskp\nYEZOL5gI0kuc6U6O7qHAIjgxW84CdiEx6vTOtJw/2VDm2knBqPoCSJo+u1TYTCaj\nu/cGG2e7YwqiZh8OgZR74ZO38VFMc57QkXDil9M0v/2pGtl39TQLarQw+7tcK+/W\n9K56aMtT4c8AxW+99kPiZEo=\n-----END PRIVATE KEY-----\n",
  "client_email": "kapda-app@kapda-app-354506.iam.gserviceaccount.com",
  "client_id": "117523071006151796012",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/kapda-app%40kapda-app-354506.iam.gserviceaccount.com"
}
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
