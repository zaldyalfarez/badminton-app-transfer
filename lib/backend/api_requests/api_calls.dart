import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? jwt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  static String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userLogin.name''',
      ));
  static String? userEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userLogin.email''',
      ));
  static String? userRole(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userLogin.role''',
      ));
  static bool? userVerified(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.userLogin.verified''',
      ));
  static dynamic? userImage(dynamic response) => getJsonField(
        response,
        r'''$.data.userLogin.image''',
      );
  static int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.userLogin.id''',
      ));
  static String? responseMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
}

class VerificationCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "otp": "${escapeStringForJson(otp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verification',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/verification',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResendVerificationCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? jwt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Resend Verification',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/resend-verification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? resendVerificationMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
}

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'email': email,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? jwt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  static String? responseMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
  static bool? isVerified(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.userWithoutPassword.verified''',
      ));
  static int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.userWithoutPassword.id''',
      ));
  static String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userWithoutPassword.name''',
      ));
  static String? userEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userWithoutPassword.email''',
      ));
  static String? userRole(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userWithoutPassword.role''',
      ));
  static dynamic userImage(dynamic response) => getJsonField(
        response,
        r'''$.data.userWithoutPassword.image''',
      );
}

class UpdateProfileImageCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? jwt = '',
    int? userId,
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Profile Image',
      apiUrl:
          'https://api-badminton.arsitek-kode.com/api/profile/update/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'name': name,
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProfileNameCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? jwt = '',
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Profile Name',
      apiUrl:
          'https://api-badminton.arsitek-kode.com/api/profile/update/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'name': name,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllLatihanCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    String? name = '',
    String? kategori = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All Latihan',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/latihan',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'kategori': kategori,
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? latihanCard(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetLatihanByIdCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Latihan By Id',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/latihan/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? latihanData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetAllSoalByUjianIdCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All  Soal By Ujian Id',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/soal/ujian/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? latihanData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetKategoriCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Kategori',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/latihan/get/kategori',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? kategori(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAllUjianCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All Ujian',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/ujian',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? ujian(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetCoachListCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    String? role = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Coach List',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'role': role,
        'jwt': jwt,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? coachList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UserAddBookingCall {
  static Future<ApiCallResponse> call({
    int? coachId,
    String? date = '',
    String? time = '',
    String? jwt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "coachId": ${coachId},
  "date": "${escapeStringForJson(date)}",
  "time": "${escapeStringForJson(time)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Add Booking',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/booking',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookingCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Booking',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/booking',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? bookingMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
  static List? bookingData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetBookingByIdCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Booking by Id',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/booking/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? bookingDetail(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? bookingStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.status''',
      ));
}

class CoachUpdateBookingCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    String? status = '',
    String? reason = '',
    String? id = '',
  }) async {
    final ffApiRequestBody = '''
{
  "status": "${escapeStringForJson(status)}",
  "reason": "${escapeStringForJson(reason)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Coach Update Booking',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/booking/update/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
}

class GetNotifikasiCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Notifikasi',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/notif',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? dataNotifikasi(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UpdateNotifikasiCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Notifikasi',
      apiUrl:
          'https://api-badminton.arsitek-kode.com/api/user/notif/update/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? notifMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
}

class ForgotPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/forgot-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? forgotPasswordMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
}

class JawabSoalCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? userUjianId,
    int? soalId,
    String? answer = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userUjianId": ${userUjianId},
  "soalId": ${soalId},
  "answer": "${escapeStringForJson(answer)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Jawab Soal',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/answer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? jawabSoalMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
}

class StartUjianCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? ujianId,
  }) async {
    final ffApiRequestBody = '''
{
  "ujianId": ${ujianId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Start Ujian',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/start-ujian',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? startUjianMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meta.message''',
      ));
  static int? startUjianId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  static dynamic? startUjianData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class SubmitUjianCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? userUjianid,
  }) async {
    final ffApiRequestBody = '''
{
  "userUjianId": ${userUjianid}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Submit Ujian',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/submit-ujian',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SkorCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Skor',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/score/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHistoryUjianCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? ujianId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get History Ujian',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/history',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'ujianId': ujianId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? ujianList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetStatistikByUjianIdCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    int? ujianId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Statistik by Ujian Id',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/statistik',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'ujianId': ujianId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? avgDurasi(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.averageDurasi''',
      ));
  static double? avgSkor(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.averageSkor''',
      ));
  static int? attempt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.totalAttempt''',
      ));
}

class GetSearchCall {
  static Future<ApiCallResponse> call({
    String? jwt = '',
    String? kategori = '',
    String? nama = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Search',
      apiUrl: 'https://api-badminton.arsitek-kode.com/api/latihan-ujian',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'kategori': kategori,
        'name': nama,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? dataLatihan(dynamic response) => getJsonField(
        response,
        r'''$.data.latihan''',
        true,
      ) as List?;
  static List? dataUjian(dynamic response) => getJsonField(
        response,
        r'''$.data.ujian''',
        true,
      ) as List?;
  static dynamic? dataAll(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
