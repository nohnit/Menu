class UrunlerModel {
  final List<Urun> urunler;
  final List<Kategori> kategoriler;
  UrunlerModel(this.urunler, this.kategoriler);
  factory UrunlerModel.fromjson(Map<String, dynamic> json) {
    final List jsonurunler = json['urunler'];
    final List jsonkategoriler = json['kategoriler'];

    return UrunlerModel(
        jsonurunler
            .map(
              (e) => Urun.fromjson(e),
            )
            .toList(),
        jsonkategoriler
            .map(
              (e) => Kategori.fromjson(e),
            )
            .toList());
  }
}

class Urun {
  final int id;
  final int kategori;
  final String isim;
  final String resim;
  Urun(this.id, this.kategori, this.isim, this.resim);

  Urun.fromjson(
      Map<String, dynamic>
          json) // bu kod satırımız urunumüzü herhangi bir ürün olabilir bu onu oluşturduğumuz modele çeviriyor.
      : id = json['id'],
        kategori = json['kategori'],
        isim = json['isim'],
        resim = json['resim'];
}

class Kategori {
  final int id;
  final String isim;
  Kategori(this.id, this.isim);
  Kategori.fromjson(Map<String, dynamic> json) // aynı şekilde bu kodumuzda
      : id = json['id'],
        isim = json['isim'];
}
