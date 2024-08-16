import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget
{
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var isS=true;
  var isM=false;
  var isL=false;
  var isXL=false;

  var isRed=true;
  var isIndigo=false;
  var isTeal=false;
  var isBrown=false;

  var imgList=[
    "https://i.mdel.net/i/db/2017/7/728816/728816-800w.jpg",
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
    "https://www.shutterstock.com/image-photo/stylish-man-wearing-sunglasses-white-260nw-1562565541.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDY828-ftxjCNjjY9II8r2LCDdBTCsF3ntp2aVGZPViVLx6zPOl-A9DObcI89oVDyiG7s&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRORIqjGDpr-_rGWoFSWCK4AAgbfeyASupPA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI0K8WemfmhTsQOVq8jJnnWCTMNoH5G6LYvA&usqp=CAU",
    "https://st.depositphotos.com/1003840/1806/i/450/depositphotos_18067151-stock-photo-young-woman-in-casual-clothes.jpg"
  ];

  var carousalController=new CarouselController();
  var currentSlide=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                      child: Icon(Icons.arrow_back_ios_rounded, color: Colors.grey.shade700,size: 15)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                  child: Icon(Icons.notifications_rounded,color: Colors.grey.shade700),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Text("Product Details",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.03,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center
                  ),
                  Text("Brown Vest",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*0.02,
                          color: Colors.orange.shade900,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
                child:Column(
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        carouselController: carousalController,
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enlargeFactor: 10,
                            autoPlay: true,
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayCurve: Easing.linear,
                            pauseAutoPlayInFiniteScroll: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentSlide=index;
                              });
                            },
                        ),
                        items: imgList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                child: ClipRRect(
                                    child: Image.network(i,
                                        fit: BoxFit.fill,
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height*0.35,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => carousalController.animateToPage(entry.key),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.015,
                            height: MediaQuery.of(context).size.height*0.015,
                            margin: EdgeInsets.symmetric(horizontal: 1,vertical: 2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber.withOpacity(currentSlide == entry.key ? 0.9 : 0.4))
                          ),
                        );
                      }).toList(),
                    )
                  ]
                ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            ),
          ),
          Expanded(
            child: Container(
              child: Text("Details",
                 style: TextStyle(
                   fontSize: MediaQuery.of(context).size.height*0.02,
                   color: Colors.grey.shade700,
                   fontWeight: FontWeight.bold
                 ),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(20,10,20,10),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text("A blazer can be as formal or as casual as the person wearing it chooses: most classically, with proper grey trousers and a club tie; it's pretty much impossible for the blazer to be worn incorrectly.",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.015,
                    color: Colors.grey.shade500,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(20,0,20,20),
            ),
          ),
          Expanded(
            child: Container(
              child: Text("Select Size",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.02,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold
                ),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(20,0,20,0),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isS=true;
                          isM=false;
                          isL=false;
                          isXL=false;
                        });
                      },
                      child: Center(
                        child: Text("S",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: MediaQuery.of(context).size.height*0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: isS?Colors.grey.shade700:Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.fromLTRB(40, 0, 20, 10),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isS=false;
                          isM=true;
                          isL=false;
                          isXL=false;
                        });
                      },
                      child: Center(
                        child: Text("M",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: MediaQuery.of(context).size.height*0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: isM?Colors.grey.shade700:Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isS=false;
                          isM=false;
                          isL=true;
                          isXL=false;
                        });
                      },
                      child: Center(
                        child: Text("L",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: MediaQuery.of(context).size.height*0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: isL?Colors.grey.shade700:Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isS=false;
                          isM=false;
                          isL=false;
                          isXL=true;
                        });
                      },
                      child: Center(
                        child: Text("XL",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: MediaQuery.of(context).size.height*0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: isXL?Colors.grey.shade700:Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text("Select Color",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.02,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold
                ),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(20,10,20,10),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isRed=true;
                        isIndigo=false;
                        isTeal=false;
                        isBrown=false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.circle,size: 10,color: Colors.orange.shade900,),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: isRed?Colors.orange.shade900:Colors.white,
                          width: 2)
                  ),
                  margin: EdgeInsets.fromLTRB(30,0,10,10),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isRed=false;
                        isIndigo=true;
                        isTeal=false;
                        isBrown=false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.circle,size: 10,color: Colors.indigo,),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: isIndigo?Colors.indigo:Colors.white,
                          width: 2)
                  ),
                  margin: EdgeInsets.fromLTRB(0,0,10,10),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isRed=false;
                        isIndigo=false;
                        isTeal=true;
                        isBrown=false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.circle,size: 10,color: Colors.teal,),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: isTeal?Colors.teal:Colors.white,
                          width: 2)
                  ),
                  margin: EdgeInsets.fromLTRB(0,0,10,10),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isRed=false;
                        isIndigo=false;
                        isTeal=false;
                        isBrown=true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.circle,size: 10,color: Colors.brown.shade400,),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: isBrown?Colors.brown.shade400:Colors.white,
                          width: 2)
                  ),
                  margin: EdgeInsets.fromLTRB(0,0,10,10),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Expanded(
            flex: 2,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text("ADD TO BAG",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.height*0.02
                    ),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(20,20,20,20),
              ),
            ),
          )
        ],
      ),
    );
  }
}