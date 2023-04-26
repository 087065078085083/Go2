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
import 'find_activity_model.dart';
export 'find_activity_model.dart';

class FindActivityWidget extends StatefulWidget {
  const FindActivityWidget({Key? key}) : super(key: key);

  @override
  _FindActivityWidgetState createState() => _FindActivityWidgetState();
}

class _FindActivityWidgetState extends State<FindActivityWidget> {
  late FindActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FindActivityModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.courtSearchFieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitFadingCircle(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 48.0,
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 250),
                reverseDuration: Duration(milliseconds: 250),
                child: AddActivityWidget(),
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          FlutterFlowGoogleMap(
            controller: _model.googleMapsController,
            onCameraIdle: (latLng) =>
                setState(() => _model.googleMapsCenter = latLng),
            initialLocation: _model.googleMapsCenter ??=
                functions.getInitialMapLocation(currentUserLocationValue),
            markerColor: GoogleMarkerColor.violet,
            mapType: MapType.normal,
            style: GoogleMapStyle.standard,
            initialZoom: 14.0,
            allowInteraction: true,
            allowZoom: true,
            showZoomControls: false,
            showLocation: true,
            showCompass: false,
            showMapToolbar: false,
            showTraffic: false,
            centerMapOnMarkerTap: true,
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: 140.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).white,
                    Color(0x00FFFFFF)
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -0.8),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x34000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).grayLines,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -0.3),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: TextFormField(
                      controller: _model.courtSearchFieldController,
                      onFieldSubmitted: (_) async {
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));
                        setState(() => _model.algoliaSearchResults1 = null);
                        await CourtsRecord.search(
                          term: valueOrDefault<String>(
                            _model.courtSearchFieldController.text,
                            '*',
                          ),
                          location: getCurrentUserLocation(
                              defaultLocation:
                                  LatLng(37.4298229, -122.1735655)),
                        )
                            .then((r) => _model.algoliaSearchResults1 = r)
                            .onError(
                                (_, __) => _model.algoliaSearchResults1 = [])
                            .whenComplete(() => setState(() {}));
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search for activity...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
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
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Overpass',
                            color: FlutterFlowTheme.of(context).iconGray,
                          ),
                      validator: _model.courtSearchFieldControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.75, -0.92),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 8.0),
              child: Text(
                'Find an Activity',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.89, -0.77),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.search_outlined,
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
              onPressed: () async {
                setState(() => _model.algoliaSearchResults2 = null);
                await CourtsRecord.search(
                  term: _model.courtSearchFieldController.text,
                )
                    .then((r) => _model.algoliaSearchResults2 = r)
                    .onError((_, __) => _model.algoliaSearchResults2 = [])
                    .whenComplete(() => setState(() {}));
              },
            ),
          ),
        ],
      ),
    );
  }
}
