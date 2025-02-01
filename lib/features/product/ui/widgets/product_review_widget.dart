import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class ProductReviewWidget extends StatelessWidget {
  const ProductReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          color: Colors.white70,
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.perm_identity, size: 24,),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Sk. Nahid',
                    style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                loremIpsum(words: 20, paragraphs: 1),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
