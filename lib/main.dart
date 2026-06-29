import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as ymap_init;
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart' as mk;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ymap_init.initMapkit(
    apiKey: 'd8ce1f42-8e60-45f0-b618-0266d07eb414',
    locale: 'ru_RU',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const MaterialApp(home: MapScreen());
}

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MapKit Minimal Test')),
      body: YandexMap(
        onMapCreated: (mk.MapWindow mapWindow) {
          mapWindow.map.move(
            mk.CameraPosition(
              const mk.Point(latitude: 43.238949, longitude: 76.889709),
              zoom: 11.0,
              azimuth: 0.0,
              tilt: 0.0,
            ),
          );
        },
      ),
    );
  }
}