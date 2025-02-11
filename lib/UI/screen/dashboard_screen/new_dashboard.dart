import 'package:flutter/material.dart';
import 'package:sahitto_karigor/UI/controller/const/const.dart';

import '../../widgets/poet_image_slider.dart';
import '../../widgets/re_usable_mother_widget.dart';
import '../poet_list_screen/medieval_period/medieval_poet_list_screen.dart';

class NewDashboard extends StatefulWidget {
  const NewDashboard({super.key});

  @override
  State<NewDashboard> createState() => _NewDashboardState();
}

class _NewDashboardState extends State<NewDashboard> {
  @override
  Widget build(BuildContext context) {
    return ReUsableMotherWidget(
      isAppBarNeeded: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            height15,
            Text(
              "বাংলা সাহিত্য কারিগর",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(
               width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('"আমার আপনার চেয়ে আপন যে জন',style: TextStyle(  fontStyle: FontStyle.italic,height: 0),),
                  Text('খুঁজি তারে আমি আপনায়।"',style: TextStyle(  fontStyle: FontStyle.italic,height: 0),),
                  Text('--- কাজী নজরুল ইসলাম',style: TextStyle(  fontStyle: FontStyle.italic,height: 0),),
                ],
              ),
            ),
            PoetImageSlider(),
            height16,
            LiteraturePeriod(
              text: 'আদিম যুগ ',
              //(৬৫০ - ১২০০ খ্রি)
                onTap: () {},
            ),
            LiteraturePeriod(
              text: 'মধ্যযুগ ',
               onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedievalPoetScreen()));
              },
              //(১২০১ - ১৮০০ খ্রি)
           
            ),
          ],
        ),
      ),
    );
  }
}

class LiteraturePeriod extends StatelessWidget {
  final Function() onTap;
  final String text;
  const LiteraturePeriod({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF008000),
                  Color.fromARGB(255, 0, 192, 0),
                  Color(0xFFe9ffe4),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 0),
                  ),
                  Text(
                    "(৬৫০ - ১২০০ খ্রি)",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
