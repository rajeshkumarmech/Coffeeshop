import 'package:coffeestall/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'coffeenames.dart';
import 'coffeetail.dart';
import 'customerfeedback.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final List coffeename = [
    ['Cold Coffee', true],
    [' ', false],
    [' Bella Coffee', false],
    [' Sukku Coffee', false],
    [' Tandoori Coffee', false]
  ];

  void selectcoffeeename(int index) {
    setState(() {
      for (int i = 0; i < coffeename.length; i++) {
        coffeename[i][1] = false;
      }
      coffeename[index][1] = true;
    });
  }

  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Tea And Coffee Shop"),
        leading: Icon(Icons.person),
        actions: [
          Icon(Icons.notifications),
          IconButton(
              onPressed: () async {
                await logout();
                Get.back(result: () => homepage());
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Text(
            "Coffee is a beverage prepared from roasted coffee beans. Darkly colored, bitter, and slightly acidic. It has the highest sales in the world market for hot drinks",
            style: TextStyle(
                color: Colors.lightGreenAccent,
                fontSize: 15,
                textBaseline: TextBaseline.ideographic,
                letterSpacing: 1.5),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              decoration: InputDecoration(
                  iconColor: Colors.brown,
                  hintText: "Coffee",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeename.length,
              itemBuilder: (context, index) {
                return coffeenames(
                    coffeevariety: coffeename[index][0],
                    isselected: coffeename[index][1],
                    tap: () {
                      selectcoffeeename(index);
                    });
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                coffeetail(
                  images:
                      "https://image.shutterstock.com/image-photo/cup-coffee-latte-heart-shape-260nw-1568190193.jpg",
                  types: ' Cold Coffee',
                  description:
                      "Icy cold coffee is simply the best beverage to enjoy on a hot summer day. Even though I tend to be more of a tea drinker, I do love a good cup of coffee occasionally  ",
                  price: "79.00",
                ),
                coffeetail(
                  images:
                      "https://img.freepik.com/premium-photo/hot-coffee-morning-wooden-table_838382-54.jpg",
                  types: ' Bella Coffee',
                  description:
                      "Coorgs authentic Bella Kaapi is a personal favourite. This coffee is perfect for those who enjoy black coffee. This simple brew is prepared by boiling ground roasted coffee in water. ",
                  price: "46.00",
                ),
                coffeetail(
                  images: "",
                  types: 'Sukku Coffee ',
                  description:
                      "Sukku means dried ginger in Tamil. Ginger is the key ingredient for this beverage that both healthy and energising. This herbal coffee is widely enjoyed in Tamil Nadu. ",
                  price: "70.00",
                ),
                coffeetail(
                  images: "",
                  types: ' Tandoori  Coffee',
                  description:
                      "You might have heard of Tandoori Chai. Sip on piping hot coffee served in kulhads or clay pots, roasted in a pre-heated tandoor in Meadow Mastii ",
                  price: "50.00",
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(customerfeedback());
                  },
                  child: Text("Customer Feed Back")),
            ],
          ),
        ],
      ),
    );
  }
}
