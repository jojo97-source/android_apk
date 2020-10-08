
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Developer'),
      ),
            body: Column(
                children: <Widget> [
                  Image.asset('assets/profile_Copy.png',
                   height:270.0,
                   width:580.0,
                  ),

                          Text(''),
                          Text  ('Leeza-Jo Mckay',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                              )
                          ),
                  Text(''),
                  Text(' During the past four (4) years I have been studying Principles of Programming II, Field Group Project, Operating System, Fundamentals of Security Technology, Internet Authoring, Database Systems, System Analysis and Design, and Principles of Management.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15
                    )
                  ),
                  Text(''),
                   Text(' I have also have the opportunities to volunteer and work as a database manager assistant and as a data entry manager and through these experiences I have had first-hand experience with working  on a team and learn how to developing my career in the field of data analysis. I am proficient in Microsoft office, MYSQL, C++, PHP, HTML, CSS and JAVA. I am continually learning new languages.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15
                      )
                  ),
                  Text(''),
                  Text( ' I am detail-oriented, organized, and precise in my work; I have strong communication skills which includes foreign language such as French and Korean, and because of my volunteering activities, I have a background in working with those from diverse cultures. I’m comfortable with working in teams. ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15
                      )
                  ),
                  ],
            ),


            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children:  <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    ),
                    child: Text(
                      'My Shopping List Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("My Shopping List"),
                    onTap: () => navigateToPage(context, 'home'),
                  ),
                ],
              ),
            ),
            );
        }
      }



navigateToPage(BuildContext context, String page) {
  Navigator.of(context).pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
}
