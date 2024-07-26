import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:retrofit_exam2/api_service/api_service.dart';
import 'package:retrofit_exam2/api_service/dust.dart';
import 'package:retrofit_exam2/provider/provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  Future<Dust> fetchDustData(double lat, double lon) async {
    return await ApiService(Dio(), baseUrl: "http://api.openweathermap.org/")
        .getDust(lat, lon, '3bbea22f826e4eef49dc445bd1114a75');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
  }

  Future<void> location() async {
    bool _serviceEnabled;
    LocationPermission _permissionGranted;
    Position _position;

    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Geolocator.openLocationSettings();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await Geolocator.checkPermission();
    if (_permissionGranted == LocationPermission.denied) {
      _permissionGranted = await Geolocator.requestPermission();
      if (_permissionGranted != LocationPermission.always) {
        return;
      }
    }

    _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print(_position.latitude);
    print(_position.longitude);

    ref.read(latitudeProvider.notifier).state = _position.latitude;
    ref.read(longitudeProvider.notifier).state = _position.longitude;

  }

  @override
  Widget build(BuildContext context) {
    final latitude = ref.watch(latitudeProvider);
    final longitude = ref.watch(longitudeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("$latitude, $longitude"),
      ),
      body: FutureBuilder<Dust>(
          future: fetchDustData(latitude, longitude),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return ListTile(
                title: Text(snapshot.data!.coord.lat.toString()),
                subtitle:
                    Text(snapshot.data!.list[0].components.pm10.toString()),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
