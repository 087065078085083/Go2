import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rate_activity_model.dart';
export 'rate_activity_model.dart';

class RateActivityWidget extends StatefulWidget {
  const RateActivityWidget({
    Key? key,
    this.court,
  }) : super(key: key);

  final CourtsRecord? court;

  @override
  _RateActivityWidgetState createState() => _RateActivityWidgetState();
}

class _RateActivityWidgetState extends State<RateActivityWidget> {
  late RateActivityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RateActivityModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rate Activity',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rate the court below.',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 90.0,
                  constraints: BoxConstraints(
                    maxWidth: 350.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).darkBG,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset(
                        'assets/images/classHero.jpg',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Color(0x2E000000),
                        offset: Offset(0.0, 4.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0x65000000),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          valueOrDefault<String>(
                            widget.court!.imageUrl,
                            'https://images.unsplash.com/photo-1602357280104-742c517a1d82?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                          ),
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.court!.name!,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'What would you rate this court?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  setState(() => _model.ratingBarValue = newValue),
              itemBuilder: (context, index) => Icon(
                Icons.star_border,
                color: FlutterFlowTheme.of(context).primary,
              ),
              direction: Axis.horizontal,
              initialRating: _model.ratingBarValue ??= 0.0,
              unratedColor: FlutterFlowTheme.of(context).grayLines,
              itemCount: 5,
              itemPadding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
              itemSize: 40.0,
              glowColor: FlutterFlowTheme.of(context).primary,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 12.0),
            child: TextFormField(
              controller: _model.textController1,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Review Title',
                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                hintText: 'Text here...',
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).grayLines,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).white,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
              ),
              style: FlutterFlowTheme.of(context).titleSmall,
              validator: _model.textController1Validator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 15.0),
            child: TextFormField(
              controller: _model.textController2,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Review Details',
                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                hintText: 'Text here...',
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).grayLines,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).white,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 20.0),
              ),
              style: FlutterFlowTheme.of(context).titleSmall,
              maxLines: 3,
              validator: _model.textController2Validator.asValidator(context),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              final commentsCreateData = createCommentsRecordData(
                user: currentUserReference,
                text: _model.textController2.text,
                court: widget.court!.reference,
                courtQualityRating: _model.ratingBarValue,
                title: _model.textController1.text,
              );
              await CommentsRecord.collection.doc().set(commentsCreateData);
              Navigator.pop(context);
            },
            text: 'Submit Rating',
            icon: Icon(
              Icons.star_outline_rounded,
              size: 15.0,
            ),
            options: FFButtonOptions(
              width: 270.0,
              height: 50.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Overpass',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
