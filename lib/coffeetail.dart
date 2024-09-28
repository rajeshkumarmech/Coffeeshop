import 'package:flutter/material.dart';
import 'package:get/get.dart';

class coffeetail extends StatefulWidget {
  final String images;
  final String types;
  final String description;
  final String price;

  coffeetail({
    required this.images,
    required this.types,
    required this.description,
    required this.price,
  });

  @override
  State<coffeetail> createState() => _coffeetailState();
}

class _coffeetailState extends State<coffeetail> {
  int _counter = 0;

  void Addorder() {
    setState(() {
      _counter++;
    });
  }

  void Reducecount() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.brown[800]),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      "https://image.shutterstock.com/image-photo/cup-coffee-latte-heart-shape-260nw-1568190193.jpg")),
              Text(
                widget.types,
                style: TextStyle(fontSize: 20, backgroundColor: Colors.cyan),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.description,
                style: TextStyle(
                    fontSize: 14,
                    backgroundColor: Colors.transparent,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '\$' + widget.price,
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: Addorder,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(Icons.add),
                    ),
                  ),
                  Text(
                    "$_counter",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: Reducecount,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Welcome to My Coffee Shop Next Time",
                          middleText: "Your Order is Conformed.... "
                              "Delivering  with in 15 minutes. "
                              "To update your feed back also  ",
                          backgroundColor: Colors.teal,
                          titleStyle: TextStyle(color: Colors.white),
                          middleTextStyle: TextStyle(color: Colors.white),
                          radius: 30,
                        );
                      },
                      child: Text("Order Now")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
