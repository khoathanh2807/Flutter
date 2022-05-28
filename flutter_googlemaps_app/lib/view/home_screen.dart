import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './platform_alert.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<StatefulWidget> {

  GoogleMapController? mapController;

  late LatLng coordinateValue;    // coordinateValue: giá trị Toạ độ (bao gồm Vĩ độ latitude và Kinh độ longtitude)
  List<Marker> markers = [];

  Location location = Location();

  late PermissionStatus locationPermissionStatus;
  late bool locationServiceStatus;

  @override
  void setState(VoidCallback fn) {
  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    setState(() {
      checkLocationService();
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

          appBar: AppBar(
            title: Text('Google Maps Demo App'),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.add_location_alt_outlined),
                onPressed: () => findPlaces(),
              ),
              _logOut(),
            ],
          ),

          body: FutureBuilder(

            future: findUserInputLocation(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.hasData) {

                return GoogleMap(   // hiện Google Maps

                  mapType: MapType.hybrid,
                  onCameraIdle: () => setState(() {}),
                  compassEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  buildingsEnabled: true,
                  indoorViewEnabled: true,
                  trafficEnabled: true,
                  mapToolbarEnabled: false,
                  scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,

                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },

                  initialCameraPosition: CameraPosition(
                      target: snapshot.data,
                      zoom: 15,
                  ),

                  markers: Set<Marker>.of(markers),

                );

              } else {

                return _setLoading();

              }

            },

          ),

          // floatingActionButton: FloatingActionButton(
          //   child: Icon(Icons.my_location),
          //   onPressed: () => {
          //
          //     findUserInputLocation(),
          //
          //     mapController?.moveCamera( CameraUpdate.newCameraPosition(
          //         CameraPosition(
          //             target: coordinateValue,
          //             zoom: 15
          //         )
          //     )),
          //
          //     // GoogleMap(initialCameraPosition: CameraPosition(target: coordinateValue), markers: Set<Marker>.of(markers),),
          //
          //     setState(() {
          //     })
          //
          //   },
          // ),

        );

  }

  Future<LatLng> findUserInputLocation() async {

    print('Called function findUserInputLocation() successful!');

    // Location location = Location();
    LocationData userInputLocation;

    // PermissionStatus hasPermission = await location.hasPermission();
    // bool active = await location.serviceEnabled();

    locationPermissionStatus = await location.hasPermission();
    locationServiceStatus = await location.serviceEnabled();

    print('hasPermission = $locationPermissionStatus');
    print('active = $locationServiceStatus');

    if (locationPermissionStatus == PermissionStatus.granted && locationServiceStatus) {

      userInputLocation = await location.getLocation();

      print('getLocation Successful');

      // coordinateValue: Toạ độ (bao gồm Vĩ độ latitude và Kinh độ longtitude)
      coordinateValue = LatLng(
          userInputLocation.latitude as double,   // Vĩ độ
          userInputLocation.longitude as double   // Kinh độ
      );

      print('userInputLocation.latitude = ${userInputLocation.latitude}');
      print('userInputLocation.longitude = ${userInputLocation.longitude}');

      location.onLocationChanged.listen((LocationData currentLocation) {
        // Use current location
        userInputLocation = currentLocation;
        print('Location changed...');

        // mapController.animateCamera( CameraUpdate.newCameraPosition( new CameraPosition(
        //     target: coordinateValue,
        //     zoom: 15.0,
        // )));
      });

    } else {

      print('getLocation Failed');

      checkLocationService();

      // print('Use Default location... ');
      // Example: TDT University Address
      // coordinateValue = LatLng(10.732869174213993, 106.69973741130023);

    }

    // // if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
    // if (await Permission.location.isGranted) {
    //   userInputLocation = await location.getLocation();
    //   coordinateValue = LatLng(
    //           userInputLocation.latitude as double,   // Vĩ độ
    //           userInputLocation.longitude as double   // Kinh độ
    //   );
    // } else {
    //   // openAppSettings();
    //   coordinateValue = LatLng(10.732869174213993, 106.69973741130023);
    // }

    // Display marker at the user position
    // if (markers.isEmpty) {
    //   markers.add(buildMaker(coordinateValue));
    // } else {
    //   markers[0] = buildMaker(coordinateValue);
    // }

    setState(() {
    });

    print('coordinateValue = $coordinateValue');

    return coordinateValue;

  }

  // Marker buildMaker(LatLng coordinate) {   // coordinate: Toạ độ (bao gồm Vĩ độ latitude và Kinh độ longtitude)
  //
  //   MarkerId markerId = MarkerId('H');
  //
  //   Marker marker = Marker(
  //       markerId: markerId,
  //       position: coordinate
  //   );
  //
  //   return marker;
  //
  // }

  void checkLocationService() async {

    await location.requestService();      // hiện thông báo nếu chưa bật chức năng Location trong Settings

    print('Called function checkLocationService() successful!');

    locationPermissionStatus = await location.hasPermission();
    locationServiceStatus = await location.serviceEnabled();

    if (!locationServiceStatus) {

      final alert = PlatformAlert(
        title: 'Location Service Is Disabled!',
        message: 'Please Turn On Location Service In Device Setting.',
      );
      alert.show(context);

    }

    if (locationPermissionStatus == PermissionStatus.denied) {

      location.requestPermission().then((value) {     // requestPermission() lệnh yêu cầu user cấp quyền truy cập Location cho app

          if (value == PermissionStatus.granted) {
            location.enableBackgroundMode(enable: true);
            // locationPermissionStatus = value;
            updateLocationPermissionStatus(value);
            // findUserInputLocation();
          }

      });

      final alert = PlatformAlert(
        title: 'Location Access Not Granted!',
        message: 'This app needs location permission to locate your location.',
      );
      alert.show(context);

    }

  }

  void updateLocationPermissionStatus(PermissionStatus newPermissionStatus){

    if (locationPermissionStatus != newPermissionStatus) {
      locationPermissionStatus = newPermissionStatus;
      setState(() {
      });
    }

  }

  Future<List<Marker>> findPlaces() async {

    // const String key = 'AIzaSyBF3yTwKe6Zsh2acq4EJO6G25USC_cDeaI';
    // const String placesUrl = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?';
    // // String url = placesUrl + 'key=$key&type=restaurant&location=${coordinateValue.latitude},${coordinateValue.longitude}' + '&radius=1000000';
    // String url = placesUrl + 'key=$key&type=school&location=${coordinateValue.latitude},${coordinateValue.longitude}' + '&radius=1000000';


    String url = 'https://about.google/static/data/locations.json';


    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final data = json.decode(response.body);
      showMarkers(data);

      print('data = $data');

      return markers;

    } else {
      throw Exception('Unable to retrieve places');
    }

  }

  showMarkers(data) {

    // List places = data['results'];
    // markers.clear();
    //
    // places.forEach((place) {
    //   markers.add(Marker(
    //       markerId: MarkerId(place['reference']),
    //       position: LatLng(
    //           place['geometry']['location']['lat'],
    //           place['geometry']['location']['lng']
    //       ),
    //       infoWindow: InfoWindow(
    //           title: place['name'],
    //           snippet: place['vicinity']
    //       ),
    //   ));
    // });
    //
    // setState(() {
    //   markers = markers;
    // });
    //
    // if (data['error_message'].toString().isNotEmpty) {
    //
    //   final alert = PlatformAlert(
    //     title: 'Error!',
    //     message: data['error_message'].toString(),
    //   );
    //   alert.show2(context);
    //
    // }


    List places = data['offices'];
    markers.clear();

    places.forEach((place) {
      markers.add(Marker(
        markerId: MarkerId(place['id']),
        position: LatLng(
            place['lat'],
            place['lng']
        ),
        infoWindow: InfoWindow(
            title: place['name'],
            snippet: place['address']
        ),
      ));
    });

    setState(() {
      markers = markers;
    });

  }

  Widget _setLoading() {

    return Scaffold(
      // body: _setContentLoading(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[

            Text('Please Wait...', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.teal),),
            SizedBox(height: 45),

            CircularProgressIndicator(),

          ],
        ),
      ),
    );

  }

  // Widget _setContentLoading() {

  //   return Align(
  //     alignment: Alignment.center,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Text(
  //           'Please Wait',
  //           style: const TextStyle(fontSize: 25, color: Colors.blueAccent),
  //         ),
  //         SizedBox(height: 20),
  //         CircularProgressIndicator(),
  //       ],
  //     ),
  //   );

  // }

  Widget _logOut() {

    return IconButton(

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/login');
        // Navigator.pushReplacementNamed(context, '/login');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },

    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}