import 'package:flutter/material.dart';
import '../../../data/product.dart';
import 'rating_stars.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double width;
  final bool showDiscountPill;
  final bool showNewPill;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.width = 150,
    this.showDiscountPill = false,
    this.showNewPill = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    String? pillText;
    Color pillColor = const Color(0xFF222222);

    if (showDiscountPill && product.hasDiscount) {
      final percent = (100 - (product.price / product.oldPrice! * 100)).round();
      pillText = '-$percent%';
      pillColor = const Color(0xFFDB3022);
    } else if (showNewPill && product.isNew) {
      pillText = 'NEW';
      pillColor = const Color(0xFF222222);
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: width, // înălțimea e controlată de listă / grid
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGINEA ocupă tot spațiul rămas => nu mai împinge textele în afară
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product.imageUrl, // păstrez proprietatea ta
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  if (pillText != null)
                    Positioned(
                      left: 8,
                      top: 8,
                      child: _Pill(text: pillText!, color: pillColor),
                    ),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.favorite_border, size: 20),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // BRAND – o linie
            Text(
              product.brand,
              style: textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // TITLU – o linie
            Text(
              product.title,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            // RATING – înălțime mică fixă
            SizedBox(
              height: 18,
              child: (product.reviews > 0)
                  ? Row(
                      children: [
                        RatingStars(rating: product.rating),
                        const SizedBox(width: 4),
                        Text(
                          '(${product.reviews})',
                          style: textTheme.labelSmall,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),

            const SizedBox(height: 6),

            // PREȚ – înălțime mică fixă
            SizedBox(
              height: 20,
              child: Row(
                children: [
                  Text(
                    '${product.price.toStringAsFixed(product.price % 1 == 0 ? 0 : 2)}\$',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: product.hasDiscount
                          ? const Color(0xFFDB3022)
                          : const Color(0xFF222222),
                    ),
                  ),
                  if (product.hasDiscount) ...[
                    const SizedBox(width: 6),
                    Text(
                      '${product.oldPrice!.toStringAsFixed(product.oldPrice! % 1 == 0 ? 0 : 2)}\$',
                      style: const TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  final Color color;
  const _Pill({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
