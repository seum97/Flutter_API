import 'package:flutter/material.dart';
import 'package:flutter_api/model/user.dart';
import 'package:flutter_api/services/apiService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ApiUser? user;

  void getUser()  async {
    ApiUser? temp = await ApiService().getAPIData();
    setState(() {
      user = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future location(double lat, double lng, {int zoomLevel = 10}) async {
    String googleMapLocation = 'http://www.google.com/maps/place/$lat,$lng/@$lat,$lng,${zoomLevel}z';
    //http://www.google.com/maps/place/<lat>,<lng>/@<lat>,<lng>,<zoom>z
    await canLaunchUrlString(googleMapLocation)
        ? await launchUrlString(googleMapLocation) : "Not found";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is home"),
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("FirstName: ${user?.fname}", style: TextStyle(fontSize: 30),),
          Text("LastName: ${user?.lname}", style: TextStyle(fontSize: 30),),
          Text("Email: ${user?.email}", style: TextStyle(fontSize: 30),),
          Text("Address: ${user?.address?['address']}", style: TextStyle(fontSize: 30),),
          Text("City: ${user?.address?['city']}", style: TextStyle(fontSize: 30),),
          Text("Latitude: ${user?.address?['coordinates']['lat']}", style: TextStyle(fontSize: 30),),
          Text("Longitude: ${user?.address?['coordinates']['lng']}", style: TextStyle(fontSize: 30),),

          ElevatedButton(onPressed: (){
            location(user?.address?['coordinates']['lat'],
              user?.address?['coordinates']['lng'],
            zoomLevel: 15);
          }, child: Text("Open Map")),

        ],
      )
    );
  }
}
