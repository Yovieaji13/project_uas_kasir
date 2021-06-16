import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_uas_kasir/models/stock.dart';
import 'edit_screen.dart';

class StockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stock = Provider.of<List<Stock>>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Stock Morfeen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditStock(),
                ),
              );
            },
          )
        ],
      ),
      body: (stock != null)
          ? ListView.builder(
              itemCount: stock.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    stock[index].article + '' + stock[index].codeArticle,
                  ),
                  subtitle: Text('Stock ' + stock[index].qty.toString() + ' pcs - Size ' + stock[index].size),
                  trailing: Text('Rp.' + stock[index].price.toString() + '/pcs'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditStock(stock[index]
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}