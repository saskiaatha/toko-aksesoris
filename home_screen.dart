import 'package:flutter/material.dart';
import 'package:toko_aksesoris/cart_item.dart';
import 'package:toko_aksesoris/cart_screen.dart';
import 'package:toko_aksesoris/product_detail_screen.dart';
import 'product.dart';
import 'product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(name: "Cincin Berlian", price: 25000000, imageAsset: "assets/cincinberlian.jpeg"),
    Product(name: "Gelang Manik", price: 45000, imageAsset: "assets/gelangmanik.jpeg"),
    Product(name: "Anting Emas", price: 250000, imageAsset: "assets/antingemas.jpeg"),
    Product(name: "Kalung Elegan", price: 200000, imageAsset: "assets/kalungelegan.jpeg"),
    Product(name: "Satu Paket Aksesoris", price: 50000000, imageAsset: "assets/satuset.jpeg"),
  ];

  final List<CartItem> cart = [];

  void addToCart(Product product) {
    final index = cart.indexWhere((item) => item.product.name == product.name);
    setState(() {
      if (index != -1) {
        cart[index].quantity++;
      } else {
        cart.add(CartItem(product: product));
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product.name} ditambahkan ke keranjang")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Aksesoris Saski", style: TextStyle(color: Color(0xFF7C3E0F))),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Color(0xFF7C3E0F)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(cartItems: cart),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari aksesoris...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Terpopuler",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7C3E0F)),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(
                          product: products[index],
                          onAddToCart: addToCart,
                        ),
                      ),
                    );
                  },
                  child: ProductCard(
                    product: products[index], 
                    onAddToCart: () => addToCart(products[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF7C3E0F),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

