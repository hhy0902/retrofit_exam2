import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_exam2/api_service/api_service.dart';
import 'package:retrofit_exam2/api_service/dust.dart';

void main() {
  runApp(const MyApp());
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrofit"),
      ),
      body: FutureBuilder<Dust>(
          future: ApiService(Dio(), baseUrl: "http://api.openweathermap.org/")
              .getDust(37.510079, 127.043184, '3bbea22f826e4eef49dc445bd1114a75'),
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
