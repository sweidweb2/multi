import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:udemy_project2/Utilities/categ_list.dart';
import 'package:udemy_project2/categories/accessories_category.dart';
import 'package:udemy_project2/categories/bags_category.dart';
import 'package:udemy_project2/categories/beauty_category.dart';
import 'package:udemy_project2/categories/kids_category.dart';
import 'package:udemy_project2/categories/men_category.dart';
import 'package:udemy_project2/categories/women_category.dart';
import 'package:udemy_project2/widgets/fake_search.dart';

import '../categories/electronics_category.dart';
import '../categories/homeandgarden_category.dart';
import '../categories/shoes_category.dart';

List<ItemData> items=[
  ItemData(label: 'men'),
  ItemData(label: 'women'),
  ItemData(label: 'shoes'),
  ItemData(label: 'electronics'),
  ItemData(label: 'accessories'),
  ItemData(label: 'home & garden'),
  ItemData(label: 'beauty'),
  ItemData(label: 'kids'),
  ItemData(label: 'bags'),
];


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final PageController _pageController=PageController();

  @override
  void initState() {
    for (var item in items){
      item.isSelected=false;
    }

    setState(() {
      items[0].isSelected=true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: SideNavigator(size),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CategoryView(size),
          ),
        ],
      ),
    );
  }

  Widget SideNavigator(Size size){
    return SizedBox(
              width: size.width * 0.2,
              height:size.height * 0.8 ,
              child: ListView.builder(
                itemCount:items.length ,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      _pageController.animateToPage(index,duration: Duration(milliseconds: 300),curve: Curves.bounceIn);
                      // for (var item in items){
                      //   item.isSelected=false;
                      // }
                      //
                      // setState(() {
                      //   items[index].isSelected=true;
                      // });
                    },
                    child: Container(
                      color:items[index].isSelected==true? Colors.white : Colors.grey.shade300,
                      height: 100,//size.height*0.8/items.length
                      child: Center(
                          child: Text(items[index].label)
                      ),
                    ),
                  );
                }
              ),
            );
  }

  Widget CategoryView(Size size){
    return Container(
            width: size.width * 0.8,
            height:size.height * 0.8 ,
            color: Colors.white,
            child: PageView(
              onPageChanged: (value){
                for (var item in items){
                  item.isSelected=false;
                }

                setState(() {
                  items[value].isSelected=true;
                });
              },
              controller: _pageController,
              scrollDirection: Axis.vertical,
              children: const [
                MenCategory(),
                WomenCategory(),
                ShoesCategory(),
                ElectronicsCategory(),
                AccessoriesCategory(),
                HomegardenCategory(),
                BeautyCategory(),
                KidsCategory(),
                BagsCategory(),
              ],
            ),
          );
  }
}

class ItemData{
  String label;
  bool isSelected;

  ItemData({required this.label,this.isSelected=false});

}
























