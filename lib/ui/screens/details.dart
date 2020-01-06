import 'package:flutter/material.dart';
import 'package:flight_app/global.dart';
import 'package:flight_app/ui/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  final user;
  const DetailsScreen({Key key, @required this.id, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(49, 57, 69, 0.9),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("VISITOR INFORMATION"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Color.fromRGBO(49, 57, 69, 0.9),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 7.0,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xfff7f9ff)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color.fromRGBO(49, 57, 69, 0.9), Color(0xfff7f9ff)],
                      ),
                    ),
                     
                  ),
                   
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        PassengerContainer(
                          id: "${user[id].id}",
                          imageUrl: userimageUrl,
                          fullName: "${user[id].name}",
                          email: "${user[id].email}",
                          phone: "${user[id].phone}",
                          username: "${user[id].userName}",
                        ),
                        Divider(),
                         
                      ],
                    ),
                  ),
                  Image.network(boardingpassImg),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FlightInfoRow extends StatelessWidget {
  final String title, content;

  const FlightInfoRow({Key key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "$title",
          style: Theme.of(context).textTheme.body1.apply(color: Colors.black45),
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          "$content",
          style: Theme.of(context).textTheme.title.apply(color: Colors.black87),
        )
      ],
    );
  }
}
