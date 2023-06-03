class Keranjang {
  final int id;
  final int produk_id;
  final int toko_id;
  final String nama_produk;
  final int harga;
  final int qty;
  final int total;
  // final String gambar;
  final int pelanggan_id;


  Keranjang(
      {required this.id,
      required this.produk_id,
      required this.toko_id,
      required this.nama_produk,
      required this.harga,
      required this.qty,
      required this.total,
      // required this.gambar,
      required this.pelanggan_id,
       });

  factory Keranjang.fromJson(Map<String, dynamic> json) {
    return Keranjang(
      id: json['id'] as int,
      produk_id: json['produk_id'] as int,
      toko_id: json['toko_id'] as int,
      nama_produk: json['nama_produk'] as String,
      harga: json['harga'] as int,
      qty: json['qty'] as int,
      total: json['total'] as int,
      // gambar: json['gambar'] as String,
      pelanggan_id: json['pelanggan_id'] as int,
    );
  }

  factory Keranjang.fromMap(Map<String, dynamic> map) {
    return Keranjang(
      id: map['id'] as int,
      produk_id: map['produk_id'] as int,
      toko_id: map['toko_id'] as int,
      nama_produk: map['nama_produk'] as String,
      harga: map['harga'] as int,
      qty: map['qty'] as int,
      total: map['total'] as int,
      // gambar: map['gambar'] as String,
      pelanggan_id: map['pelanggan_id'] as int,
    );
  }
}
