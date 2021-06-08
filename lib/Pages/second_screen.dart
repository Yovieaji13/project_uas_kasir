import 'package:flutter/material.dart';
import 'package:project_uas_kasir/main.dart';
import 'package:project_uas_kasir/service/sign_in.dart';
import 'stock_screen.dart';
import 'transaksi_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                name ?? email.split('@')[0],
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: <Widget>[
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.audiotrack_outlined,
                      label: 'Event',
                    ),
                    // onTap: () {
                    //   MaterialPageRoute route =
                    //             MaterialPageRoute(builder: (_) => StockScreen());
                    //         Navigator.push(context, route);
                    //   },
                  ),
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.article_outlined,
                      label: 'Journal',
                    ),
                    // onTap: () {
                    //   MaterialPageRoute route =
                    //             MaterialPageRoute(builder: (_) => StockScreen());
                    //         Navigator.push(context, route);
                    //   },
                  ),
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.add_a_photo_outlined,
                      label: 'Gallery',
                    ),
                    // onTap: () {
                    //   MaterialPageRoute route =
                    //             MaterialPageRoute(builder: (_) => StockScreen());
                    //         Navigator.push(context, route);
                    //   },
                  ),
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.anchor_outlined,
                      label: 'About',
                    ),
                    // onTap: () {
                    //   MaterialPageRoute route =
                    //             MaterialPageRoute(builder: (_) => StockScreen());
                    //         Navigator.push(context, route);
                    //   },
                  ),
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.add_business_outlined,
                      label: 'Store',
                    ),
                    // onTap: () {
                    //   MaterialPageRoute route =
                    //             MaterialPageRoute(builder: (_) => StockScreen());
                    //         Navigator.push(context, route);
                    //   },
                  ),
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.add_shopping_cart_outlined,
                      label: 'Transaksi',
                    ),
                    onTap: () {
                      MaterialPageRoute route =
                                MaterialPageRoute(builder: (_) => TransaksiScreen());
                            Navigator.push(context, route);
                      },
                  ),
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.archive_outlined,
                      label: 'Stock',
                    ),
                    onTap: () {
                      MaterialPageRoute route =
                          MaterialPageRoute(builder: (_) => StockScreen());
                      Navigator.push(context, route);
                    },
                  ),
                  InkWell(
                    child: MenuIcon(
                      icon: Icons.account_circle_outlined,
                      label: 'Contact',
                    ),
                    // onTap: () {
                    //   MaterialPageRoute route =
                    //             MaterialPageRoute(builder: (_) => StockScreen());
                    //         Navigator.push(context, route);
                    //   },
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  MenuIcon({this.icon, this.iconColor, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(icon, color: iconColor),
            ),
          ),
          SizedBox(height: 10.0),
          Text(label)
        ],
      ),
    );
  }
}