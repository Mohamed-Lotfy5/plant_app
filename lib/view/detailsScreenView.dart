import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/controller.dart';
import '../model/model.dart';
import 'cartScreenView.dart';

class detailsScreen extends StatefulWidget {
  const detailsScreen({
    super.key,
    required this.data,
  });
  final Data? data;
  @override
  State<detailsScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<detailsScreen> {
  var control2 = Get.put(PlantsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        body: SafeArea(
          child:
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    )),
                          ),
                          Image.asset(
                widget.data!.image ?? "assets/unsplash_2cuzrhnuIeE.png",
                height: 400,
                          ),
                          Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data!.title ?? "String of pearl",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        "\$${widget.data!.price}",
                        style: TextStyle(
                            color: Colors.teal[500],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "⭐ 4.9",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "About plant",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.data!.description ?? "mmm",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            control2.addToCart(widget.data);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(),
                                ));
                          },
                          child: Container(
                            height: 50,
                            width: 230,
                            decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                                child: Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                          )
                        ]),
              ),
        ));
  }
}
