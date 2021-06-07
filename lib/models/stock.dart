class Stock {
  final String stockId;
  final String article;
  final String codeArticle;
  final String size;
  final int qty;
  final int price;

  Stock({
    this.stockId,
    this.article,
    this.codeArticle,
    this.size,
    this.qty,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'stockId': stockId,
      'article': article,
      'codeArticle': codeArticle,
      'size': size,
      'qty' : qty,
      'price' : price,
    };
  }

  Stock.fromFirestore(Map<String, dynamic> firestore)
      : stockId = firestore['stockId'],
        article = firestore['article'],
        codeArticle = firestore['codeArticle'],
        size = firestore['size'],
        qty = firestore['qty'],
        price = firestore['price'];
}