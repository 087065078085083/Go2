import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/add_activity/add_activity_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FindActivityModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for courtSearchField widget.
  TextEditingController? courtSearchFieldController;
  String? Function(BuildContext, String?)? courtSearchFieldControllerValidator;
  // Algolia Search Results from action on courtSearchField
  List<CourtsRecord>? algoliaSearchResults1 = [];
  // Algolia Search Results from action on IconButton
  List<CourtsRecord>? algoliaSearchResults2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    courtSearchFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
