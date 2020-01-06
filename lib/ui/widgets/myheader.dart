import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 25,
            child: Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.3), BlendMode.srcOver),
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/01/04/20/15/web-design-1953129_1280.jpg",
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.table_chart,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 9.0,
                      ),
                      Text(
                        "IntelliScan",
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .apply(color: Colors.white, fontWeightDelta: 2),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Internal Identification App",
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .apply(fontWeightDelta: 2, color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    
                     
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
