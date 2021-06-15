import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_uas_kasir/models/transaksi.dart';
import 'editTrans_screen.dart';
import 'laporan.dart';

class TransaksiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transaksi = Provider.of<List<Transaksi>>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Transaksi'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditTrans(),
                ),
              );
            },
          )
        ],
      ),
      body: (transaksi != null)
          ? ListView.builder(
              itemCount: transaksi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    transaksi[index].codeProduk + ' - Size ' + transaksi[index].size,
                  ),
                  subtitle: Text('Rp.' + transaksi[index].harga.toString()),
                  trailing: Text('Order ' + transaksi[index].qty.toString() + ' pcs' ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditTrans(transaksi[index]
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
