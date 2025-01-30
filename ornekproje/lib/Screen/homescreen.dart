import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ornekproje/modelc/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UrunlerModel? _veriler;
  List<Urun> _urunler = [];

  void _loadData() async {
    final dataString = await rootBundle.loadString(
        'assets/files/data.json'); // datajson'dan verilerimizi aldık ve datastring'e yükledik.
    final dataJson = jsonDecode(
        dataString); //datastring'imizdeki kodlarımızı çözümledik yani stringe çevirdik diyebiliriz.
    _veriler = UrunlerModel.fromjson(dataJson);
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  void filterdata(int id) {
    _urunler = _veriler!.urunler
        .where(
          (elemanlar) => elemanlar.kategori == id,
        )
        .toList();
    setState(() {});
  }

  void _resetfilter() {
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _veriler == null
            ? const Text('Yukleniyor')
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: _resetfilter, child: (Text('Ana Sayfa'))),
                  _kategorirow(),
                  _urunlermethod(),
                ],
              ),
      ),
    );
  }

  ListView _urunlermethod() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _urunler.length,
      itemBuilder: (context, index) {
        final Urun urun = _urunler[index];
        return ListTile(
          leading: Image.asset(
            urun.resim,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(urun.isim),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 5,
      ),
    );
  }

  Row _kategorirow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _veriler!.kategoriler.length,
        (index) {
          final kategori = _veriler!.kategoriler[index];
          return GestureDetector(
            onTap: () => filterdata(kategori.id),
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(8)),
              child: Text(kategori.isim),
            ),
          );
        },
      ),
    );
  }
}
