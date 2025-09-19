import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class BadmintonAppAuthUser {
  BadmintonAppAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<BadmintonAppAuthUser> badmintonAppAuthUserSubject =
    BehaviorSubject.seeded(BadmintonAppAuthUser(loggedIn: false));
Stream<BadmintonAppAuthUser> badmintonAppAuthUserStream() =>
    badmintonAppAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
