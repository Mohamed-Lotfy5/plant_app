import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'detailsScreenView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var control = Get.put(PlantsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.teal,
          child: Icon(
            Icons.document_scanner_outlined,
            size: 35,
            color: Colors.white,
          )),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.green[300],
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey[500],
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.transparent,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey[500],
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2,
                  color: Colors.grey[500],
                  size: 30,
                ),
                label: ""),
          ]),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Icon(Icons.notifications_rounded, color: Colors.white),
            ),
          )
        ],
        title: Column(
          children: [
            Text(
              "welcom",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "mohamed",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[400],
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    "Dhaka,Bangladish",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      suffixIcon: Icon(
                        Icons.menu_open_rounded,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      hintText: 'searsh here',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              Text(
                "category",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                          child: Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                          child: Text(
                        "indoor",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                          child: Text(
                        "cactus",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                          child: Text(
                        "outdoor",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => detailsScreen(data: control.model.data?[index]),
                            ));
                      },
                      child: Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    control.model.data?[index].image??"assets/unsplash_1GAMa5Ot7NA.png",
                                    height: 180,
                                  ),
                                  Text(control.model.data?[index].title??"Jade Plant"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(40)),
                                        child: Center(
                                            child: Text(
                                          "\$${control.model.data?[index].price}",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.teal[100]),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10,top: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.favorite,color: Colors.red,)),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
