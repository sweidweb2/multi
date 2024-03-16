import 'package:flutter/material.dart';
import 'package:udemy_project2/Utilities/categ_list.dart';
import '../minor_screen/subcategory_products.dart';
import '../widgets/categ_widgets.dart';


class ElectronicsCategory extends StatelessWidget {
  const ElectronicsCategory({super.key});

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
                  const CategHeaderLabel(headerLabel: 'Electronics',),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*(0.68),
                    child: GridView.count(
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,children: List.generate(electronics.length, (index){
                      return SubCategModel(
                        mainCategName: 'electronics',
                        subCategName: electronics[index],
                        assetName: 'images/images/electronics/electronics$index.jpg',
                        subCategLabel: electronics[index],
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
              child: SliderBar(mainCategoryName: 'electronics')
          ),
        ],
      ),
    );
  }
}




