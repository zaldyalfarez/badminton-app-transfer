// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IsExamStruct extends BaseStruct {
  IsExamStruct({
    int? id,
    String? answer,
  })  : _id = id,
        _answer = answer;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  static IsExamStruct fromMap(Map<String, dynamic> data) => IsExamStruct(
        id: castToType<int>(data['id']),
        answer: data['answer'] as String?,
      );

  static IsExamStruct? maybeFromMap(dynamic data) =>
      data is Map ? IsExamStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static IsExamStruct fromSerializableMap(Map<String, dynamic> data) =>
      IsExamStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IsExamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IsExamStruct && id == other.id && answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([id, answer]);
}

IsExamStruct createIsExamStruct({
  int? id,
  String? answer,
}) =>
    IsExamStruct(
      id: id,
      answer: answer,
    );
