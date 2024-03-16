import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../minor_screen/search.dart';
import '../widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: FakeSearch(),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 8,
            tabs: [
              RepeatedTab(label: 'men',),
              RepeatedTab(label: 'women',),
              RepeatedTab(label: 'shoes',),
              RepeatedTab(label: 'electronics',),
              RepeatedTab(label: 'accessories',),
              RepeatedTab(label: 'home & garden',),
              RepeatedTab(label: 'beauty',),
              RepeatedTab(label: 'kids',),
              RepeatedTab(label: 'bags',),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('men screen'),),
            Center(child: Text('women screen'),),
            Center(child: Text('shoes screen'),),
            Center(child: Text('electronics screen'),),
            Center(child: Text('accessories screen'),),
            Center(child: Text('home & garden screen'),),
            Center(child: Text('beauty screen'),),
            Center(child: Text('kids screen'),),
            Center(child: Text('bags screen'),),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;

  const RepeatedTab({
    super.key, required this.label,
  });

  @override
  Widget build(BuildContext context) {

    return Tab(child: Text(
      label,
      style: TextStyle(
          color: Colors.grey.shade600,),),);
  }
}
