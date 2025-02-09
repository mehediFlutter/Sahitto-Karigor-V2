import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/poet_card.dart';
import '../widgets/re_usable_mother_widget.dart';

class PoetListScreen extends StatefulWidget {
  const PoetListScreen({super.key});

  @override
  State<PoetListScreen> createState() => _PoetListScreenState();
}

class _PoetListScreenState extends State<PoetListScreen> {
  @override
  Widget build(BuildContext context) {
    return ReUsableMotherWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            SearchTextField(),
            SizedBox(height: 12),
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Poets').snapshots(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.active) {
                    print("Connection Active");
                    if (snapshots.hasData) {
                      
                      return Expanded(
                        child: GridView.builder(
                        itemCount: snapshots.data?.docs.length ?? 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            print(snapshots.data?.docs[index].data());
                            return PoetCard(
                              data: snapshots.data?.docs[index].data() ?? {},
                            );
                          },
                        ),
                      );
                    } else if (snapshots.hasError) {
                      print(snapshots.error);
                      return Center(
                        child: Text('Error: ${snapshots.error}'),
                      );
                    } else {
                      return Center(
                        child: Text("No Data Found"),
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        filled: true,
        fillColor: Colors.grey[400],
        hintText: 'খুঁজুন',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none),
      ),
    );
  }
}
