import 'package:flutter/material.dart';
import 'package:misdeptapp/views/pages/about/aboutus.dart';
import 'package:misdeptapp/views/pages/about/genesis.dart';
import 'package:misdeptapp/views/pages/about/visionnmission.dart';

class Aboutsection extends StatelessWidget {
  final Map<String, GlobalKey>? sectionKeys;

  const Aboutsection({super.key, this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          key: sectionKeys?['About Us'], // 🔑
        
          child: AboutusPage (),
        ),
        Container(
          key: sectionKeys?['Vision & Mission'],
         
          child: const VisionPage(),
        ),
        Container(
          key: sectionKeys?['Genesis & Evolution'],
         
          child: const GenesisPage(),
        ),
       
      ],
    );
  }
}
