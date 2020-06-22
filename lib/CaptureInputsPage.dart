import 'dart:async';
import 'package:erg_app/api/webservice.dart';
import 'package:erg_app/models/weather_model.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

// /// This Widget is the main application widget.


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CaptureInputsPage(),
    );
  }
}

class CaptureInputsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API DATA From ERG Server"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          
          //  if (snapshot.hasError == false) {
          //     return Text ( "Has Data" );
          //   }
          if (snapshot.hasData) {
          
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (Post post) => ListTile(
                      title: Text(post.fname),
                      subtitle: Text("${post.lname}"),
                      
                      // onTap: () => Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => PostsPage(
                      //       post: post,
                      //     ),
                      //   ),
                      // ),
                    ),
                  )
                  .toList(),
            );
          } 
          else {
            return Text ( " ${snapshot.error} " );
            // Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


















































// import 'dart:async';
// import 'dart:convert';
// import 'package:erg_app/services/webservice.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:erg_app/widgets/nav-drawer.dart';

// void main() => runApp(
//   CaptureInputsPage()
//   );

// /// This Widget is the main application widget.
// class CaptureInputsPage extends StatelessWidget {
//   static const String _title = 'ERG Agro';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,

//       title: _title,
//       home: Scaffold(
//         drawer: NavDrawer(),
//          appBar: AppBar(title: Text('Capture Inputs'),
//           iconTheme: IconThemeData(color: Colors.white),
//           backgroundColor: Colors.green,
//         ),
//         body: Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);
  
//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   // String dropdownValue = 'One';


//   // GET WEATHER
//   List<WeatherForecast> _weatherForcast = List<WeatherForecast>();

//   @override
//   void initState() {
    
//     super.initState();
//     // initialization of the http request
//     _populateWeatherForcast();
//   }

// _populateWeatherForcast(){
//     Webservice().load(WeatherForecast.all).then((weatherForecast) =>{
//       setState(() =>{
//         _weatherForcast = weatherForecast
//       })
//     });
//   }

  

//    ListTile _buildItemsForListView(BuildContext context, int index) {
//       return ListTile(
      
//         title: Text(_weatherForcast[index].date, style: TextStyle(fontSize: 18)),
//         subtitle: Text(_weatherForcast[index].summary, style: TextStyle(fontSize: 18)),
//       );
//   }



//   @override
//   Widget build(BuildContext context) {

//     // where the out put will be 
//      return Scaffold(
       
//         body: ListView.builder(
//           itemCount: _weatherForcast.length,
//           itemBuilder: _buildItemsForListView,

          
//         )
//       );
//   }
// }

// class WeatherForecast{
//   final String date;
//   final String summary;

//   WeatherForecast({this.date, this.summary});

//   factory WeatherForecast.fromJson(Map<String, dynamic> json){
//     return WeatherForecast(
//       date: json['date'],
//       summary: json['summary'],

//     );
//   }

//   static Resource<List<WeatherForecast>> get all{
//     return Resource(
//       url: "http://api.ergagro.com:112/WeatherForecast",
//       parse: (response){
//         final result = json.decode(response.body);
//         Iterable list = result['weathers'];
//         return list.map((model) => WeatherForecast.fromJson(model)).toList();
//       }
//     );
//   }
// }

