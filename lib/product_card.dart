import 'package:flutter/material.dart';
import 'product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(product.imageAsset, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text("Rp ${product.price.toStringAsFixed(0)}"),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onAddToCart,
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3E0F)),
            child: const Text("Beli", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

