import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyEcommerce2 extends StatefulWidget {
  const MyEcommerce2({super.key});

  @override
  State<MyEcommerce2> createState() => _MyEcommerce2State();
}

class _MyEcommerce2State extends State<MyEcommerce2> {
  List<Map<String, String>> cardArray = [
    {"title": "Man", "image": "assets/images/p_1.jpg"},
    {"title": "Woman", "image": "assets/images/p_2.jpg"},
    {"title": "Kids", "image": "assets/images/p_3.jpg"},
    {"title": "Shoes", "image": "assets/images/p_4.jpg"},
    {"title": "Jewelry", "image": "assets/images/p_5.jpg"},
    {"title": "Beauty Care", "image": "assets/images/p_6.jpg"},
    {"title": "Sports", "image": "assets/images/p_5.jpg"},
    {"title": "Toys", "image": "assets/images/p_6.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, size: 30),
            Icon(Icons.shopping_cart, size: 30),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  padding: EdgeInsets.all(13),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300,
                  ),
                  child: Image.network(
                    'https://cdn.icon-icons.com/icons2/1415/PNG/512/ic-filter_97609.png',
                    width: 20,
                  ),
                ),
              ],
            ),
              SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/banner.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),



            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of items per row
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                  childAspectRatio: 1.0, // Aspect ratio for grid items
                ),
                itemCount: cardArray.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10), // Adjust padding as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  cardArray[index]["image"]!,
                                  fit: BoxFit.contain, // Ensure image covers the container
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                cardArray[index]["title"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10, // Adjust font size as needed
                                  color: Colors.black.withOpacity(0.7),
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
