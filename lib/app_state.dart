import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_currentUser')) {
        try {
          final serializedData = prefs.getString('ff_currentUser') ?? '{}';
          _currentUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dataLatihan = prefs
              .getStringList('ff_dataLatihan')
              ?.map((x) {
                try {
                  return LatihanStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dataLatihan;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _currentUser = UserStruct();
  UserStruct get currentUser => _currentUser;
  set currentUser(UserStruct value) {
    _currentUser = value;
    prefs.setString('ff_currentUser', value.serialize());
  }

  void updateCurrentUserStruct(Function(UserStruct) updateFn) {
    updateFn(_currentUser);
    prefs.setString('ff_currentUser', _currentUser.serialize());
  }

  List<LatihanStruct> _dataLatihan = [];
  List<LatihanStruct> get dataLatihan => _dataLatihan;
  set dataLatihan(List<LatihanStruct> value) {
    _dataLatihan = value;
    prefs.setStringList(
        'ff_dataLatihan', value.map((x) => x.serialize()).toList());
  }

  void addToDataLatihan(LatihanStruct value) {
    dataLatihan.add(value);
    prefs.setStringList(
        'ff_dataLatihan', _dataLatihan.map((x) => x.serialize()).toList());
  }

  void removeFromDataLatihan(LatihanStruct value) {
    dataLatihan.remove(value);
    prefs.setStringList(
        'ff_dataLatihan', _dataLatihan.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDataLatihan(int index) {
    dataLatihan.removeAt(index);
    prefs.setStringList(
        'ff_dataLatihan', _dataLatihan.map((x) => x.serialize()).toList());
  }

  void updateDataLatihanAtIndex(
    int index,
    LatihanStruct Function(LatihanStruct) updateFn,
  ) {
    dataLatihan[index] = updateFn(_dataLatihan[index]);
    prefs.setStringList(
        'ff_dataLatihan', _dataLatihan.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDataLatihan(int index, LatihanStruct value) {
    dataLatihan.insert(index, value);
    prefs.setStringList(
        'ff_dataLatihan', _dataLatihan.map((x) => x.serialize()).toList());
  }

  List<String> _isEmpty = ['Data Kosong'];
  List<String> get isEmpty => _isEmpty;
  set isEmpty(List<String> value) {
    _isEmpty = value;
  }

  void addToIsEmpty(String value) {
    isEmpty.add(value);
  }

  void removeFromIsEmpty(String value) {
    isEmpty.remove(value);
  }

  void removeAtIndexFromIsEmpty(int index) {
    isEmpty.removeAt(index);
  }

  void updateIsEmptyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    isEmpty[index] = updateFn(_isEmpty[index]);
  }

  void insertAtIndexInIsEmpty(int index, String value) {
    isEmpty.insert(index, value);
  }

  List<IsExamStruct> _isExam = [
    IsExamStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"0\",\"answer\":\"A\"}'))
  ];
  List<IsExamStruct> get isExam => _isExam;
  set isExam(List<IsExamStruct> value) {
    _isExam = value;
  }

  void addToIsExam(IsExamStruct value) {
    isExam.add(value);
  }

  void removeFromIsExam(IsExamStruct value) {
    isExam.remove(value);
  }

  void removeAtIndexFromIsExam(int index) {
    isExam.removeAt(index);
  }

  void updateIsExamAtIndex(
    int index,
    IsExamStruct Function(IsExamStruct) updateFn,
  ) {
    isExam[index] = updateFn(_isExam[index]);
  }

  void insertAtIndexInIsExam(int index, IsExamStruct value) {
    isExam.insert(index, value);
  }

  int _userUjianId = 0;
  int get userUjianId => _userUjianId;
  set userUjianId(int value) {
    _userUjianId = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
