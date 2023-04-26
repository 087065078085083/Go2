import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyPhoneModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SmsCodeTextField widget.
  TextEditingController? smsCodeTextFieldController;
  String? Function(BuildContext, String?)? smsCodeTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    smsCodeTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
