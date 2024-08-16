import 'package:flutter/material.dart';
import 'package:screen/DetailPage.dart';
import 'package:screen/ProfilePage.dart';

class HorList {
  String imgUrl = "";
  String name = "";
  String price = "";

  HorList(String imgUrl, String name, String price) {
    this.imgUrl = imgUrl;
    this.name=name;
    this.price=price;
  }
}

class VerList {
  String imgUrl = "";
  String name = "";
  bool isLiked=false;

  VerList(String imgUrl, String name) {
    this.imgUrl = imgUrl;
    this.name=name;
  }
}

class ListPage extends StatefulWidget
{
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var name=new TextEditingController();
  var isAllActivate=true;
  var isPantsActivate=false;
  var isBlazersActivate=false;
  var isJacketsActivate=false;
  var selectedIndex=0;
  
  List<HorList> l1=[
    HorList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI0K8WemfmhTsQOVq8jJnnWCTMNoH5G6LYvA&usqp=CAU", "Cropped t-shirt", "\$150.0"),
    HorList("https://www.shutterstock.com/image-photo/stylish-man-wearing-sunglasses-white-260nw-1562565541.jpg", "Brown Vest", "\$126.0"),
    HorList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDY828-ftxjCNjjY9II8r2LCDdBTCsF3ntp2aVGZPViVLx6zPOl-A9DObcI89oVDyiG7s&usqp=CAU", "Black Blazer", "\$120.0"),
    HorList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRORIqjGDpr-_rGWoFSWCK4AAgbfeyASupPA&usqp=CAU", "Cropped t-shirt", "\$150.0"),
    HorList("https://www.nextdirect.com/nxtcms/resource/blob/5821518/d114a8023263017f86b11c206949508e/shackets-data.jpg", "Brown Vest", "\$126.0"),
    HorList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7iPisjeQDmDZOHy1_i9-xfID9ysXay1Hstx6kgtnvpXFJPz276yjImJg-Zqch7RQaAI0&usqp=CAU", "Black Blazer", "\$120.0")
  ];

  List<VerList> l2=[
    VerList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRORIqjGDpr-_rGWoFSWCK4AAgbfeyASupPA&usqp=CAU", "Cropped t-shirt"),
    VerList("https://www.nextdirect.com/nxtcms/resource/blob/5821518/d114a8023263017f86b11c206949508e/shackets-data.jpg", "Brown Vest"),
    VerList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7iPisjeQDmDZOHy1_i9-xfID9ysXay1Hstx6kgtnvpXFJPz276yjImJg-Zqch7RQaAI0&usqp=CAU", "Black Blazer"),
    VerList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI0K8WemfmhTsQOVq8jJnnWCTMNoH5G6LYvA&usqp=CAU", "Cropped t-shirt"),
    VerList("https://www.shutterstock.com/image-photo/stylish-man-wearing-sunglasses-white-260nw-1562565541.jpg", "Brown Vest"),
    VerList("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDY828-ftxjCNjjY9II8r2LCDdBTCsF3ntp2aVGZPViVLx6zPOl-A9DObcI89oVDyiG7s&usqp=CAU", "Black Blazer"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,5,20,5),
                    child: Icon(Icons.menu_open_rounded,color: Colors.grey.shade700,),
                  ),
                  Expanded(
                      flex: 5,
                      child: Text("Shop",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                            fontSize: MediaQuery.of(context).size.height*0.04
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.notifications_rounded,color: Colors.grey.shade700,),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: "Search Your Dress",
                            hintStyle: TextStyle(fontSize: 15,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.grey.shade500)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.grey.shade700)
                            ),
                            prefixIcon: Icon(Icons.search,color: Colors.grey.shade700),
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0)
                        ),
                        cursorColor: Colors.grey.shade700,
                      ),
                      height: 30,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    ),
                  ),
                  Icon(Icons.graphic_eq_rounded,color: Colors.grey.shade700,),
                  SizedBox(width: 15,)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isAllActivate=true;
                          isPantsActivate=false;
                          isBlazersActivate=false;
                          isJacketsActivate=false;
                        });
                      },
                      child: Container(
                        child: Text("All",
                          style: TextStyle(
                            color: isAllActivate?Colors.white:Colors.grey.shade700,
                            height: 2,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        decoration: BoxDecoration(color: isAllActivate?Colors.black87:Colors.white,borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isAllActivate=false;
                          isPantsActivate=true;
                          isBlazersActivate=false;
                          isJacketsActivate=false;
                        });
                      },
                      child: Container(
                        child: Text("Pants",
                          style: TextStyle(
                            color: isPantsActivate?Colors.white:Colors.grey.shade700,
                            height: 2,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(color: isPantsActivate?Colors.black87:Colors.white,borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isAllActivate=false;
                          isPantsActivate=false;
                          isBlazersActivate=true;
                          isJacketsActivate=false;
                        });
                      },
                      child: Container(
                        child: Text("Blazers",
                          style: TextStyle(
                            color: isBlazersActivate?Colors.white:Colors.grey.shade700,
                            height: 2,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(color: isBlazersActivate?Colors.black87:Colors.white,borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isAllActivate=false;
                          isPantsActivate=false;
                          isBlazersActivate=false;
                          isJacketsActivate=true;
                        });
                      },
                      child: Container(
                        child: Text("Jackets",
                          style: TextStyle(
                            color: isJacketsActivate?Colors.white:Colors.grey.shade700,
                            height: 2,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        decoration: BoxDecoration(color: isJacketsActivate?Colors.black87:Colors.white,borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
                flex: 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: l1.length,
                  itemBuilder: (context, index) {
                    return Container(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        child: Image.network(
                                          l1[index].imgUrl,
                                          fit: BoxFit.fill,
                                          height: MediaQuery.of(context).size.height*0.2,
                                          width: MediaQuery.of(context).size.width*0.3,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      Container(
                                        child: Text(l1[index].name,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.brown.shade700,
                                              fontWeight: FontWeight.bold
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        width: MediaQuery.of(context).size.width*0.3,
                                      ),
                                      Container(
                                          child: Text(l1[index].price,
                                            style: TextStyle(
                                              color: Colors.orange.shade900,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        width: MediaQuery.of(context).size.width*0.3,
                                      ),
                                    ]
                                  ),
                        margin: (index==l1.length-1)?EdgeInsets.fromLTRB(20, 0, 20, 20):EdgeInsets.fromLTRB(20, 0, 0, 20),
                    );
                  },
                )
            ),
            Expanded(
              child: Container(
                child: Text("Recommended for you",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(20, 0, 10, 10),
              ),
            ),
            Expanded(
                flex: 5,
                child: ListView.builder(
                    itemCount: l2.length,
                    itemBuilder: (context, index) {
                      return Container(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          child: Image.network(l2[index].imgUrl,
                                            fit: BoxFit.fill,
                                            height: MediaQuery.of(context).size.height*0.07,
                                            width: MediaQuery.of(context).size.width*0.15,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  child: Container(
                                                    child: Text(l2[index].name,
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height*0.018,
                                                          color: Colors.orange.shade700,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    width: MediaQuery.of(context).size.width*0.58,
                                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      l2[index].isLiked=!l2[index].isLiked;
                                                    });
                                                  },
                                                  child: Container(
                                                    child: Icon(
                                                      l2[index].isLiked?Icons.favorite_outlined:Icons.favorite_border_outlined,
                                                      color: Colors.orange.shade700,
                                                      size: 15,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              child: Text("Casual clothing guide for formals.Ultimate Guide for FASHION",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.height*0.018,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                              width: MediaQuery.of(context).size.width*0.65,
                                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                  );
                    },
                )
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined,), label: "",tooltip: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined,), label: "",tooltip: "Details"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border,), label: "",tooltip: "Liked"),
              BottomNavigationBarItem(icon: Icon(Icons.perm_identity,), label: "",tooltip: "Profile"),
            ],
            showSelectedLabels: false,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber.shade800,
            unselectedItemColor: Colors.grey.shade700,
            selectedIconTheme: IconThemeData(size: 35,),
            onTap: (value) {
              setState(() {
                selectedIndex=value;

                if (selectedIndex==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(),));
                }

                if (selectedIndex==3){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                }
              });
            },
        ),
      ),
    );
  }
}