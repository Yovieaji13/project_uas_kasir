import 'package:project_uas_kasir/models/transaksi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'laporan.dart';
import 'package:project_uas_kasir/providers/prov_transaksi.dart';

class EditTrans extends StatefulWidget {
  final Transaksi transaksi;

  EditTrans([this.transaksi]);

  @override
  _EditTransState createState() => _EditTransState();
}

class _EditTransState extends State<EditTrans> {
  final codeProdukController = TextEditingController();
  final sizeController = TextEditingController();
  final hargaController = TextEditingController();
  final qtyController = TextEditingController();
  final uangController = TextEditingController();
  int harga, qty, total, kembalian, uang;

  void Total() {
    total = int.parse(hargaController.text) * int.parse(qtyController.text);
  }

  void Kembalian() {
    kembalian = int.parse(uangController.text) - total;
  }

  @override
  void dispose() {
    codeProdukController.dispose();
    sizeController.dispose();
    hargaController.dispose();
    qtyController.dispose();
    uangController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.transaksi == null) {
      //New Record
      codeProdukController.text = "";
      sizeController.text = "";
      hargaController.text = "";
      qtyController.text = "";
      uangController.text = "";
      new Future.delayed(Duration.zero, () {
        final transaksiProvider =
            Provider.of<TransaksiProvider>(context, listen: false);
        transaksiProvider.loadValues(Transaksi());
      });
    } else {
      //Controller Update
      codeProdukController.text = widget.transaksi.codeProduk;
      sizeController.text = widget.transaksi.size;
      hargaController.text = widget.transaksi.harga.toString();
      qtyController.text = widget.transaksi.qty.toString();
      uangController.text = widget.transaksi.uang.toString();
      //State Update
      new Future.delayed(Duration.zero, () {
        final transaksiProvider =
            Provider.of<TransaksiProvider>(context, listen: false);
        transaksiProvider.loadValues(widget.transaksi);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transaksiProvider = Provider.of<TransaksiProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Transaksi'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.cancel,
                size: 30.0,
              ),
              onPressed: () {
                transaksiProvider.removeTransaksi(widget.transaksi.transaksiId);
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
                controller: codeProdukController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  transaksiProvider.changecodeProduk(value);
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
                  transaksiProvider.changesize(value);
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: hargaController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  transaksiProvider.changeharga(value);
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
                  transaksiProvider.changeqty(value);
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: uangController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Uang Customer',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  transaksiProvider.changeuang(value);
                  //
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: RaisedButton(
                onPressed: () {
                  Total();
                  Kembalian();
                  transaksiProvider.changekembalian(kembalian.toString());
                  transaksiProvider.changetotal(total.toString());
                  transaksiProvider.saveTransaksi();
                  Navigator.of(context).pop();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                    color: Colors.black,
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 10,
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return Laporan();
            }), ModalRoute.withName('/'));
          },
          child: Icon(Icons.file_copy_outlined)),
    );
  }
}
