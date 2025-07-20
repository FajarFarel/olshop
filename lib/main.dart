import 'package:flutter/material.dart';
import 'package:olshop/profile_screen.dart';
import 'home_screen.dart';
import 'cart_screen.dart' as cart;
import 'product.dart';
import 'cart_item.dart';
import 'splashscreen.dart';
import 'login_page.dart';
import 'register_screen.dart';
import 'riwayat_belanja_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aksesoris Saski',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF4E6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
elevation: 0,          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF7C3E0F)),
          titleTextStyle: TextStyle(
            color: Color(0xFF7C3E0F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainNavigation(),
        '/riwayat': (context) => const RiwayatBelanjaScreen(), // Ini nav bar kamu
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Product> _products = [
    Product(name: "Cincin Berlian", price: 25000000, imageAsset: "assets/cincinberlian.jpeg"),
    Product(name: "Gelang Manik", price: 45000, imageAsset: "assets/gelangmanik.jpeg"),
    Product(name: "Anting Emas", price: 250000, imageAsset: "assets/antingemas.jpeg"),
    Product(name: "Kalung Elegan", price: 200000, imageAsset: "assets/kalungelegan.jpeg"),
    Product(name: "Satu Paket Aksesoris", price: 50000000, imageAsset: "assets/satuset.jpeg"),
  ];

  final List<CartItem> _cart = [];

  void _addToCart(Product product) {
    final index = _cart.indexWhere((item) => item.product.name == product.name);
    setState(() {
      if (index != -1) {
        _cart[index].quantity++;
      } else {
        _cart.add(CartItem(product: product));
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product.name} ditambahkan ke keranjang")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeTab(
        products: _products,
        onAddToCart: _addToCart,
        onOpenCart: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => cart.CartScreen(cartItems: _cart),
            ),
          );
        },
      ),
      cart.CartScreen(cartItems: _cart),
      const ProfileScreen(),
    ];


    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF7C3E0F),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}
