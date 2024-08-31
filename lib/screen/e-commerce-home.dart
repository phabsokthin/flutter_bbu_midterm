import 'package:flutter/material.dart';

class MyEcommerce extends StatefulWidget {
  const MyEcommerce({super.key});

  @override
  State<MyEcommerce> createState() => _MyEcommerceState();
}

class _MyEcommerceState extends State<MyEcommerce> {
  List<Map<String, String>> cardArray = [
    {"title": "Cosmetic", "image": "assets/images/p_1.jpg"},
    {"title": "Fashion", "image": "assets/images/p_2.jpg"},
    {"title": "Restaurants", "image": "assets/images/p_3.jpg"},
    {"title": "Cab Service", "image": "assets/images/p_4.jpg"},
    {"title": "Food Grocery", "image": "assets/images/p_5.jpg"},
    {"title": "Parcel", "image": "assets/images/p_6.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.menu),
                SizedBox(width: 10),
                Text("eMart"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.qr_code),
                SizedBox(width: 10),
                Icon(Icons.search),
                SizedBox(width: 10),
                Icon(Icons.shopping_cart),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/banner.jpg'),
              ),
            ),
            SizedBox(height: 20), // Add spacing between the banner and grid
            Expanded(
              child: GridView.builder(

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                  childAspectRatio: 3 / 3, // Aspect ratio for grid items
                ),
                itemCount: cardArray.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 100,
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Container(

                        padding: EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child:
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: Image.asset(
                                  cardArray[index]["image"]!,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  cardArray[index]["title"]!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black.withOpacity(0.7)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
