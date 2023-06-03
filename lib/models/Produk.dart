class ModelTokoMinuman {
/*
{
  "id": 4,
  "nama_produk": "Jeruk Peras",
  "harga": "Rp.8.000",
  "deskripsi": "null",
  "satuan": "Gelas",
  "gambar": "assets/images/jeruk_peras.png",
  "status": "1",
  "kategori": "Reguler",
  "toko_id": 7,
  "sub_kategori": 13
} 
*/

  int? id;
  String? namaProduk;
  String? harga;
  String? deskripsi;
  String? satuan;
  String? gambar;
  String? status;
  String? kategori;
  int? toko_id;
  int? subKategori;

  ModelTokoMinuman({
    this.id,
    this.namaProduk,
    this.harga,
    this.deskripsi,
    this.satuan,
    this.gambar,
    this.status,
    this.kategori,
    this.toko_id,
    this.subKategori,
  });
  ModelTokoMinuman.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    namaProduk = json['nama_produk']?.toString();
    harga = json['harga']?.toString();
    deskripsi = json['deskripsi']?.toString();
    satuan = json['satuan']?.toString();
    gambar = json['gambar']?.toString();
    status = json['status']?.toString();
    kategori = json['kategori']?.toString();
    toko_id = json['toko_id']?.toInt();
    subKategori = json['sub_kategori']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_produk'] = namaProduk;
    data['harga'] = harga;
    data['deskripsi'] = deskripsi;
    data['satuan'] = satuan;
    data['gambar'] = gambar;
    data['status'] = status;
    data['kategori'] = kategori;
    data['toko_id'] = toko_id;
    data['sub_kategori'] = subKategori;
    return data;
  }
}

class ModelTokoMakanan {
/*
{
  "id": 1,
  "nama_produk": "Ayam Kalasan",
  "harga": "Rp.17.000",
  "deskripsi": "Perpaduan ayam bakar dengan bumbu plus kecap manis yang sangat unik",
  "satuan": "Porsi",
  "gambar": "assets/images/ayam_kalasan.png",
  "status": "1",
  "kategori": "Reguler",
  "toko_id": 7,
  "sub_kategori": 7
} 
*/

  int? id;
  String? namaProduk;
  String? harga;
  String? deskripsi;
  String? satuan;
  String? gambar;
  String? status;
  String? kategori;
  int? toko_id;
  int? subKategori;

  ModelTokoMakanan({
    this.id,
    this.namaProduk,
    this.harga,
    this.deskripsi,
    this.satuan,
    this.gambar,
    this.status,
    this.kategori,
    this.toko_id,
    this.subKategori,
  });
  ModelTokoMakanan.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    namaProduk = json['nama_produk']?.toString();
    harga = json['harga']?.toString();
    deskripsi = json['deskripsi']?.toString();
    satuan = json['satuan']?.toString();
    gambar = json['gambar']?.toString();
    status = json['status']?.toString();
    kategori = json['kategori']?.toString();
    toko_id = json['toko_id']?.toInt();
    subKategori = json['sub_kategori']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_produk'] = namaProduk;
    data['harga'] = harga;
    data['deskripsi'] = deskripsi;
    data['satuan'] = satuan;
    data['gambar'] = gambar;
    data['status'] = status;
    data['kategori'] = kategori;
    data['toko_id'] = toko_id;
    data['sub_kategori'] = subKategori;
    return data;
  }
}

class ModelTokoToko {
/*
{
  "id": 7,
  "nama": "Ayam Penyet Pegasus",
  "alamat": "Jl. Gusti Hamzah No.99",
  "gambar": "assets/images/toko_avatar.png",
  "kategori": "Reguler",
  "deskripsi": "Aneka Lauk dan Ayam",
  "ratingid": 4,
  "bintang": "4.7",
  "ulasanid": 1,
  "jumlah_ulasan": "100"
} 
*/

  int? id;
  String? nama;
  String? alamat;
  String? gambar;
  String? kategori;
  String? deskripsi;
  int? ratingid;
  String? bintang;
  int? ulasanid;
  String? jumlahUlasan;

  ModelTokoToko({
    this.id,
    this.nama,
    this.alamat,
    this.gambar,
    this.kategori,
    this.deskripsi,
    this.ratingid,
    this.bintang,
    this.ulasanid,
    this.jumlahUlasan,
  });
  ModelTokoToko.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    nama = json['nama']?.toString();
    alamat = json['alamat']?.toString();
    gambar = json['gambar']?.toString();
    kategori = json['kategori']?.toString();
    deskripsi = json['deskripsi']?.toString();
    ratingid = json['ratingid']?.toInt();
    bintang = json['bintang']?.toString();
    ulasanid = json['ulasanid']?.toInt();
    jumlahUlasan = json['jumlah_ulasan']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['gambar'] = gambar;
    data['kategori'] = kategori;
    data['deskripsi'] = deskripsi;
    data['ratingid'] = ratingid;
    data['bintang'] = bintang;
    data['ulasanid'] = ulasanid;
    data['jumlah_ulasan'] = jumlahUlasan;
    return data;
  }
}

class ModelToko {
/*
{
  "toko": [
    {
      "id": 7,
      "nama": "Ayam Penyet Pegasus",
      "alamat": "Jl. Gusti Hamzah No.99",
      "gambar": "assets/images/toko_avatar.png",
      "kategori": "Reguler",
      "deskripsi": "Aneka Lauk dan Ayam",
      "ratingid": 4,
      "bintang": "4.7",
      "ulasanid": 1,
      "jumlah_ulasan": "100"
    }
  ],
  "makanan": [
    {
      "id": 1,
      "nama_produk": "Ayam Kalasan",
      "harga": "Rp.17.000",
      "deskripsi": "Perpaduan ayam bakar dengan bumbu plus kecap manis yang sangat unik",
      "satuan": "Porsi",
      "gambar": "assets/images/ayam_kalasan.png",
      "status": "1",
      "kategori": "Reguler",
      "toko_id": 7,
      "sub_kategori": 7
    }
  ],
  "minuman": [
    {
      "id": 4,
      "nama_produk": "Jeruk Peras",
      "harga": "Rp.8.000",
      "deskripsi": "null",
      "satuan": "Gelas",
      "gambar": "assets/images/jeruk_peras.png",
      "status": "1",
      "kategori": "Reguler",
      "toko_id": 7,
      "sub_kategori": 13
    }
  ]
} 
*/

  List<ModelTokoToko?>? toko;
  List<ModelTokoMakanan?>? makanan;
  List<ModelTokoMinuman?>? minuman;

  ModelToko({
    this.toko,
    this.makanan,
    this.minuman,
  });
  ModelToko.fromJson(Map<String, dynamic> json) {
  if (json['toko'] != null) {
  final v = json['toko'];
  final arr0 = <ModelTokoToko>[];
  v.forEach((v) {
  arr0.add(ModelTokoToko.fromJson(v));
  });
    toko = arr0;
    }
  if (json['makanan'] != null) {
  final v = json['makanan'];
  final arr0 = <ModelTokoMakanan>[];
  v.forEach((v) {
  arr0.add(ModelTokoMakanan.fromJson(v));
  });
    makanan = arr0;
    }
  if (json['minuman'] != null) {
  final v = json['minuman'];
  final arr0 = <ModelTokoMinuman>[];
  v.forEach((v) {
  arr0.add(ModelTokoMinuman.fromJson(v));
  });
    minuman = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (toko != null) {
      final v = toko;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['toko'] = arr0;
    }
    if (makanan != null) {
      final v = makanan;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['makanan'] = arr0;
    }
    if (minuman != null) {
      final v = minuman;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['minuman'] = arr0;
    }
    return data;
  }
}