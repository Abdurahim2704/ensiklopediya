import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../data/information.dart';
import '../models/animal.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ensiklopediya"),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: context.setLocale,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            itemBuilder: (context) {
              return const [
                PopupMenuItem(value: Locale('uz', 'UZ'), child: Text("🇺🇿 UZ"),),
                PopupMenuItem(value: Locale('ru', 'RU'), child: Text("🇷🇺 RU")),
                PopupMenuItem(value: Locale('en', 'US'), child: Text("🇺🇸 EN")),
              ];
            },
            icon: const Icon(Icons.language_rounded),
          ),
        ],
      ),
      body: GridView.count(crossAxisCount: 2, children: [
        for (Animal animal in information)
          GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(animal: animal)));},child: Column(children: [
            SizedBox(height: 160, width: 160,child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(20)),child: Image.asset(animal.imagePath, fit: BoxFit.fitHeight,))),
            Text(animal.species.tr()),
          ],))
      ],),
    );
  }
}
