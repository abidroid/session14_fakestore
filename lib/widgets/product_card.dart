

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:session14_fakestore/models/product.dart';

TextStyle txtStyle = const TextStyle(fontSize: 20, color: Colors.white);


class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  product.image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title!.substring(10), style: txtStyle),
                  Text(product.price.toString(), style: txtStyle,),
                  Text('Reviews ${product.rating!.count!.toString()}', style: txtStyle,),
                  Text('Rating ${product.rating!.rate}', style: txtStyle,),

                  Text(product.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: txtStyle,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
