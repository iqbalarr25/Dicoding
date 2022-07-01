import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iqbal_proyek_akhir/models/product.dart';

class DetailView extends StatefulWidget {
  final Product detailProduct;
  const DetailView({Key? key, required this.detailProduct}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int jumlahTerbeli = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Product",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          SizedBox(
            width: 30,
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.shopping_cart),
                ),
                if (jumlahTerbeli != 0) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Text(
                          jumlahTerbeli.toString(),
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Center(
                child: Image.asset(
                    "assets/images/${widget.detailProduct.image}",
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: "Rp.",
                        decimalDigits: 0,
                      ).format(widget.detailProduct.harga).toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    widget.detailProduct.judul,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  const Text(
                    "Detail Produk",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.detailProduct.deskripsi,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 55),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        enableDrag: false,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: GestureDetector(
            onTap: () {
              jumlahTerbeli++;
              setState(() {});
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.green,
              ),
              child: const Center(
                child: Text(
                  "Beli langsung",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        onClosing: () {},
      ),
    );
  }
}
