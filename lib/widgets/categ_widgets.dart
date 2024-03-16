import 'package:flutter/material.dart';
import 'package:udemy_project2/Utilities/categ_list.dart';

import '../minor_screen/subcategory_products.dart';

class SliderBar extends StatelessWidget {
  final String mainCategoryName;
  const SliderBar({
    super.key,
    required this.mainCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width*0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainCategoryName=='bags'? const Text('') :Text(
                  ' << ',
                  style: Style,
                ),
                Text(
                  mainCategoryName.toUpperCase(),
                  style: Style,
                ),
                mainCategoryName=='men'? const Text('') :Text(
                  ' >> ',
                  style: Style,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


const Style=TextStyle(
  color: Colors.brown,
  fontWeight: FontWeight.w600,
  letterSpacing: 10,
  fontSize: 16,
);

class SubCategModel extends StatelessWidget {

  final String mainCategName;
  final String subCategName;
  final String assetName;
  final String subCategLabel;


  const SubCategModel({
    super.key,
    required this.mainCategName,
    required this.subCategName,
    required this.assetName,
    required this.subCategLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=> SubCategProduct(subcategName:subCategName,maincategName: mainCategName,)));
      },

      child: Column(
          children:[
            SizedBox(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage(assetName),
              ),
            ),
            Text(subCategLabel),
          ]
      ),
    );
  }
}


class CategHeaderLabel extends StatelessWidget {

  final String headerLabel;

  const CategHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(30.0),
      child: Text(
        headerLabel,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5
        ),),
    );
  }
}