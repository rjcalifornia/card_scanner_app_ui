import 'dart:convert';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flight_app/api/active_users_api.dart';
import 'package:flight_app/global.dart';
import 'package:flight_app/models/users.dart';
import 'package:flight_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';

import 'details.dart';
//import 'dart:typed_data';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var activeUsers = new List<UsersModel>();
  Timer timer;
  int _active = 0;
  String barcode = '';

  Future _getFromApi() async {
    UsersList.getActiveUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        activeUsers = list.map((model) => UsersModel.fromJson(model)).toList();
        

      });
    });
  }

initState() {
    super.initState();
    _getFromApi();
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) => _getFromApi());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _active,
        onItemSelected: (index) => setState(() {
          _active = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
           
          BottomNavyBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text("Settings"),
          ),
        ],
      ),
      backgroundColor: Color(0xfff4f6ff),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            MyHeader(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Check identification",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .apply(fontWeightDelta: 2),
                      ),
                       
                    ],
                  ),
                  SizedBox(height: 18.0),
                  
                                       Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 21.0, vertical: 31.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 11,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      
                      child: Row(
                        
                        children: <Widget>[
                         
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                FlatButton.icon(
          color: Colors.white,
          icon: Icon(Icons.scanner), //`Icon` to display
          label: Text('Scan Visitor\'s Identification',
                  style: Theme.of(context).textTheme .subtitle.apply(color: Theme.of(context).accentColor)), //`Text` to display
          onPressed: () {
            _scanFromCamera();
          },),
                                
                              ],
                              
                            ),
                            
                          ),
                           
                        ],
                      ),
                    ),
                  
                  SizedBox(height: 15.0),
                   
                  SizedBox(height: 9.0),
                   ],
              ),
            ),
          ],
        )),
      ),
    );
  }
  Future _scanFromCamera() async {
    print('testing');
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);

    for (int i = 0; i < activeUsers.length; i++)
        {
          if(activeUsers[i].id.toString() == barcode)
          {
            print("name***************************");
            print(activeUsers[i].name);
            print("***************************endName");
            
Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => DetailsScreen(id: i, user: activeUsers),
                              ),
                            );
          }
        }
         
  



    print(barcode);
  }
}
