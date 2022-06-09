import 'package:flutter/cupertino.dart';
import 'package:riverpodecomm/view/basket/basket.dart';
import 'package:riverpodecomm/view/favourite/favourite.dart';
import 'package:riverpodecomm/view/home/home.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart), label: 'Favourites'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bag), label: 'Cart'),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appBarTitle() {
    switch (currentIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Favourites';
      case 2:
        return 'Basket';
      default:
        return 'Home';
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return Favourite();
      case 2:
        return Basket();
      default:
        return const Home();
    }
  }
}
