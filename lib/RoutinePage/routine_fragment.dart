import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jivan/RoutinePage/services/decoder.dart';
import 'services/location.dart';

class RoutineFragment extends StatefulWidget {
  const RoutineFragment({Key? key}) : super(key: key);

  @override
  State<RoutineFragment> createState() => _RoutineFragmentState();
}

class _RoutineFragmentState extends State<RoutineFragment> {

  var apiKey = '8348920628871fc6059140a2cba32480';
  var openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

  @override
  void initState(){
    // TODO: implement initState
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocationOfUser();
    Decoder decoder = Decoder(url:'$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    print(location.longitude);
    print(location.latitude);
    var weather = await decoder.getData();
    print(weather['weather'][0]['main']);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
