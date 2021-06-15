import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_uas_kasir/models/transaksi.dart';
import 'transaksi_screen.dart';

class Laporan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final transaksi = Provider.of<List<Transaksi>>(context);
    final int index = 0;

    String codeProduk = transaksi[index].codeProduk;
    String size = transaksi[index].size;
    int qty = transaksi[index].qty;
    int harga = transaksi[index].harga;
    int total = transaksi[index].total;
    int uang = transaksi[index].uang;
    int kembalian = transaksi[index].kembalian;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ListView(
          children: <Widget>[
            Text('-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|'),
            SizedBox(height: 30),
            Container(
              child: Image(
                image: NetworkImage(
                    'https://scontent.fsub1-2.fna.fbcdn.net/v/t1.6435-9/192652188_2065768070229700_2158602817331160430_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=730e14&_nc_eui2=AeHWSf462FQsMbT-HQ6raXSa1tcirKZpkTnW1yKspmmROTiwXQqF3jQ0w-hI6Ra2JK7lYE6tx7NTwVpqfi6-ccJs&_nc_ohc=1su0VQWumpsAX_kfvhn&_nc_ht=scontent.fsub1-2.fna&oh=e71f15f5ebc4077e6bd3ff7a783ad374&oe=60CC1AF2'),
              ),
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Column(children: [
              Text('Jl Suwari Selatan No.07, Sukun - Kota Malang',
                  style: TextStyle(fontSize: 14)),
              Text('Telp. 088741164285',
                  style: TextStyle(height: 2, fontSize: 14)),
            ]),
            SizedBox(height: 30),
            ListTile(
              title: Text('No' + '\nDine in' + '\nKasir',
                  style: TextStyle(fontSize: 14)),
              trailing: Text(
                  'P1-0621-14062021' +
                      '\n14 Juni 2021 13:00' +
                      '\nYovie Haditama W',
                  style: TextStyle(fontSize: 14)),
            ),
            Text('------------------------------------------------------------------------------------------------'),
            ListTile(
              title: Text('Code' + '\nSize'
              , style: TextStyle(fontSize: 14)),
              trailing: Text(codeProduk + '\n' + size
              , style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('\nPrice' + '\nQty',style: TextStyle(fontSize: 14)),
              trailing: Text('\nRp.' + harga.toString() + '\n' + qty.toString() + ' pcs'
              ,style: TextStyle(fontSize: 14)),
            ),
            Text('------------------------------------------------------------------------------------------------'),
            ListTile(
              title: Text('Total',),
              trailing: Text('Rp.' + total.toString(),),
            ),
            Text('------------------------------------------------------------------------------------------------'),
            ListTile(
              title: Text('Pembayaran Tunai' + '\nKembalian',),
              trailing: Text('Rp.' + uang.toString() + '\nRp.' + kembalian.toString()),
            ),
            SizedBox(height: 120),
            Column(children: [
              Text('Terima Kasih Telah Belanja Di Toko Kami',
                  style: TextStyle(fontSize: 14)),
              Text('@morfeen.official',
                  style: TextStyle(height: 2, fontSize: 14)),
            ]),
            SizedBox(height: 20,),
            Text('-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|'),
          ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return TransaksiScreen();
            }), ModalRoute.withName('/'));
          },
          child: Icon(Icons.backspace)),
    
    );
  }
}
