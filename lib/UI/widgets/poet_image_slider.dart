import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controller/const/const.dart';

class PoetImageSlider extends StatefulWidget {
  const PoetImageSlider({super.key});

  @override
  State<PoetImageSlider> createState() => _PoetImageSliderState();
}

class _PoetImageSliderState extends State<PoetImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Poets').snapshots(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
        }

        if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
          return Text(
              'No data available'); // Handle the case where there is no data
        }

        final documents = snapshots.data!.docs;

        return Column(
          children: [
            height12,
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (int page, _) {
                  _selectedSlider.value = page;
                },
              ),
              items: documents.map((doc) {
            
                final imageUrl = doc[
                    'image']; 

                final poetName = doc['name_bangla'];
                final lifePeriod = doc['lifePeriod'];
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    poetName,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600,height: 0),
                                  ),
                                  Text(
                                    "($lifePeriod)",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            height16,
            ValueListenableBuilder(
              valueListenable: _selectedSlider,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    documents.length,
                    (i) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: value == i ? Colors.green : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
