
import 'package:doctorapplicationfinal/screens/colorScheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DocInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: docInfoPage(),
    );
  }
}
class docInfoPage extends StatefulWidget {
  @override
  _docInfoPageState createState() => _docInfoPageState();
}

class _docInfoPageState extends State<docInfoPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  final NameEditingController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  final firstDate= DateTime(2010,1);
  final lastDate=DateTime(2023,12);



  Widget build(BuildContext context) {
    final firstname = TextFormField(
      autofocus: false,
      controller: NameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{4,}$');
        if(value!.isEmpty){
          return ("Firstname cannot be empty");
        }

        if(!regex.hasMatch(value))
        {
          return("Please enter a valid name (minimum 3 characters required)");
        }
        return null;
      },
      onSaved: (value)
      {
        NameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Patients Name",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [getStartedColorStart, getStartedColorEnd],
              begin: Alignment(0, -1.15),
              end: Alignment(0,0.1),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/docinfo/bg1.png'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: bgColor,
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/docprofile/doc1.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Dr. Untitled", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),),
                              Text(" CK Hospital", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("About the Doctor", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),
                            SizedBox(height: 10,),
                            Text("Please write the description of the doctor here. This will be a detailed information about the doctor and the roles and achievements that the doctor has had over the past years", style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                            SizedBox(height: 10,),
                            Text("Available Slots", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),

                            //Doctor timing
                            SizedBox(height: 20,),
                            Text("Please fill the below details of patient:", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),
                            SizedBox(height: 20,),
                            firstname,
                            SizedBox(height: 20,),
                            firstname,
                            SizedBox(height: 20,),
                            firstname,
                            SizedBox(height: 20,),
                            firstname,
                            SizedBox(height: 20,),
                            Text("Select date", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),

                            Container(
                              height: 200,


                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.dateAndTime,
                                initialDateTime: selectedDate,
                                minimumDate: firstDate,
                                maximumDate: lastDate,
                                onDateTimeChanged: (newDate){
                                  setState(() {
                                    selectedDate = newDate;
                                  });
                                },
                              ),

                            ),
                            Text("Select Time", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),



                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 54,
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xff107163),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x17000000),
                                    offset: Offset(0, 15),
                                    blurRadius: 15,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),

                              child: GestureDetector(
                                onTap: (){
                                  Fluttertoast.showToast(msg: "Appointment created successfully");
                                },
                                child: Text(
                                  'Make An Appointment',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  Container timeSlotWidget(String date, String month, String slotType, String time)
  {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: docContentBgColor
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: dateBgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("$date", style: TextStyle(
                      color: dateColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                  ),),
                  Text("$month", style: TextStyle(
                      color: dateColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                  ),)
                ],
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("$slotType", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),),
                Text("$time", style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget demoDates(String day, String date, bool isSelected) {
  return isSelected ? Container(
    width: 70,
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      color: Color(0xff107163),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Container(
            child: Text(
              day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),

          ),
          onTap: () {
            ;
          },
        ),
        
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(7),
          child: Text(
            date,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    ),
  ) : Container(
    width: 70,
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      color: Color(0xffEEEEEE),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(7),
          child: Text(
            date,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    ),
  );
}

Widget doctorTimingsData(String time, bool isSelected) {
  return isSelected ? Container(
    margin: EdgeInsets.only(left: 20, top: 10),
    decoration: BoxDecoration(
      color: Color(0xff107163),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 2),
          child: Icon(
            Icons.access_time,
            color: Colors.white,
            size: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 2),
          child: Text('08:30 AM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    ),
  ) : Container(
    margin: EdgeInsets.only(left: 20, top: 10),
    decoration: BoxDecoration(
      color: Color(0xffEEEEEE),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 2),
          child: Icon(
            Icons.access_time,
            color: Colors.black,
            size: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 2),
          child: Text('08:30 AM',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    ),
  );
}

