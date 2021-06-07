class Transaksi {
  final String transaksiId;
  final String codeProduk;
  final String size;
  final int harga;
  final int qty;

  Transaksi({
    this.transaksiId,
    this.codeProduk,
    this.size,
    this.harga,
    this.qty,
  });

  Map<String, dynamic> toMap() {
    return {
      'transaksiId' : transaksiId,
      'codeProduk' : codeProduk,
      'size' : size,
      'harga' : harga,
      'qty' : qty,
    };
  }

  Transaksi.fromFirestore(Map<String, dynamic> firestore)
      : transaksiId = firestore['transaksiId'],
        codeProduk = firestore['codeProduk'],
        size = firestore['size'],
        harga = firestore['harga'],
        qty = firestore['qty'];
}