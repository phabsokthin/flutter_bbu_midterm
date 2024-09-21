import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  // Create a list to store cart items
  List<CartItemData> cartItems = [
    CartItemData(
      itemName: 'Me Bandage Black \n Dress',
      itemPrice: 69.00,
      size: 'S',
      color: Colors.black,
      imagePath: 'https://theproperlabel.us/cdn/shop/products/the-proper-tee-shirt-classic-no-logo-243880.jpg?v=1707423914',
      quantity: 1,
    ),
    CartItemData(
      itemName: 'Me Bandage Francesca \n Dress',
      itemPrice: 77.00,
      size: 'S',
      color: Colors.purple,
      imagePath: 'https://www.inkfactory.pk/wp-content/uploads/2022/10/Mint-T-Shirt-019.jpg',
      quantity: 1,
    ),
    CartItemData(
      itemName: 'Me Bandage Blue \n Dress',
      itemPrice: 75.00,
      size: 'M',
      color: Colors.blue,
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7hc2Pgo3irQ0fHuK92Jol90BHNlHB6qzezQ&s',
      quantity: 1,
    ),
  ];

  // Calculate the total price
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.itemPrice * item.quantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Your Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItem(
            item: cartItems[index],
            onQuantityChanged: (newQuantity) {
              setState(() {
                cartItems[index].quantity = newQuantity;
              });
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${calculateTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.payment,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CartItemData {
  final String itemName;
  final double itemPrice;
  final String size;
  final Color color;
  final String imagePath;
  int quantity;

  CartItemData({
    required this.itemName,
    required this.itemPrice,
    required this.size,
    required this.color,
    required this.imagePath,
    required this.quantity,
  });
}

class CartItem extends StatelessWidget {
  final CartItemData item;
  final Function(int) onQuantityChanged;

  const CartItem({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.itemName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${(item.itemPrice * item.quantity).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('Size:'),
                        const SizedBox(width: 4),
                        Text(item.size),
                        const SizedBox(width: 16),
                        const Text('Color:'),
                        const SizedBox(width: 4),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 25),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (item.quantity > 1) {
                                    onQuantityChanged(item.quantity - 1);
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  onQuantityChanged(item.quantity + 1);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );

  }
}
