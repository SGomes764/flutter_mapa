import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';


class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  MapController _mapController = MapController();
  LatLng _currentLocation = LatLng(39.7536394,-8.8751415);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('MAP PAGE EXIBIDA');
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _checkPermissions(); // construtor para verificar permissões
  }

  // verificar permissões
  Future<void> _checkPermissions() async {
    var statusLocation = await Permission.location.status;
    var statusWifi = await Permission.locationWhenInUse.status;

    if (statusLocation.isDenied) { // permissão de localisação
      await Permission.location.request();
    }

    if (statusWifi.isDenied) { // permissão de Wifi
      await Permission.locationWhenInUse.request();
    }

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
      _mapController.move(_currentLocation, 13.0);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 7.2,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: "com.example.app",
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentLocation,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: _getCurrentLocation,
                  tooltip: 'Localização Atual',
                  child: const Icon(Icons.location_searching),
                ),
                const SizedBox(height: 16.0),
                FloatingActionButton( //TODO botão da bússola
                  onPressed: () {
                    //TODO adiconar a logica onPressed
                  },
                  tooltip: 'Bússola',
                  child: const Icon(CupertinoIcons.compass),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}