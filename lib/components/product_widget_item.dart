import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:riverpodecomm/model/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel model;
  final Function setFavorite;
  final Function setBasket;

  const ProductWidget(
      {Key? key,
      required this.model,
      required this.setFavorite,
      required this.setBasket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: 10.allBR),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: 10.allBR,
                child: Image.network(model.imagePath),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        model.description,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        model.price.toString() + ' \$',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Divider(),
                      SizedBox(height: MediaQuery.of(context).size.height * .1),
                      GrockContainer(
                        onTap: () => setBasket(),
                        padding: 3.verticalP,
                        decoration: BoxDecoration(
                          borderRadius: 10.allBR,
                          border: Border.all(color: Colors.blue),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CupertinoIcons.bag_badge_plus),
                            SizedBox(width: 5),
                            Text(
                              'Add to bag',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GrockContainer(
              onTap: () => setFavorite(),
              padding: 3.allP,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 0.5, color: Colors.grey.shade300),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                    )
                  ]),
              child: Icon(
                model.isFavorite
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: model.isFavorite ? Colors.red : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
