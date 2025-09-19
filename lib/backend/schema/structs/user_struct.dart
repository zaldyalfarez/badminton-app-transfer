// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    bool? verified,
    int? id,
    String? name,
    String? email,
    String? role,
    String? image,
  })  : _verified = verified,
        _id = id,
        _name = name,
        _email = email,
        _role = role,
        _image = image;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  set verified(bool? val) => _verified = val;

  bool hasVerified() => _verified != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        verified: data['verified'] as bool?,
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        role: data['role'] as String?,
        image: data['image'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'verified': _verified,
        'id': _id,
        'name': _name,
        'email': _email,
        'role': _role,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'verified': serializeParam(
          _verified,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        verified: deserializeParam(
          data['verified'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        verified == other.verified &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        role == other.role &&
        image == other.image;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([verified, id, name, email, role, image]);
}

UserStruct createUserStruct({
  bool? verified,
  int? id,
  String? name,
  String? email,
  String? role,
  String? image,
}) =>
    UserStruct(
      verified: verified,
      id: id,
      name: name,
      email: email,
      role: role,
      image: image,
    );
