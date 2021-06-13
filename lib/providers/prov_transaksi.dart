import 'package:flutter/material.dart';
import 'package:project_uas_kasir/Service/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:project_uas_kasir/models/transaksi.dart';

class TransaksiProvider with ChangeNotifier {
  final firestoreservice = FirestoreService();
  String _transaksiId;
  String _codeProduk;
  String _size;
  int _harga;
  int _qty;
  var uuid = Uuid();

  get transaksiId => this._transaksiId;
//  set transaksiId( value) => this._transaksiId = value;

  get codeProduk => this._codeProduk;
 changecodeProduk(String value){
   _codeProduk = value;
  notifyListeners();
 }

  get size => this._size;
 changesize(String value){
   _size = value;
  notifyListeners();
 }

  get harga => this._harga;
 changeharga(String value){
   _harga = int.parse(value);
  notifyListeners();
 }

  get qty => this._qty;
 changeqty(String value){
   _qty = int.parse(value);
  notifyListeners();
 }

  loadValues(Transaksi transaksi) {
    _transaksiId = transaksi.transaksiId;
    _codeProduk = transaksi.codeProduk;
    _size = transaksi.size;
    _harga = transaksi.harga;
    _qty = transaksi.qty;
  }

  //create/update
  saveTransaksi() {
    print(_transaksiId);
    if (_transaksiId == null) {
      var newTransaksi = Transaksi(
        transaksiId: uuid.v4(),
        codeProduk: codeProduk,
        size: size,
        harga: harga,
        qty: qty,
      );
      firestoreservice.saveTransaksi(newTransaksi);
    } else {
      //Update
      var updatedTransaksi = Transaksi(
        codeProduk: codeProduk,
        size: size,
        harga: harga,
        qty: qty,
      );
      firestoreservice.saveTransaksi(updatedTransaksi);
    }
  }

  //delete
  removeTransaksi(String transaksiId) {
    firestoreservice.removeStock(transaksiId);
  }
}
