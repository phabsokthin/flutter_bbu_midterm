import 'dart:ui';

import 'package:flutter/material.dart';

class MyEcommerce3 extends StatefulWidget {
  const MyEcommerce3({super.key});

  @override
  State<MyEcommerce3> createState() => _MyEcommerce3State();
}

class _MyEcommerce3State extends State<MyEcommerce3> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> cardArray = [
    {
      "title": "Man",
      "subtitle": "New 1",
      "price": 100,
      "image": "https://mackweldon.com/cdn/shop/products/M01T12-TN_Front.png?v=1638913612"
    },
    {
      "title": "Woman",
      "subtitle": "Classic Shirt",
      "price": 80,
      "image": "https://cdn.shopify.com/s/files/1/0023/1342/0889/products/ClassicShirt_White_1_5cd5bf10-af18-4d0b-a477-bc3422d8401a.jpg?v=1688497040"
    },
    {
      "title": "Kids",
      "subtitle": "Fun Toys",
      "price": 50,
      "image": "https://m.media-amazon.com/images/I/911n4nIhnpL._AC_UY1000_.jpg"
    },
    {
      "title": "Shoes",
      "subtitle": "Comfort Style",
      "price": 120,
      "image": "https://m.media-amazon.com/images/I/71+LK6XTuFL._AC_UY1100_.jpg"
    },
    {
      "title": "Jewelry",
      "subtitle": "Elegant",
      "price": 200,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV-YGvRQDec19ZdvWSADxqG2zqru0HiObt9A&s"
    },
    {
      "title": "Beauty Care",
      "subtitle": "Skincare",
      "price": 90,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ0b8uHJgJ_xQaX8Rk9Y8UHcz6lVKKBGqSEA&s"
    },
    {
      "title": "Sports",
      "subtitle": "Active Gear",
      "price": 150,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfVu-3zoeOSWvLESygPat9hKdpzaEx1vK60A&s"
    },
    {
      "title": "Toys",
      "subtitle": "For Kids",
      "price": 30,
      "image": "https://www.mrporter.com/variants/images/3633577411310824/in/w2000_q60.jpg"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.menu),
            Icon(Icons.search),
          ],
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorPadding: EdgeInsets.only(left: 16.0, right: 16.0),
              controller: _tabController,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: "New Arrivals"),
                Tab(text: "Trendings"),
                Tab(text: "Brands"),
                Tab(text: "News Fashion"),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: cardArray.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey.shade100,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(cardArray[index]["image"]!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Space between image and text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          cardArray[index]["subtitle"]!,
                          style: const TextStyle(color: Colors.pink, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          cardArray[index]["title"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 2), // Space between title and price
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${cardArray[index]["price"]}.00',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.favorite_border, size: 18, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

          ),
          const Center(child: Text('Trending Content')),
          const Center(child: Text('Brands Content')),
          const Center(child: Text('News Fashion Content')),
        ],
      ),
    );
  }
}
