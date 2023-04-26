import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/activity_details/activity_details_widget.dart';
import '/pages/add_activity/add_activity_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nearby_activity_model.dart';
export 'nearby_activity_model.dart';

class NearbyActivityWidget extends StatefulWidget {
  const NearbyActivityWidget({
    Key? key,
    this.searchTerm,
  }) : super(key: key);

  final String? searchTerm;

  @override
  _NearbyActivityWidgetState createState() => _NearbyActivityWidgetState();
}

class _NearbyActivityWidgetState extends State<NearbyActivityWidget> {
  late NearbyActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NearbyActivityModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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

    return FutureBuilder<List<CourtsRecord>>(
      future: CourtsRecord.search(
        term: '*',
        location: getCurrentUserLocation(
            defaultLocation: LatLng(37.4298229, -122.1735655)),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFadingCircle(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<CourtsRecord> nearbyActivityCourtsRecordList = snapshot.data!;
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
                onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                initialLocation: _model.googleMapsCenter ??=
                    functions.getInitialMapLocation(currentUserLocationValue),
                markers: nearbyActivityCourtsRecordList
                    .map(
                      (nearbyActivityCourtsRecord) => FlutterFlowMarker(
                        nearbyActivityCourtsRecord.reference.path,
                        nearbyActivityCourtsRecord.location!,
                        () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActivityDetailsWidget(
                                court: nearbyActivityCourtsRecord,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
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
                alignment: AlignmentDirectional(-0.75, -0.92),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 8.0),
                  child: Text(
                    'Nearby Activity',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
