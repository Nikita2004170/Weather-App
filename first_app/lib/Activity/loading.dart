import "package:flutter/material.dart";
import 'package:my_new_project/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temp = "";
  String hum = "";
  String air_speed = "";
  String des = "";
  String main = "";
  String imagePath = "images/27047734.jpg";
  String icon = "";
  String city = "kanpur";
  void start(String city) async {
    worker instance = worker(location: city);
    await instance.display();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(
      const Duration(seconds: 4),
    );
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value": temp,
      "hum_value": hum,
      "air_speed_value": air_speed,
      "des_value": des,
      "main_value": main,
      "imagePath": imagePath,
      "icon_value": icon,
      "city_value": city,
    });
    // print("Temperature updated: $temperature");
  }

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   final Map search =
    //       ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    //   city = search['search text'] ?? "Unknown City";
    start(city);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final Map search = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    if (search?.isNotEmpty ?? false) {
      city = search['SearchText'] ?? "Unknown City";
    }
    // start(city);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 104, 170, 220),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "images/27047734.jpg", // Your image path
                  width: 200, // Set the width of the image
                  height: 200, // Set the height of the image
                  fit: BoxFit.cover, // Ensure the image covers the circle
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Weather App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "made by nikita",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              const SpinKitWave(
                color: Colors.white, // Set the color of the spinner
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
