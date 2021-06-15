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
  int _uang;
  int _total;
  int _kembalian;
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

   get uang => this._uang;
 changeuang(String value){
   _uang = int.parse(value);
  notifyListeners();
 }

  get total => this._total;
 changetotal(String value){
   _total = int.parse(value);
  notifyListeners();
 }

   get kembalian => this._kembalian;
 changekembalian(String value){
   _kembalian = int.parse(value);
  notifyListeners();
 }

  loadValues(Transaksi transaksi) {
    _transaksiId = transaksi.transaksiId;
    _codeProduk = transaksi.codeProduk;
    _size = transaksi.size;
    _harga = transaksi.harga;
    _qty = transaksi.qty;
    _uang = transaksi.uang;
    _total = transaksi.total;
    _kembalian = transaksi.kembalian;
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
        uang: uang,
        total: total,
        kembalian: kembalian,
      );
      firestoreservice.saveTransaksi(newTransaksi);
    } else {
      //Update
      var updatedTransaksi = Transaksi(
        transaksiId: transaksiId,
        codeProduk: _codeProduk,
        size: _size,
        harga: _harga,
        qty: _qty,
        uang: _uang,
        total: _total,
        kembalian: _kembalian,
      );
      firestoreservice.saveTransaksi(updatedTransaksi);
    }
  }

  //delete
  removeTransaksi(String transaksiId) {
    firestoreservice.removeTransaksi(transaksiId);
  }
}
