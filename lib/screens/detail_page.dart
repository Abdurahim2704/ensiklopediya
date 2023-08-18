import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/animal.dart';

class DetailPage extends StatelessWidget {
  final Animal animal;
  static const map = <String, String>{
    "Lion":"lion_desc",
    "Wolf":"wolf_desc",
    "Elephant":"elephant_desc",
    "Deer":"deer_desc",
  };
  const DetailPage({super.key, required this.animal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(animal.species.tr()),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(animal.imagePath),
            SizedBox(height: 20,),
            Information(infoKey: "Lifetime".tr(), infoValue: animal.lifetime),
            SizedBox(height: 40,),
            Information(infoKey: "Description".tr(), infoValue: map[animal.species]?.tr() ?? animal.information),
          ],
        ),
      ),
    );
  }
}


class Information extends StatelessWidget {
  final String infoKey;
  final String infoValue;
  const Information({super.key, required this.infoKey, required this.infoValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$infoKey:"),
          Expanded(child: Text(infoValue, textAlign: TextAlign.end,)),
        ],
      ),
    );
  }
}

