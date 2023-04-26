import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'activity_added_success_model.dart';
export 'activity_added_success_model.dart';

class ActivityAddedSuccessWidget extends StatefulWidget {
  const ActivityAddedSuccessWidget({Key? key}) : super(key: key);

  @override
  _ActivityAddedSuccessWidgetState createState() =>
      _ActivityAddedSuccessWidgetState();
}

class _ActivityAddedSuccessWidgetState
    extends State<ActivityAddedSuccessWidget> {
  late ActivityAddedSuccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityAddedSuccessModel());
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
      backgroundColor: Color(0xFF21272D),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 120.0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Activity Added Successfully!',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Overpass',
                          color: FlutterFlowTheme.of(context).white,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Congrats! You have successfully created an activity! Thanks for contributing.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Overpass',
                            color: FlutterFlowTheme.of(context).iconGray,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 40.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: NavBarPage(initialPage: 'findActivity'),
                    ),
                  );
                },
                text: 'Okay, Go Home',
                options: FFButtonOptions(
                  width: 230.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Overpass',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
