import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpodecomm/components/product_widget_item.dart';
import 'package:riverpodecomm/riverpod/riverpod_management.dart';

class Favourite extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);

    return Scaffold(
        body: product.favorites.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Empty'),
                    OutlinedButton(
                        onPressed: () {
                          ref.read(bottomNavBarRiverpod).setCurrentIndex(0);
                        },
                        child: const Text('Go Home'))
                  ],
                ),
              )
            : ListView(
                children: [
                  Padding(
                    padding: [20, 15, 20, 0].paddingLTRB,
                    child: Text(
                      'Favorites',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  GrockList(
                    isExpanded: false,
                    shrinkWrap: true,
                    padding: [20, 10].horizontalAndVerticalP,
                    itemCount: product.favorites.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        model: product.favorites[index],
                        setFavorite: () =>
                            product.setFavorite(product.favorites[index]),
                        setBasket: () =>
                            product.addedCart(product.products[index]),
                      );
                    },
                  ),
                ],
              ));
  }
}
