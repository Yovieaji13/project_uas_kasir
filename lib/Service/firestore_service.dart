import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_uas_kasir/models/transaksi.dart';
import 'package:project_uas_kasir/models/stock.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //
  Future<void> saveStock(Stock stock) {
    return _db.collection('stock').doc(stock.stockId).set(stock.toMap());
  }

  Stream<List<Stock>> getstock() {
    return _db.collection('stock').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Stock.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeStock(String stockId) {
    return _db.collection('stock').doc(stockId).delete();
  }

  Future<void> saveTransaksi(Transaksi transaksi) {
    return _db.collection('transaksi').doc(transaksi.transaksiId).set(transaksi.toMap());
  }

  Stream<List<Transaksi>> getTransaksi() {
    return _db.collection('transaksi').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Transaksi.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeTransaksi(String transaksiId) {
    return _db.collection('transaksi').doc(transaksiId).delete();
  }
}