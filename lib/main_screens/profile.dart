import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_project2/customer_screens/customer_orders.dart';
import 'package:udemy_project2/customer_screens/customer_wishlist.dart';
import 'package:udemy_project2/main_screens/cart.dart';
import 'package:udemy_project2/widgets/appbar_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellow,Colors.brown]
                )
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                centerTitle: true,
                expandedHeight: 140,
                flexibleSpace: LayoutBuilder(
                  builder: (context,constraints){
                    return FlexibleSpaceBar(
                        title: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: constraints.biggest.height<=120?1:0,
                        child:const Text(
                            'Account',
                            style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                      background: Container(
                        decoration:const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.yellow,Colors.brown]
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25,left: 30),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('images/images/inapp/guest.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                    'Guest'.toUpperCase(),
                                    style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width*0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration:const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )
                            ),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                  MaterialPageRoute(
                                      builder: (context)=>const CartScreen(back: AppBarBackButton(),)
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width*0.2,
                                child: const Center(
                                  child: Text(
                                        'Cart',
                                        style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const CustomerOrders()
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width*0.2,
                                child: const Center(
                                  child: Text(
                                    'Orders',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration:const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                )
                            ),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const Wishlist()
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width*0.2,
                                child: const Center(
                                  child: Text(
                                    'WishList',
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        children:[
                          const SizedBox(
                          height: 150,
                          child: Image(
                              image: AssetImage('images/images/inapp/logo.jpg')
                          ),
                        ),
                      ProfileHeaderLabel(headerLabel: '  Account Info  '),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child:const Column(
                            children: [
                              RepeatedListTile(
                                title: 'Email Adress',
                                subtitle: 'asweid657@gmail.com',
                                icon: Icons.email,
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Phone NO.',
                                subtitle: '+111111',
                                icon: Icons.phone,
                              ),
                              YellowDivider(),
                              const RepeatedListTile(
                                title: 'Address',
                                subtitle: 'example: 140 st - New Garcey',
                                icon: Icons.location_pin,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ProfileHeaderLabel(headerLabel: '  Account Settings  '),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                title: 'Edit Profile',
                                subtitle: '',
                                icon: Icons.edit,
                                onPressed: (){},
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Change Password',
                                icon: Icons.lock,
                                onPressed: (){},
                              ),
                              const YellowDivider(),
                              RepeatedListTile(
                                title: 'Log Out',
                                icon: Icons.logout,
                                onPressed: (){
                                  Navigator.pushReplacementNamed(context, '/welcome_screen');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                                        ],
                                      ),
                    ),],),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? onPressed;

  const RepeatedListTile({
    super.key,
    required this.title,
    this.subtitle='',
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          title,
        ),
        subtitle: Text(
          subtitle,
        ),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {

  final String headerLabel;

  const ProfileHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            headerLabel,
            style:const TextStyle(
              fontSize: 24,
              color: Colors.grey,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
