import 'package:flutter/material.dart';
import 'package:udemy_project2/Utilities/categ_list.dart';

import '../minor_screen/subcategory_products.dart';
import '../widgets/categ_widgets.dart';


class BeautyCategory extends StatelessWidget {
  const BeautyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children:[
          Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width*0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(headerLabel: 'Beauty',),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*(0.68),
                    child: GridView.count(
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 15,
                      crossAxisCount: 2,children: List.generate(beauty.length, (index){
                      return SubCategModel(
                        mainCategName: 'beauty',
                        subCategName: beauty[index],
                        assetName: 'images/images/beauty/beauty$index.jpg',
                        subCategLabel: beauty[index],
                      );
                    }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
              right: 0,
              bottom: 0,
              child: SliderBar(mainCategoryName: 'beauty')
          ),
        ],
      ),
    );
  }
}




