import 'package:flutter/material.dart';

class ReUsableMotherWidget extends StatelessWidget {
  final Widget child;
  final bool isAppBarNeeded;
  final String title;
  const ReUsableMotherWidget(
      {super.key, required this.child, this.isAppBarNeeded = true,  this.title=''});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isAppBarNeeded
            ? AppBar(
              elevation: 10,
                title: Text(title,style: TextStyle(fontWeight: FontWeight.w600),),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF008000),
                        Color(0xFFe9ffe4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              )
            : null,
        backgroundColor: Color(0xFFe9ffe4),
        body: child,
      ),
    );
  }
}
