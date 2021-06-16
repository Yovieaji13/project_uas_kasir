import 'package:project_uas_kasir/models/stock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_uas_kasir/providers/prov_stock.dart';

class EditStock extends StatefulWidget {
  final Stock stock;

  EditStock([this.stock]);

  @override
  _EditStockState createState() => _EditStockState();
}

class _EditStockState extends State<EditStock> {
  final artcileController = TextEditingController();
  final codeArticleController = TextEditingController();
  final sizeController = TextEditingController();
  final qtyController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    artcileController.dispose();
    codeArticleController.dispose();
    sizeController.dispose();
    qtyController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.stock == null) {
      //New Record
      artcileController.text = "";
      codeArticleController.text = "";
      sizeController.text = "";
      qtyController.text = "";
      priceController.text = "";
      new Future.delayed(Duration.zero, () {
        final stockProvider =
            Provider.of<StockProvider>(context, listen: false);
        stockProvider.loadValues(Stock());
      });
    } else {
      //Controller Update
      artcileController.text = widget.stock.article;
      codeArticleController.text = widget.stock.codeArticle;
      sizeController.text = widget.stock.size;
      qtyController.text = widget.stock.qty.toString();
      priceController.text = widget.stock.price.toString();
      //State Update
      new Future.delayed(Duration.zero, () {
        final stockProvider =
            Provider.of<StockProvider>(context, listen: false);
        stockProvider.loadValues(widget.stock);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Update Stock'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.cancel,
                size: 30.0,
              ),
              onPressed: () {
                      stockProvider.removeStock(widget.stock.stockId);
                      Navigator.of(context).pop();             
              },
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: TextField(
                controller: artcileController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Article',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  stockProvider.changearticle(value);
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: codeArticleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Code Article',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  stockProvider.changecodeArticle(value);
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: sizeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Size',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  stockProvider.changesize(value);
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: qtyController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Qty',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  stockProvider.changeqty(value);
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  stockProvider.changeprice(value);
                  //
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              title: Text('Warning : ', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('1. Input stock barang yang masuk sesuai invoice'
              + '\n2. Wajib mengupdate stock apabila ada perubahan'
              + '\n3. Setiap seminggu sekali check stock'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
          onPressed: () {
            stockProvider.saveStock();
            Navigator.of(context).pop();
          },
          child: Icon(Icons.archive_outlined)),
    );
  }
}
