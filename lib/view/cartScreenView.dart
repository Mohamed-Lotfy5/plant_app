import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  var control3 = Get.put(PlantsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<PlantsController>(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.green[400],
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                      children: List.generate(
                    control3.CartList?.length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.teal[600]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(control3.CartList?[index]?.image ??
                                  "assets/unsplash_1GAMa5Ot7NA.png"),
                              Text(
                                control3.CartList?[index]?.title ??
                                    "String of pearl",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  control3.icreament(control3.CartList?[index]);
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.teal[100],
                                    child:
                                        Icon(Icons.add, color: Colors.white)),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.teal[100],
                                child: Text(
                                  control3.CartList?[index]?.quantity.toString()??
                                  "1",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  control3.decreament(control3.CartList?[index]);
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.teal[100],
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              );
            }),
          )
        ],
      )),
    );
  }
}
