import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:zeta/constants/colors.dart';
import 'package:zeta/services/zermelo/Appointment/Appointment.dart';
import 'package:zeta/ui/home/components/HomeworkCard.dart';
import 'package:zeta/ui/home/home.dart';

class AppointmentDetails extends StatefulWidget {
  final Appointment appointment;
  AppointmentDetails({Key key, this.appointment}) : super(key: key);

  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails>
    with WidgetsBindingObserver {
  final ScrollController scrollController = ScrollController();
  Appointment appointment;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    // final Brightness brightness =
    //     WidgetsBinding.instance.window.platformBrightness;
    //inform listeners and rebuild widget tree
  }

  @override
  Widget build(BuildContext con) {
    // final size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zeta',
        home: Container(
            color: AppColors.light["backgroundAccent"],
            child: SafeArea(
                bottom: false,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Scaffold(
                    body: Container(
                        color: AppColors.light["background"],
                        child:
                            // Column(children: [
                            Stack(children: <Widget>[
                          // Stack(children: <Widget>[
                          ClipPath(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.light["backgroundAccent"]),
                                height: 210),
                            clipper: BottomWaveClipper(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                // IconButton(
                                //     icon: Icon(Icons.search, color: Colors.white),
                                //     onPressed: () {}),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(65, 20, 20, 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            widget.appointment.subjects[0]
                                                .toString(),
                                            // "Economie",
                                            // "Vandaag",
                                            style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                              // "${DateFormat('Hm').format(DateTime.fromMillisecondsSinceEpoch(widget.appointment.start * 1000))} - ${DateFormat('Hm').format(DateTime.fromMillisecondsSinceEpoch(widget.appointment.end * 1000))}",
                                              "08:00 - 08:50",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white))
                                        ]),
                                    Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          // widget.appointment.startTimeSlot
                                          //     .toString(),
                                          "1",
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white),
                                        ))
                                    // Icon(Icons.arrow_drop_down, color: Colors.white)
                                  ])),
                          Container(
                              margin: EdgeInsets.only(top: 60),
                              height: 280,
                              child: _buildCarousel(context)),
                          Container(
                              margin: EdgeInsets.only(top: 230),
                              padding: EdgeInsets.all(50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Text("Lokaal:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("A040",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                        ))
                                  ]),
                                  SizedBox(height: 10),
                                  Row(children: <Widget>[
                                    Text("Docent:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("A. Miedema",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                        ))
                                  ]),
                                  SizedBox(height: 10),
                                  Row(children: <Widget>[
                                    Text("Groep:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("H5.H5A",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                        ))
                                  ]),
                                  SizedBox(height: 10),
                                  Row(children: <Widget>[
                                    Text("Huiswerk:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Hoofdstuk 2 afmaken",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                        ))
                                  ]),
                                  // Divider()
                                ],
                              )),
                          // ])
                        ])),
                  );
                }))));
  }

  Widget _buildCarousel(BuildContext context) {
    final classes = [
      // widget.appointment.subjects[0].toString(),
      // widget.appointment.subjects[0].toString(),
      // widget.appointment.subjects[0].toString(),
      // widget.appointment.subjects[0].toString(),
      // widget.appointment.subjects[0].toString(),
      "Huiswerk",
      "Verslag"
          "Verslag"
          "Verslag"
          "Verslag"
    ];
    final tasks = [
      // widget.appointment.subjects[0].toString() + " huiswerk",
      // widget.appointment.subjects[0].toString() + " huiswerk",
      // widget.appointment.subjects[0].toString() + " huiswerk",
      // widget.appointment.subjects[0].toString() + " huiswerk",
      // widget.appointment.subjects[0].toString() + " huiswerk",
      "Hoofdstuk 2 afmaken",
      "Recessie"
          "Verslag"
          "Verslag"
          "Verslag"
    ];
    final dates = ["Vandaag", "Morgen", "Morgen", "Overmorgen", "Overmorgen"];
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex) {
        return HomeworkCard(
          title: classes[itemIndex],
          desc: tasks[itemIndex],
          date: dates[itemIndex],
          important: itemIndex == 0,
        );
      },
    );
  }
}
