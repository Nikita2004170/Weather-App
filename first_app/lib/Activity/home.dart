import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    //_fetchDataForAllCities();
    //print("init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    // print("set state");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final route = ModalRoute.of(context) as MaterialPageRoute?;
    // final Map<String, String>? info =
    //     route?.settings.arguments as Map<String, String>?;
    var city_name = ["kanpur", "lucknow", "Dehli", "Noida", "Kolkata"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    //final Map info = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    final Map info = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
//print(info); // Debugging print

    String temp = (info['temp_value']?.toString() ?? "0.0").substring(0, 5);
    String icon = info['icon_value']?.toString()?.trim() ?? "01d";
    String getcity = info['city_value'] ?? "Unknown";
    String hum = info['hum_value'] ?? "0";
    String air = (info['air_speed_value']?.toString() ?? "0.0").substring(0, 5);
    String des = info['des_value'] ?? "No description";
    String main = info['main_value'] ?? "N/A";

    //print(icon);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 5, 121, 175),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(25.0), // Set your preferred height here
          child: AppBar(
            // Set background to transparent for gradient visibility
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove AppBar shadow for a flat look
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            //color: Colors.grey,
            padding: EdgeInsets.all(7),
            child: Column(
              children: <Widget>[
                Container(
                  //color: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // Pass the search text to the Loading screen
                          Navigator.pushNamed(context, "/loading", arguments: {
                            "search text": searchcontroller.text.trim(),
                          });
                        },
                        child: Container(
                          child: Icon(Icons.search),
                          width: 40,
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),

                      //SizedBox(width: 12,)
                      Expanded(
                          child: TextField(
                        controller: searchcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search any city name"),
                      )),
                    ],
                  ),
                ),
                // SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5)),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            Column(
                              children: <Widget>[
                                Text(des),
                                Text("In $getcity"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5)),
                        padding: const EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "c",
                                  style: TextStyle(fontSize: 30),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5)),
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(WeatherIcons.day_windy),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Text(
                                      "$air",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "km/hr",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5)),
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(WeatherIcons.humidity),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Text(
                                      "$hum",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "percent",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Made By Nikita Sachan",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text("Data Provided By OpenWeatherMap.org"),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
