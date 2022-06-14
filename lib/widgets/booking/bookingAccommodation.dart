import 'dart:async';

import 'package:flutter/material.dart';
import 'package:season_mobile_partner/api/api_accommodation.dart';
import 'package:season_mobile_partner/models/user/user.dart';
import 'package:season_mobile_partner/widgets/booking/calender.dart';

class BookingAccommodationWidget extends StatefulWidget {
  const BookingAccommodationWidget({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<BookingAccommodationWidget> createState() => _BookingAccommodationWidgetState();
}

class _BookingAccommodationWidgetState extends State<BookingAccommodationWidget> {
  final apiAcc = ApiAccommodation();

  Future<dynamic> callApiListAcc(partner) {
    return apiAcc.getAccommodations(partner);
  }

  // StreamSubscription? internetconnection;
  // bool isoffline = false;

  // @override
  // void initState() {
  //   internetconnection = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     // whenevery connection status is changed.
  //     if (result == ConnectivityResult.none) {
  //       //there is no any connection
  //       setState(() {
  //         isoffline = true;
  //       });
  //     } else if (result == ConnectivityResult.mobile) {
  //       //connection is mobile data network
  //       setState(() {
  //         isoffline = false;
  //       });
  //     } else if (result == ConnectivityResult.wifi) {
  //       //connection is from wifi
  //       setState(() {
  //         isoffline = false;
  //       });
  //     }
  //   }); // using this listiner, you can get the medium of connection as well.

  //   super.initState();
  // }

  // @override
  // dispose() {
  //   super.dispose();
  //   internetconnection!.cancel();
  //   //cancel internent connection subscription after you are done
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //   child: errmsg("No Internet Connection Available", isoffline),
          // ),
          FutureBuilder(
              future: callApiListAcc(widget.user.thirdParty["id"]),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Center(
                      child: Wrap(
                        children: [
                          for (var i = 0; i < snapshot.data["accommodations"].length; i++) card(snapshot.data["accommodations"][i], widget.user),
                        ],
                      ),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }

  Widget errmsg(String text, bool show) {
    //error message widget.
    if (show == true) {
      //if error is true then show error message box
      return Container(
        padding: EdgeInsets.all(10.00),
        margin: EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(right: 6.00),
            child: Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: TextStyle(color: Colors.white)),
          //show error message text
        ]),
      );
    } else {
      return Container();
      //if error is false, return empty container.
    }
  }

  Widget card(accommodation, user) {
    return Card(
      shadowColor: Colors.black,
      color: Colors.grey[350],
      child: SizedBox(
        width: 155,
        height: 170,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(backgroundColor: Colors.green, foregroundColor: Colors.white, child: Icon(Icons.home) //CircleAvatar
                  ), //CircleAvatar
              SizedBox(
                height: 1,
              ), //SizedBox
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(text: accommodation['internal_name'], style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')), //Textstyle
              ), //Text
              SizedBox(
                height: 5,
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(text: accommodation['external_name'], style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')), //Textstyle
              ), ////SizedBox//Text
              SizedBox(
                height: 5,
              ), //SizedBox
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CalendarWidget(
                                  user: user,
                                  accommodation: accommodation['internal_name'],
                                )));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.touch_app,
                          color: Colors.white,
                          size: 14,
                        ),
                        Text(
                          'View bookings',
                          style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                        ),
                      ],
                    ), //Row
                  ), //Padding
                ), //RaisedButton
              ) //SizedBox
            ],
          ), //Column
        ), //Padding
      ), //SizedBox
    );
  }
}
