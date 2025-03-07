import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lacaleString.dart'; // Correct import
import 'products_controller.dart'; // Import ProductsController
import 'Settings.dart'; // Assuming you have a settings page
import 'logout.dart'; // Assuming you have a logout functionality
import 'AccountManagement.dart'; // Assuming you have an account management page

class SellersPage extends StatelessWidget {
  final ProductsController _controller = Get.put(ProductsController()); // Instantiate the controller
  final TextEditingController _searchController = TextEditingController(); // Controller for search

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sellersPageTitle'.tr),
        backgroundColor: Colors.blue, // Set background color to blue
        actions: [
          // Language selection icon in the app bar
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              _showLanguageDialog(context); // Show language dialog on tap
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Sellers Dashboard',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'.tr),
              onTap: () {
                Get.to(() => SettingPage()); // Navigate to settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'.tr),
              onTap: () {
                Get.to(() => AccountManagementPage()); // Navigate to account management page
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'.tr),
              onTap: () {
                Get.to(() => LogoutPage()); // Navigate to logout page
              },
            ),
          ],
        ),
      ),
      body: Obx(
            () {
          // Filtered product list based on search query
          final filteredProducts = _controller.productList
              .where((product) => product
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
              .toList();

          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                'manageProducts'.tr,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Products',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (_) {
                  // Trigger rebuild to show filtered list
                  _controller.update();
                },
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          String newPotName = '';
                          return AlertDialog(
                            title: Text('addNewPot'.tr),
                            content: TextField(
                              decoration: InputDecoration(
                                labelText: 'enterPotName'.tr,
                              ),
                              onChanged: (newName) {
                                newPotName = newName;
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('cancel'.tr),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (newPotName.isNotEmpty) {
                                    _controller.addProduct(newPotName);
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('add'.tr),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('addNewPotButton'.tr),
                  ),
                  SizedBox(height: 20),
                  // Display filtered product list
                  ...filteredProducts.map((product) {
                    return Card(
                      child: ListTile(
                        title: Text(product),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    String updatedName = product;
                                    return AlertDialog(
                                      title: Text('editProduct'.tr),
                                      content: TextField(
                                        controller: TextEditingController(text: product),
                                        decoration: InputDecoration(
                                          labelText: 'productDetails'.tr,
                                        ),
                                        onChanged: (newName) {
                                          updatedName = newName;
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text('cancel'.tr),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _controller.updateProduct(
                                                _controller.productList.indexOf(product), updatedName);
                                            Navigator.pop(context);
                                          },
                                          child: Text('save'.tr),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _controller.removeProduct(product);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }


  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Language'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  Get.updateLocale(Locale('en', 'US'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Kannada'),
                onTap: () {
                  Get.updateLocale(Locale('kn', 'IN'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Hindi'),
                onTap: () {
                  Get.updateLocale(Locale('hi', 'IN'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Tamil'),
                onTap: () {
                  Get.updateLocale(Locale('ta', 'IN'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Telugu'),
                onTap: () {
                  Get.updateLocale(Locale('te', 'IN'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
