import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lacaleString.dart';
import 'Buy.dart';
import 'Notify.dart';
import 'Settings.dart';
import 'Logout.dart';

class CombinedHomePage extends StatefulWidget {
  @override
  _CombinedHomePageState createState() => _CombinedHomePageState();
}

class _CombinedHomePageState extends State<CombinedHomePage> {
  int _selectedIndex = 0; // Track the selected tab index
  String _selectedPotDetails = ''; // To hold the details of the selected pot
  String _selectedPotTitle = ''; // To hold the title of the selected pot
  int _selectedIconIndex = -1; // To highlight the selected icon

  // Search-related variables
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false; // To control search bar visibility

  // List of pots with details (replace with your own data)
  List<Map<String, String>> pots = [
    {'title': 'clayPot'.tr, 'details': 'clayPotDetails'.tr},
    {'title': 'flowerPot'.tr, 'details': 'flowerPotDetails'.tr},
    {'title': 'colorPot'.tr, 'details': 'colorPotDetails'.tr},
    {'title': 'earthenPot'.tr, 'details': 'earthenPotDetails'.tr},
    {'title': 'waterPot'.tr, 'details': 'waterPotDetails'.tr},
    {'title': 'terracottaPot'.tr, 'details': 'terracottaPotDetails'.tr},
    {'title': 'herbPot'.tr, 'details': 'herbPotDetails'.tr},
    {'title': 'glazedPot'.tr, 'details': 'glazedPotDetails'.tr},
    {'title': 'cactusPot'.tr, 'details': 'cactusPotDetails'.tr},
    {'title': 'decorativePot'.tr, 'details': 'decorativePotDetails'.tr},
    {'title': 'succulentPot'.tr, 'details': 'succulentPotDetails'.tr},
    {'title': 'vintagePot'.tr, 'details': 'vintagePotDetails'.tr},
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Get.to(() => NotifyPage()); // Navigate to Notifications screen
    } else if (index == 2) {
      Get.to(() => BuyPage()); // Navigate to Buy screen
    }
  }

  // Method to set details based on tapped icon
  void _showPotDetails(String title, String details, int index) {
    setState(() {
      _selectedPotTitle = title;
      _selectedPotDetails = details;
      _selectedIconIndex = index; // Highlight the tapped icon
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter the pots based on the search query
    List<Map<String, String>> filteredPots = pots.where((pot) {
      return pot['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // Background color for the entire Scaffold
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search for pottery...',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        )
            : Text('Pottery App'.tr), // Use translation here
        backgroundColor: Colors.blue, // Set the app bar color to blue
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching; // Toggle search bar visibility
                if (!_isSearching) {
                  _searchController.clear(); // Clear the search text when closing
                  _searchQuery = ''; // Clear search query
                }
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              _showLanguageDialog(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey, // Drawer background color
          child: ListView(
            children: [
              DrawerHeader(child: Text('Menu'.tr, style: TextStyle(color: Colors.white))),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Home'.tr, style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings'.tr, style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.to(() => SettingPage()); // Navigate to Settings page
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout'.tr, style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.to(() => LogoutPage()); // Navigate to Logout page
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Display filtered pottery icons in rows with spacing
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 columns for pottery icons
                    crossAxisSpacing: 10, // Horizontal space between icons
                    mainAxisSpacing: 10, // Vertical space between icons
                  ),
                  itemCount: filteredPots.length,
                  itemBuilder: (context, index) {
                    String title = filteredPots[index]['title']!;
                    String details = filteredPots[index]['details']!;
                    return _buildPotIcon(title, details, index);
                  },
                ),
              ],
            ),
          ),
          // Display the selected pottery details here
          if (_selectedPotDetails.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedPotTitle,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    _selectedPotDetails,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          Expanded(
            child: Center(
              child: Text('Welcome to Pottery Shop'.tr),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the current index
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Buy'.tr,
          ),
        ],
        onTap: _onTap, // Call _onTap when an item is tapped
      ),
    );
  }

  // Method to display each pottery icon with tap functionality
  Widget _buildPotIcon(String title, String details, int index) {
    bool isSelected = _selectedIconIndex == index; // Check if this icon is selected
    IconData icon = _getIconForPot(title); // Get corresponding icon for pot
    return GestureDetector(
      onTap: () {
        _showPotDetails(title, details, index); // Show details for this pot
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: isSelected ? Colors.redAccent : Colors.brown, // Highlight if selected
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.tealAccent : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Method to get icon for each pot
  IconData _getIconForPot(String title) {
    switch (title) {
      case 'Clay Pot':
        return Icons.local_fire_department;
      case 'Flower Pot':
        return Icons.local_florist;
      case 'Color Pot':
        return Icons.palette;
      case 'Earthen Pot':
        return Icons.architecture;
      case 'Water Pot':
        return Icons.water_drop;
      case 'Teracotta Pot':
        return Icons.landscape;
      case 'Herb Pot':
        return Icons.spa;
      case 'Glazed Pot':
        return Icons.opacity;
      case 'Cactus Pot':
        return Icons.emoji_emotions_outlined;
      case 'Decorative Pot':
        return Icons.style;
      case 'Succulent Pot':
        return Icons.nature;
      case 'Vintage Pot':
        return Icons.emoji_nature;
      default:
        return Icons.water_drop;
    }
  }
}


// Language selection dialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Language'.tr), // Use translated string
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






const String clayPotDetails = '''
1. Made from natural clay.
2. Ideal for slow cooking.
3. Eco-friendly.
4. Retains heat and moisture.
''';

const String flowerPotDetails = '''
1. Decorative and versatile.
2. Includes drainage options.
3. Custom sizes.
4. Lightweight and portable.
''';

const String colorPotDetails = '''
1. Vibrant and customizable.
2. UV-resistant coatings.
3. Variety of materials.
4. Perfect for themed decor.
''';

const String earthenPotDetails = '''
1. Natural, rustic design.
2. Keeps food cool.
3. Durable and traditional.
4. Eco-friendly.
''';

const String waterPotDetails = '''
1. Keeps water cool.
2. Earthy taste.
3. Eco-friendly option.
4. Rustic design.
''';

const String terracottaPotDetails = '''
1. Breathable, natural material.
2. Ideal drainage for plants.
3. Rustic, unsealed finish.
4. Great for outdoor use.
''';

const String herbPotDetails = '''
1. Compact for small herbs.
2. Includes drainage holes.
3. Suitable for balconies.
4. Eco-friendly materials.
''';

const String glazedPotDetails = '''
1. Glossy, vibrant look.
2. Non-absorbent surface.
3. Easy to clean.
4. Durable and decorative.
''';

const String cactusPotDetails = '''
1. Small, minimal-water use.
2. Includes drainage.
3. Modern design.
4. Compact for shelves.
''';

const String decorativePotDetails = '''
1. Aesthetic, intricate designs.
2. Multi-material options.
3. Ideal decor or gift.
4. Enhances any style.
''';

const String succulentPotDetails = '''
1. Compact, shallow design.
2. Easy maintenance.
3. Available in colors.
4. Great for busy owners.
''';

const String vintagePotDetails = '''
1. Antique, rustic charm.
2. Crafted from aged materials.
3. Great for decor or collection.
4. Fits classic themes.
''';


// PotDetailPage to display details of each pottery item
class PotDetailPage extends StatelessWidget {
  final String title;
  final String details;

  PotDetailPage({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          details,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}


