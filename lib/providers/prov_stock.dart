import 'package:flutter/material.dart';
import 'package:project_uas_kasir/Service/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:project_uas_kasir/models/stock.dart';

class StockProvider with ChangeNotifier {
  final firestoreservice = FirestoreService();
  String _stockId;
  String _article;
  String _codeArticle;
  String _size;
  int _qty;
  int _price;
  var uuid = Uuid();

  get stockId => this._stockId;
  // set stockId(value) => this._stockId = value;

  get article => this._article;
  changearticle(String value) {
    _article = value;
    notifyListeners();
  }

  get codeArticle => this._codeArticle;
  changecodeArticle(String value){
    _codeArticle = value;
    notifyListeners();
  }

  get size => this._size;
  changesize(String value){
    _size = value;
    notifyListeners();
  }

  get qty => this._qty;
  changeqty(String value){
    _qty = int.parse(value);
    notifyListeners();
  }
  get price => this._price;
  changeprice(String value){
    _price = int.parse(value);
    notifyListeners();
  }

  loadValues(Stock stock) {
    _stockId = stock.stockId;
    _article = stock.article;
    _codeArticle = stock.codeArticle;
    _size = stock.size;
    _qty = stock.qty;
    _price = stock.price;
  }

  //create/update
  saveStock() {
    print(_stockId);
    if (_stockId == null) {
      var newStock = Stock(
        stockId: uuid.v4(),
        article: article,
        codeArticle: codeArticle,
        size: size,
        qty: qty,
        price: price,
      );
      firestoreservice.saveStock(newStock);
    } else {
      //Update
      var updatedStock = Stock(
        stockId: _stockId,
        article: _article,
        codeArticle: _codeArticle,
        size: _size,
        qty: _qty,
        price: _price,
      );
      firestoreservice.saveStock(updatedStock);
    }
  }

  //delete
  removeStock(String stockId) {
    firestoreservice.removeStock(stockId);
  }
}
