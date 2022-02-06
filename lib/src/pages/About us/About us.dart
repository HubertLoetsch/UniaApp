import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/theme/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Stefan And Huber',
          textColor: Colors.white,
          backgroundColor: Colors.red,
          email: 'hubert.loetsch@hotmail.com',
          //textFont: 'Sail',
        ),
        backgroundColor: Color(0xff101010),
        body: ContactUs(
            cardColor: Colors.white,
            textColor: Color(0xff101010),
            email: 'hubert.loetsch@hotmail.com',
            companyName: 'Unia',
            companyColor: Colors.red,
            dividerThickness: 2,
            phoneNumber: '06642596821',
            website: '',
      ),

    ),

    );
  }
}

