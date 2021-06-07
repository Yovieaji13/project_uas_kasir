import 'package:flutter/material.dart';
import 'package:project_uas_kasir/pages/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_uas_kasir/providers/prov_stock.dart';
import 'package:project_uas_kasir/providers/prov_transaksi.dart';
import 'package:provider/provider.dart';
import 'package:project_uas_kasir/Service/firestore_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StockProvider()),
        StreamProvider(
          create: (context) => firestoreService.getstock(),
          // initialData: initialData,
        ),
        ChangeNotifierProvider(create: (context) => TransaksiProvider()),
        StreamProvider(
          create: (context) => firestoreService.getTransaksi(),
          //  initialData: initialData,
        ),
      ],
      child: MaterialApp(
        title: 'Kasir Morfeen Thirteen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StartScreen();
  }
}
