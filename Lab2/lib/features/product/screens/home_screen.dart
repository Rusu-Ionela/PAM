import 'package:flutter/material.dart';

// date mock
import '../../../data/mock_products.dart';

// widgets din home
import '../../home/widgets/hero_banner.dart';
import '../../home/widgets/section_header.dart';
import '../../home/widgets/product_card.dart';

// ecranul de detalii (features/product/screens)
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headlineMedium;
    final body = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            // Banner de sus
            SliverToBoxAdapter(
              child: HeroBanner(
                height: 260,
                title: 'Street clothes',
                // asigură-te că fișierul există sau schimbă cu o imagine existentă
                background: const AssetImage('assets/images/banner.jpg'),
              ),
            ),

            // ——— SALE ———
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Row(
                  children: [
                    Text('Sale', style: headline),
                    const Spacer(),
                    Text(
                      'View all',
                      style: body?.copyWith(color: const Color(0xFF222222)),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Super summer sale', style: body),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 296, // ↑ era 280
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 8,
                    top: 8,
                    bottom: 12, // ↓ era 16
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: saleProducts.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, i) => ProductCard(
                    product: saleProducts[i],
                    width: 150,
                    showDiscountPill: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailsScreen(product: saleProducts[i]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // ——— NEW ———
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'New',
                subtitle: 'You’ve never seen it before!',
                action: 'View all',
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 296, // ↑ era 280
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 8,
                    top: 8,
                    bottom: 12, // ↓ era 24
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: newProducts.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, i) => ProductCard(
                    product: newProducts[i],
                    width: 150,
                    showNewPill: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailsScreen(product: newProducts[i]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
