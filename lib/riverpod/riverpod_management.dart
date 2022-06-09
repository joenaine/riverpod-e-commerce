import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodecomm/components/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpodecomm/riverpod/product_riverpod.dart';
import 'package:riverpodecomm/view/favourite/riverpod/favorite_riverpod.dart';

final bottomNavBarRiverpod =
    ChangeNotifierProvider((_) => BottomNavBarRiverpod());

final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());
final favoriteRiverpod = ChangeNotifierProvider((_) => FavoriteRiverpod());
