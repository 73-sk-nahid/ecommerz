import 'package:ecommerz/features/product/data/model/review_pagination_model.dart';
import 'package:flutter/material.dart';

class ProductReviewWidget extends StatelessWidget {
  const ProductReviewWidget({
    super.key,
    required this.reviewDataModel,
  });

  final ReviewDataModel reviewDataModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Card(
          elevation: 1,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns content properly
              mainAxisSize: MainAxisSize.min, // Allows the card to adjust height dynamically
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                        reviewDataModel.user?.avatarUrl ??
                            'https://cdn.vectorstock.com/i/1000v/51/05/male-profile-avatar-with-brown-hair-vector-12055105.jpg',
                      ),
                      backgroundColor: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${reviewDataModel.user?.firstName ?? ''} ${reviewDataModel.user?.lastName ?? ''}'
                          .trim(),
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Rating: ${reviewDataModel.rating?.toStringAsFixed(1) ?? "N/A"}',
                      style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 8), // Adds spacing before comment
                Text(
                  reviewDataModel.comment ?? '',
                  style: const TextStyle(color: Colors.grey),
                  maxLines: null, // Allows multiline comments
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
