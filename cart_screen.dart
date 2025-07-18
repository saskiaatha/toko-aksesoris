import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartScreen({super.key, required this.cartItems});

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
        total += item.product.price * item.quantity;
      }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = calculateTotal();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Keranjang",
          style: TextStyle(color: Color(0xFF7C3E0F)),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Keranjang kosong",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(
                          item.product.imageAsset,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.product.name),
                        subtitle: Text("Qty: ${item.quantity}"),
                        trailing: Text(
                          "Rp ${item.product.price * item.quantity}",
                          style: const TextStyle(color: Colors.orange),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))
                    ],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rp ${totalPrice.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          // Nanti bisa diarahkan ke halaman konfirmasi pembayaran
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Checkout berhasil!")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3E0F),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Checkout",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
