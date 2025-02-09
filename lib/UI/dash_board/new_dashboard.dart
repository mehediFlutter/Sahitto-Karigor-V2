import 'package:flutter/material.dart';
import 'package:sahitto_karigor/UI/controller/const/const.dart';

import '../widgets/poet_image_slider.dart';
import '../widgets/re_usable_mother_widget.dart';
import 'poet_list_screen.dart';

class NewDashboard extends StatefulWidget {
  const NewDashboard({super.key});

  @override
  State<NewDashboard> createState() => _NewDashboardState();
}

class _NewDashboardState extends State<NewDashboard> {
  @override
  Widget build(BuildContext context) {
    return ReUsableMotherWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            height15,
            PoetImageSlider(),
            height16,
            LiteraturePeriod(
              text: 'আদিম যুগ ',
              //(৬৫০ - ১২০০ খ্রি)
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PoetListScreen()));
              },
            ),
            LiteraturePeriod(
              text: 'মধ্যযুগ ',
              //(১২০১ - ১৮০০ খ্রি)
              onTap: () {},
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
                        color:  Colors.white,
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
