import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_page_model.dart';
export 'register_page_model.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key? key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  late RegisterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterPageModel());

    _model.inputNormalController ??= TextEditingController();
    _model.passwordTextController ??= TextEditingController();
    _model.confirmPasswordTextController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Register',
                    style: FlutterFlowTheme.of(context).displaySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 70.0, 0.0),
                      child: Text(
                        'Create an account below, by entering your information.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: TextFormField(
                        controller: _model.inputNormalController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                          hintText: 'Enter your email address...',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                        keyboardType: TextInputType.emailAddress,
                        validator: _model.inputNormalControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.passwordTextController,
                      obscureText: !_model.passwordVisibility1,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                        hintText: 'Enter Password',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => _model.passwordVisibility1 =
                                !_model.passwordVisibility1,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 20.0,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Overpass',
                            color: Color(0xFF14181B),
                          ),
                      validator: _model.passwordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.confirmPasswordTextController,
                      obscureText: !_model.passwordVisibility2,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                        hintText: 'Enter Password',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => _model.passwordVisibility2 =
                                !_model.passwordVisibility2,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 20.0,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Overpass',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                      validator: _model.confirmPasswordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (_model.passwordTextController.text !=
                          _model.confirmPasswordTextController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Passwords don\'t match!',
                            ),
                          ),
                        );
                        return;
                      }

                      final user = await authManager.createAccountWithEmail(
                        context,
                        _model.inputNormalController.text,
                        _model.passwordTextController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'nearbyActivity'),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Create Account',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
