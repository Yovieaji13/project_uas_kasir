class Transaksi {
  final String transaksiId;
  final String codeProduk;
  final String size;
  final int harga;
  final int qty;
  final int uang;
  final int total;
  final int kembalian;

  Transaksi({
    this.transaksiId,
    this.codeProduk,
    this.size,
    this.harga,
    this.qty,
    this.uang,
    this.total,
    this.kembalian,
  });

  Map<String, dynamic> toMap() {
    return {
      'transaksiId' : transaksiId,
      'codeProduk' : codeProduk,
      'size' : size,
      'harga' : harga,
      'qty' : qty,
      'uang' : uang,
      'total' : total,
      'kembalian' : kembalian,
    };
  }

  Transaksi.fromFirestore(Map<String, dynamic> firestore)
      : transaksiId = firestore['transaksiId'],
        codeProduk = firestore['codeProduk'],
        size = firestore['size'],
        harga = firestore['harga'],
        qty = firestore['qty'],
        uang = firestore['uang'],
        total = firestore['total'],
        kembalian = firestore['kembalian'];
}