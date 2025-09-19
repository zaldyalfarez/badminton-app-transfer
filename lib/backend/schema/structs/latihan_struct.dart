// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LatihanStruct extends BaseStruct {
  LatihanStruct({
    List<int>? id,
    List<String>? thumbnail,
    List<String>? name,
    List<String>? category,
    List<int>? duration,
    List<String>? description,
    List<String>? video,
    List<String>? ar,
    List<bool>? isCompleted,
  })  : _id = id,
        _thumbnail = thumbnail,
        _name = name,
        _category = category,
        _duration = duration,
        _description = description,
        _video = video,
        _ar = ar,
        _isCompleted = isCompleted;

  // "id" field.
  List<int>? _id;
  List<int> get id => _id ?? const [];
  set id(List<int>? val) => _id = val;

  void updateId(Function(List<int>) updateFn) {
    updateFn(_id ??= []);
  }

  bool hasId() => _id != null;

  // "thumbnail" field.
  List<String>? _thumbnail;
  List<String> get thumbnail => _thumbnail ?? const [];
  set thumbnail(List<String>? val) => _thumbnail = val;

  void updateThumbnail(Function(List<String>) updateFn) {
    updateFn(_thumbnail ??= []);
  }

  bool hasThumbnail() => _thumbnail != null;

  // "name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  set name(List<String>? val) => _name = val;

  void updateName(Function(List<String>) updateFn) {
    updateFn(_name ??= []);
  }

  bool hasName() => _name != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  set category(List<String>? val) => _category = val;

  void updateCategory(Function(List<String>) updateFn) {
    updateFn(_category ??= []);
  }

  bool hasCategory() => _category != null;

  // "duration" field.
  List<int>? _duration;
  List<int> get duration => _duration ?? const [];
  set duration(List<int>? val) => _duration = val;

  void updateDuration(Function(List<int>) updateFn) {
    updateFn(_duration ??= []);
  }

  bool hasDuration() => _duration != null;

  // "description" field.
  List<String>? _description;
  List<String> get description => _description ?? const [];
  set description(List<String>? val) => _description = val;

  void updateDescription(Function(List<String>) updateFn) {
    updateFn(_description ??= []);
  }

  bool hasDescription() => _description != null;

  // "video" field.
  List<String>? _video;
  List<String> get video => _video ?? const [];
  set video(List<String>? val) => _video = val;

  void updateVideo(Function(List<String>) updateFn) {
    updateFn(_video ??= []);
  }

  bool hasVideo() => _video != null;

  // "ar" field.
  List<String>? _ar;
  List<String> get ar => _ar ?? const [];
  set ar(List<String>? val) => _ar = val;

  void updateAr(Function(List<String>) updateFn) {
    updateFn(_ar ??= []);
  }

  bool hasAr() => _ar != null;

  // "isCompleted" field.
  List<bool>? _isCompleted;
  List<bool> get isCompleted => _isCompleted ?? const [];
  set isCompleted(List<bool>? val) => _isCompleted = val;

  void updateIsCompleted(Function(List<bool>) updateFn) {
    updateFn(_isCompleted ??= []);
  }

  bool hasIsCompleted() => _isCompleted != null;

  static LatihanStruct fromMap(Map<String, dynamic> data) => LatihanStruct(
        id: getDataList(data['id']),
        thumbnail: getDataList(data['thumbnail']),
        name: getDataList(data['name']),
        category: getDataList(data['category']),
        duration: getDataList(data['duration']),
        description: getDataList(data['description']),
        video: getDataList(data['video']),
        ar: getDataList(data['ar']),
        isCompleted: getDataList(data['isCompleted']),
      );

  static LatihanStruct? maybeFromMap(dynamic data) =>
      data is Map ? LatihanStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'thumbnail': _thumbnail,
        'name': _name,
        'category': _category,
        'duration': _duration,
        'description': _description,
        'video': _video,
        'ar': _ar,
        'isCompleted': _isCompleted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
          isList: true,
        ),
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.String,
          isList: true,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
          isList: true,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
          isList: true,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
          isList: true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
          isList: true,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
          isList: true,
        ),
        'ar': serializeParam(
          _ar,
          ParamType.String,
          isList: true,
        ),
        'isCompleted': serializeParam(
          _isCompleted,
          ParamType.bool,
          isList: true,
        ),
      }.withoutNulls;

  static LatihanStruct fromSerializableMap(Map<String, dynamic> data) =>
      LatihanStruct(
        id: deserializeParam<int>(
          data['id'],
          ParamType.int,
          true,
        ),
        thumbnail: deserializeParam<String>(
          data['thumbnail'],
          ParamType.String,
          true,
        ),
        name: deserializeParam<String>(
          data['name'],
          ParamType.String,
          true,
        ),
        category: deserializeParam<String>(
          data['category'],
          ParamType.String,
          true,
        ),
        duration: deserializeParam<int>(
          data['duration'],
          ParamType.int,
          true,
        ),
        description: deserializeParam<String>(
          data['description'],
          ParamType.String,
          true,
        ),
        video: deserializeParam<String>(
          data['video'],
          ParamType.String,
          true,
        ),
        ar: deserializeParam<String>(
          data['ar'],
          ParamType.String,
          true,
        ),
        isCompleted: deserializeParam<bool>(
          data['isCompleted'],
          ParamType.bool,
          true,
        ),
      );

  @override
  String toString() => 'LatihanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LatihanStruct &&
        listEquality.equals(id, other.id) &&
        listEquality.equals(thumbnail, other.thumbnail) &&
        listEquality.equals(name, other.name) &&
        listEquality.equals(category, other.category) &&
        listEquality.equals(duration, other.duration) &&
        listEquality.equals(description, other.description) &&
        listEquality.equals(video, other.video) &&
        listEquality.equals(ar, other.ar) &&
        listEquality.equals(isCompleted, other.isCompleted);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        thumbnail,
        name,
        category,
        duration,
        description,
        video,
        ar,
        isCompleted
      ]);
}

LatihanStruct createLatihanStruct() => LatihanStruct();
