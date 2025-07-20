import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  String getProductDescription(String name) {
    switch (name) {
      case "Cincin Berlian":
        return "Cincin berlian mewah yang memancarkan keanggunan dan kemewahan. Cocok untuk acara formal dan hadiah spesial.";
      case "Gelang Manik":
        return "Gelang manik warna-warni dengan desain playful dan modern. Cocok untuk tampilan kasual sehari-hari.";
      case "Anting Emas":
        return "Anting emas elegan dengan sentuhan klasik, menambah pesona pada setiap penampilanmu.";
      case "Kalung Elegan":
        return "Kalung dengan desain elegan dan mewah, cocok untuk dipakai saat acara formal atau pesta malam.";
      case "Satu Paket Aksesoris":
        return "Paket lengkap berisi cincin, gelang, kalung, dan anting yang serasi. Pilihan sempurna untuk melengkapi gaya harianmu.";
      default:
        return "Aksesoris elegan dan modern untuk mempercantik penampilanmu. Dibuat dengan bahan berkualitas.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final description = getProductDescription(product.name);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF7C3E0F)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            product.imageAsset,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7C3E0F),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Rp ${product.price.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 20, color: Colors.orange),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Deskripsi Produk:\n$description",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                onAddToCart(product);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C3E0F),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Tambah ke Keranjang",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
