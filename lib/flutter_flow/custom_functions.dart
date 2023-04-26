import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

String getMapUrl(LatLng? location) {
  return 'https://www.google.com/maps/search/?api=1&'
      'query=${location?.latitude},${location?.longitude}';
}

String getAverageRating(List<CommentsRecord>? comments) {
  if (comments!.isEmpty) {
    return '-';
  }
  var ratingsSum = 0.0;
  for (final comment in comments) {
    ratingsSum += comment.courtQualityRating!;
  }
  return '${(ratingsSum / comments.length).toStringAsFixed(1)}';
}

LatLng getInitialMapLocation(LatLng? userLocation) {
  if (userLocation == null ||
      (userLocation.latitude == 0 && userLocation.longitude == 0)) {
    return LatLng(13.7945924, 100.3221819);
  }
  return userLocation;
}
