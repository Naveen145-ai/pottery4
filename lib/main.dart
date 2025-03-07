import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pottery/firebase_options.dart';
import 'loginPage.dart';
import 'combinedHome.dart';
//import 'lacaleString.dart'; // Corrected file name if needed
import 'products_controller.dart'; // Import the ProductsController

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the ProductsController globally using Get.put()
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Pottery App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/home', page: () => CombinedHomePage()),
      ],


      initialBinding: BindingsBuilder(() {
        // Initialize the ProductsController here
        Get.put(ProductsController());
      }),
    );
  }
}


