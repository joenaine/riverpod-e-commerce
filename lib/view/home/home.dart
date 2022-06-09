import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpodecomm/components/product_widget_item.dart';
import 'package:riverpodecomm/riverpod/riverpod_management.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);

    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: [20, 15, 20, 0].paddingLTRB,
          child: Text(
            'Products',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
          ),
        ),
        GrockList(
          isExpanded: false,
          shrinkWrap: true,
          padding: [20, 10].horizontalAndVerticalP,
          itemCount: read.products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              model: watch.products[index],
              setFavorite: () => read.setFavorite(watch.products[index]),
              setBasket: () => read.addedCart(watch.products[index]),
            );
          },
        ),
      ],
    ));
  }
}
