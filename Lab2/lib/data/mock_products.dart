import 'product.dart';

// -------- SALE ----------
final saleProducts = <Product>[
  Product(
    id: 'p1',
    brand: 'Dorothy Perkins',
    title: 'Evening Dress',
    price: 125,
    oldPrice: 156,
    imageUrl: 'assets/images/eveningdress.png',
    images: [
      'assets/images/eveningdress.png',
      'assets/images/eveningdress.png',
    ],
    description:
        'Elegant evening dress, perfect for special occasions. Comfortable material and stylish cut.',
    rating: 4.5,
    reviews: 10,
  ),
  Product(
    id: 'p2',
    brand: 'Sitlly',
    title: 'Sport Dress',
    price: 195,
    oldPrice: 225,
    imageUrl: 'assets/images/sportdress1.png',
    images: ['assets/images/sportdress1.png', 'assets/images/sportdress2.png'],
    description: 'Casual sport dress, perfect for summer days.',
    rating: 4.0,
    reviews: 8,
  ),
];

// -------- NEW ----------
final newProducts = <Product>[
  Product(
    id: 'n1',
    brand: 'OVS',
    title: 'Blouse',
    price: 30,
    imageUrl: 'assets/images/bluza.png',
    images: ['assets/images/bluza.png'],
    description: 'Light blouse for everyday use.',
    rating: 0,
    reviews: 0,
    isNew: true,
  ),
  Product(
    id: 'n2',
    brand: 'Mango Boy',
    title: 'T-Shirt Sailing',
    price: 10,
    imageUrl: 'assets/images/maiouman.png',
    images: [
      'assets/images/maiouman.png',
      'assets/images/mmm.png', // a doua poză
    ],
    description: 'Casual T-shirt with sailing print.',
    rating: 0,
    reviews: 0,
    isNew: true,
  ),
  Product(
    id: 'n3',
    brand: 'Cool',
    title: 'Jeans',
    price: 45,
    imageUrl: 'assets/images/hmm.png',
    images: [
      'assets/images/hmm.png',
      'assets/images/hmmm.png', // a doua poză
    ],
    description: 'Comfortable jeans, modern fit.',
    rating: 0,
    reviews: 0,
    isNew: true,
  ),
];
