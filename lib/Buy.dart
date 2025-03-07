import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lacaleString.dart'; // Import the LocaleString file

class BuyPage extends StatefulWidget {
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  // List of translated pottery product names
  List<String> potteryProducts = [
    'clay_pot'.tr,
    'flower_pot'.tr,
    'color_pot'.tr,
    'earthen_fine_pot'.tr,
    'water_pot'.tr,
    'terracotta_pot'.tr,
    'herb_pot'.tr,
    'glazed_pot'.tr,
    'cactus_pot'.tr,
    'decorative_pot'.tr,
    'succulent_pot'.tr,
    'vintage_pot'.tr,
  ];

  // Map for displaying prices linked to translation keys
  Map<String, String> potteryPrices = {
    'clay_pot'.tr: '₹150',
    'flower_pot'.tr: '₹200',
    'color_pot'.tr: '₹180',
    'earthen_fine_pot'.tr: '₹250',
    'water_pot'.tr: '₹300',
    'terracotta_pot'.tr: '₹350',
    'herb_pot'.tr: '₹120',
    'glazed_pot'.tr: '₹400',
    'cactus_pot'.tr: '₹220',
    'decorative_pot'.tr: '₹500',
    'succulent_pot'.tr: '₹280',
    'vintage_pot'.tr: '₹450',
  };

  List<String> cart = [];

  void _addToCart(String product) {
    setState(() {
      cart.add(product);
    });
    _showSnackbar('$product ${'added_to_cart'.tr}');
  }

  void _removeFromCart(String product) {
    setState(() {
      cart.remove(product);
    });
    _showSnackbar('$product ${'removed_from_cart'.tr}');
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _proceedToCheckout() {
    if (cart.isEmpty) {
      _showSnackbar('cart_empty'.tr);
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutPage(
          cart: cart,
          onRemoveFromCart: _removeFromCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('buy_pottery'.tr),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: potteryProducts.length,
                itemBuilder: (context, index) {
                  String product = potteryProducts[index];
                  String price = potteryPrices[product] ?? '₹0'; // Fetch price for each pot
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.style, color: Colors.green),
                      title: Text('$product - $price'), // Display product with its price
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                        onPressed: () => _addToCart(product),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _proceedToCheckout,
                child: Text('proceed_to_checkout'.tr),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final List<String> cart;
  final Function(String) onRemoveFromCart;

  CheckoutPage({required this.cart, required this.onRemoveFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('checkout'.tr),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.lightGreen[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'items_in_cart'.tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  String product = cart[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      title: Text(product),
                      leading: Icon(Icons.check_box, color: Colors.green),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                        onPressed: () {
                          onRemoveFromCart(product);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('order_placed'.tr)),
                  );
                  Navigator.pop(context);
                },
                child: Text('place_order'.tr),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
