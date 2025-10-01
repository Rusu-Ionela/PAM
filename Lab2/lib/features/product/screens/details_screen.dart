import 'package:flutter/material.dart';
import '../../../data/product.dart' as model;
import '../../../data/mock_products.dart' as mock;
import '../../home/widgets/product_card.dart' as widgets;
import '../../home/widgets/rating_stars.dart';

class DetailsScreen extends StatefulWidget {
  final model.Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _imageIndex = 0;
  String _selectedSize = 'M';
  String _selectedColor = 'Black';

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final images = p.images ?? [p.imageUrl, p.imageUrl];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        title: const Text(
          'Short dress',
          style: TextStyle(color: Color(0xFF222222)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF222222)),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDB3022),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 4,
              shadowColor: const Color(0x3FD32525),
            ),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Added to cart')));
            },
            child: const Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Galerie
          SizedBox(
            height: 413,
            child: PageView.builder(
              onPageChanged: (i) => setState(() => _imageIndex = i),
              itemCount: images.length,
              // după
              itemBuilder: (_, i) => Image.asset(
                images[i],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // indicator bară
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: i == _imageIndex ? 24 : 8,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFF222222),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          // Titlu / Preț
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    p.brand,
                    style: const TextStyle(
                      color: Color(0xFF222222),
                    ), // 24, 400, h:1.2
                  ),
                ),
                Text(
                  '\$${p.price.toStringAsFixed(p.price % 1 == 0 ? 0 : 2)}',
                  style: const TextStyle(color: Color(0xFF222222)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              p.title,
              style: const TextStyle(color: Color(0xFF9B9B9B), fontSize: 11),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                RatingStars(rating: p.rating),
                const SizedBox(width: 4),
                Text(
                  '(${p.reviews})',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Size & Color + Favorite
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _SelectorBox(
                  label: 'Size',
                  value: _selectedSize,
                  onTap: () => _pickSize(context),
                ),
                const SizedBox(width: 16),
                _SelectorBox(
                  label: _selectedColor,
                  value: '',
                  onTap: () => _pickColor(context),
                ),
                const Spacer(),
                _FavoriteBubble(onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Descriere
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              p.description ??
                  'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves.',
              style: const TextStyle(
                color: Color(0xFF222222),
                fontSize: 14,
                height: 1.5,
                letterSpacing: -0.15,
              ),
            ),
          ),
          const SizedBox(height: 16),

          const Divider(height: 32, thickness: .4, color: Color(0x409B9B9B)),
          const _ExpandableLine(title: 'Item details'),
          const Divider(height: 32, thickness: .4, color: Color(0x409B9B9B)),
          const _ExpandableLine(title: 'Shipping info'),
          const Divider(height: 32, thickness: .4, color: Color(0x409B9B9B)),
          const _ExpandableLine(title: 'Support'),
          const Divider(height: 32, thickness: .4, color: Color(0x409B9B9B)),

          // You can also like this
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: const [
                Text(
                  'You can also like this',
                  style: TextStyle(fontSize: 18, color: Color(0xFF222222)),
                ),
                Spacer(),
                Text(
                  '12 items',
                  style: TextStyle(fontSize: 11, color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 280,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 8, bottom: 24),
              scrollDirection: Axis.horizontal,
              itemCount: mock.newProducts.length, // <— folosim alias
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, i) => widgets.ProductCard(
                product: mock.newProducts[i],
                width: 150,
                showNewPill: true,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailsScreen(product: mock.newProducts[i]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickSize(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => const _PickerSheet(
        title: 'Choose size',
        options: ['XS', 'S', 'M', 'L', 'XL'],
      ),
    );
    if (result != null) setState(() => _selectedSize = result);
  }

  void _pickColor(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => const _PickerSheet(
        title: 'Choose color',
        options: ['Black', 'White', 'Red', 'Blue'],
      ),
    );
    if (result != null) setState(() => _selectedColor = result);
  }
}

class _SelectorBox extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;
  const _SelectorBox({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 138,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.4,
            color: label == 'Size'
                ? const Color(0xFFF01F0E)
                : const Color(0xFF9B9B9B),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerLeft,
        child: Text(
          value.isEmpty ? label : value,
          style: const TextStyle(
            color: Color(0xFF222222),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _FavoriteBubble extends StatelessWidget {
  final VoidCallback onTap;
  const _FavoriteBubble({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            Icons.favorite_border,
            color: Color(0xFF222222),
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _ExpandableLine extends StatelessWidget {
  final String title;
  const _ExpandableLine({required this.title});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      collapsedBackgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF222222), fontSize: 16),
      ),
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            'Details coming soon.',
            style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _PickerSheet extends StatelessWidget {
  final String title;
  final List<String> options;
  const _PickerSheet({required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          ...options.map(
            (e) => ListTile(
              title: Text(e),
              onTap: () => Navigator.of(context).pop(e),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
