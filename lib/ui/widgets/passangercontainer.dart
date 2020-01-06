import 'package:flutter/material.dart';

class PassengerContainer extends StatelessWidget {
  final String imageUrl, fullName, id, email, phone, username;

  const PassengerContainer(
      {Key key, this.imageUrl, this.fullName, this.id, this.email, this.phone, this.username})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        Spacer(
          flex: 1,
        ),
        FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                fullName,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Username: $username",
                style: TextStyle(fontSize: 13.0),
              ),
              Text(
                "Identification number: $id",
                style: TextStyle(fontSize: 13.0),
              ),
              Text(
                "Email: $email",
                style: TextStyle(fontSize: 13.0),
              ),
              Text(
                "Phone number: $phone",
                style: TextStyle(fontSize: 13.0),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 3,
        ),
         
      ],
    );
  }
}
