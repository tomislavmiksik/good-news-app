import 'package:flutter/material.dart';

class CategoryBadge extends StatefulWidget {
  final String selectedCategory;
  final String loadedCat;

  CategoryBadge(
    this.loadedCat,
    this.selectedCategory,
  );

  @override
  _CategoryBadgeState createState() =>
      _CategoryBadgeState(loadedCat, selectedCategory);
}

Map<String, Color> catColors = {
  'business': const Color(0x4F0076B5),
  'entertainment': const Color(0x63FCD600),
  'general': const Color(0x4F24B307),
  'health': const Color(0x59C40909),
  'science': const Color(0x6008DF97),
  'sports': const Color(0x57E98809),
  'technology': const Color(0x5700D9FF),
};

Map<String, Color> selectedCatColors = {
  'business': const Color(0x700076B5),
  'entertainment': const Color(0xFFFCD600),
  'general': const Color(0xFF23B307),
  'health': const Color(0xFFC40909),
  'science': const Color(0xFF08DF97),
  'sports': const Color(0xFFE98809),
  'technology': const Color(0xFF0026FF),
};

class _CategoryBadgeState extends State<CategoryBadge> {
  String selectedCat = '';

  var selectedColor = Colors.transparent;

  var categoriesMap = {
    'business': 'Business',
    'entertainment': 'Entertainment',
    'general': 'General',
    'health': 'Health',
    'science': 'Science',
    'sports': 'Sports',
    'technology': 'Technology',
  };

  String loadedCat;

  _CategoryBadgeState(this.loadedCat, this.selectedCat);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: selectedCat == loadedCat
              ? selectedCatColors[loadedCat]
              : catColors[loadedCat],
          border: Border.all(
            color: catColors[loadedCat] as Color,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        alignment: Alignment.center,
        width: 100,
        child: Text(
          categoriesMap[loadedCat].toString(),
          style: selectedCat == loadedCat
              ? const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              : const TextStyle(
                  color: Colors.white60,
                ),
        ),
      ),
    );
    /*  Container(
      width: 125,
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            
          });
         },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color?>(selectedColor),
        ),
        child: Text(

          categoriesMap[selectedCat].toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ); */
  }
}
