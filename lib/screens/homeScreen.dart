import 'dart:convert';

import 'package:ezinore/Model/Data.dart';
import 'package:ezinore/screens/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // BMSDATA? bmsdata;
  List sensorData = [];
  Map<String,dynamic>? bms;
  _fetchData() async{
  try {
    final dataApi = await http.get(Uri.parse('https://4izn0wwllg.execute-api.eu-north-1.amazonaws.com/prod/solarlist?sensorId=sensor101'));
    // print(jsonDecode(dataApi.body));
    sensorData = jsonDecode(dataApi.body);
    bms = sensorData[0];
    print(bms?['rain']);
  } catch (e) {
    Exception('ERROR IN PARSING DATA');
  }
  }
  @override
  void initState() {
    super.initState();
    _fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text(bms?['rain']),
        ElevatedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
        }, child: const Text('Logout')),
        ElevatedButton(onPressed: _fetchData, child: const Text('GET API DATA'))
      ],
      )),
    );
  }
}