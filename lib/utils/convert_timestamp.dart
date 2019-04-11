import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

DateTime convertTimestamp(dynamic _stamp) {
  if (_stamp != null) {
    if (Platform.isIOS) {
      return Timestamp(_stamp.seconds, _stamp.nanoseconds).toDate();
    } else if (Platform.isAndroid) {
      return _stamp;
    }
    return null;
  } else {
    return null;
  }
}
