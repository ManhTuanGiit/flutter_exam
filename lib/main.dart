import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

// ==================== MODEL ====================
/// Model class đại diện cho một địa điểm du lịch
class Destination {
  final String id;
  final String name;
  final String city;
  final String country;
  final List<String> categories;
  final String imageUrl;
  final double rating;
  final String priceLevel; // $ | $$ | $$$ | $$$$
  final int avgCost; // Average cost per day in USD
  final String description;
  final List<String> activities;

  Destination({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.categories,
    required this.imageUrl,
    required this.rating,
    required this.priceLevel,
    required this.avgCost,
    required this.description,
    required this.activities,
  });
}

// ==================== HARDCODED DATA ====================
/// Dữ liệu mẫu 10 địa điểm du lịch được hardcode
final List<Destination> allDestinations = [
  Destination(
    id: '1',
    name: 'Bali Paradise Beach',
    city: 'Bali',
    country: 'Indonesia',
    categories: ['Beach', 'Culture', 'Adventure'],
    imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800',
    rating: 4.8,
    priceLevel: '\$\$',
    avgCost: 80,
    description: 'Bali is known for its stunning beaches, vibrant culture, and amazing surfing spots. Experience the perfect blend of relaxation and adventure in this tropical paradise.',
    activities: ['Surfing', 'Temple visits', 'Yoga retreats', 'Snorkeling', 'Traditional dance shows'],
  ),
  Destination(
    id: '2',
    name: 'Swiss Alps Adventure',
    city: 'Zermatt',
    country: 'Switzerland',
    categories: ['Mountain', 'Adventure'],
    imageUrl: 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800',
    rating: 4.9,
    priceLevel: '\$\$\$\$',
    avgCost: 250,
    description: 'The Swiss Alps offer breathtaking mountain views, world-class skiing, and charming alpine villages. Perfect for adventure seekers and nature lovers.',
    activities: ['Skiing', 'Hiking', 'Mountain biking', 'Cable car rides', 'Alpine photography'],
  ),
  Destination(
    id: '3',
    name: 'Tokyo City Lights',
    city: 'Tokyo',
    country: 'Japan',
    categories: ['City', 'Culture', 'Food'],
    imageUrl: 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
    rating: 4.7,
    priceLevel: '\$\$\$',
    avgCost: 150,
    description: 'Tokyo is a vibrant metropolis blending traditional culture with cutting-edge technology. Explore ancient temples, modern skyscrapers, and incredible cuisine.',
    activities: ['Temple visits', 'Sushi making class', 'Shopping in Shibuya', 'Sumo wrestling show', 'Cherry blossom viewing'],
  ),
  Destination(
    id: '4',
    name: 'Machu Picchu Trek',
    city: 'Cusco',
    country: 'Peru',
    categories: ['Mountain', 'Culture', 'Adventure'],
    imageUrl: 'https://images.unsplash.com/photo-1587595431973-160d0d94add1?w=800',
    rating: 4.9,
    priceLevel: '\$\$',
    avgCost: 100,
    description: 'Discover the ancient Inca citadel of Machu Picchu, one of the New Seven Wonders of the World. A breathtaking journey through history and stunning landscapes.',
    activities: ['Inca Trail hiking', 'Ruins exploration', 'Local market visits', 'Traditional cuisine tasting', 'Llama encounters'],
  ),
  Destination(
    id: '5',
    name: 'Maldives Luxury Resort',
    city: 'Malé',
    country: 'Maldives',
    categories: ['Beach'],
    imageUrl: 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800',
    rating: 4.9,
    priceLevel: '\$\$\$\$',
    avgCost: 300,
    description: 'The Maldives offers pristine white sand beaches, crystal-clear turquoise waters, and luxurious overwater bungalows. The ultimate tropical paradise for relaxation.',
    activities: ['Snorkeling', 'Scuba diving', 'Spa treatments', 'Sunset cruises', 'Private beach dining'],
  ),
  Destination(
    id: '6',
    name: 'Paris Romance',
    city: 'Paris',
    country: 'France',
    categories: ['City', 'Culture', 'Food'],
    imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800',
    rating: 4.8,
    priceLevel: '\$\$\$',
    avgCost: 180,
    description: 'The City of Light enchants visitors with its iconic landmarks, world-class museums, and exquisite cuisine. Experience art, history, and romance in every corner.',
    activities: ['Eiffel Tower visit', 'Louvre Museum tour', 'Seine River cruise', 'French pastry tasting', 'Montmartre exploration'],
  ),
  Destination(
    id: '7',
    name: 'Safari in Serengeti',
    city: 'Arusha',
    country: 'Tanzania',
    categories: ['Adventure', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=800',
    rating: 4.8,
    priceLevel: '\$\$\$',
    avgCost: 200,
    description: 'Witness the Great Migration and experience incredible wildlife encounters in the vast plains of the Serengeti. An unforgettable African safari adventure.',
    activities: ['Game drives', 'Hot air balloon safari', 'Maasai village visit', 'Wildlife photography', 'Camping under the stars'],
  ),
  Destination(
    id: '8',
    name: 'Bangkok Street Food',
    city: 'Bangkok',
    country: 'Thailand',
    categories: ['City', 'Food', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
    rating: 4.6,
    priceLevel: '\$',
    avgCost: 50,
    description: 'Bangkok is a food lover\'s paradise with incredible street food, ornate temples, and bustling markets. Experience authentic Thai culture and flavors.',
    activities: ['Street food tours', 'Temple hopping', 'Floating market visit', 'Thai cooking class', 'Traditional Thai massage'],
  ),
  Destination(
    id: '9',
    name: 'New York City',
    city: 'New York',
    country: 'USA',
    categories: ['City', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=800',
    rating: 4.7,
    priceLevel: '\$\$\$\$',
    avgCost: 250,
    description: 'The Big Apple offers endless entertainment, world-famous landmarks, Broadway shows, and diverse culinary experiences. The city that never sleeps awaits.',
    activities: ['Statue of Liberty tour', 'Broadway show', 'Central Park stroll', 'Museum visits', 'Times Square exploration'],
  ),
  Destination(
    id: '10',
    name: 'Santorini Sunset',
    city: 'Santorini',
    country: 'Greece',
    categories: ['Beach', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=800',
    rating: 4.9,
    priceLevel: '\$\$\$',
    avgCost: 170,
    description: 'Famous for its stunning sunsets, white-washed buildings, and blue-domed churches. Santorini is a romantic Greek island paradise.',
    activities: ['Sunset watching in Oia', 'Wine tasting', 'Beach hopping', 'Ancient ruins visit', 'Greek cuisine tasting'],
  ),
];

// ==================== MAIN APP ====================
class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Destinations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const DestinationListScreen(),
    );
  }
}

// ==================== DESTINATION LIST SCREEN ====================
class DestinationListScreen extends StatefulWidget {
  const DestinationListScreen({super.key});

  @override
  State<DestinationListScreen> createState() => _DestinationListScreenState();
}

class _DestinationListScreenState extends State<DestinationListScreen> {
  // State variables cho search, filter, sort
  String _searchQuery = '';
  final Set<String> _selectedCategories = {};
  String _sortOption = 'Name A-Z'; // Options: Name A-Z, Name Z-A, Rating High to Low, Price Low to High

  // Tất cả các categories có thể có
  final List<String> _allCategories = [
    'Beach',
    'Mountain',
    'City',
    'Culture',
    'Food',
    'Adventure',
  ];

  /// Logic lọc và sắp xếp destinations
  List<Destination> get _filteredAndSortedDestinations {
    List<Destination> results = allDestinations;

    // 1. Apply search filter (case-insensitive)
    if (_searchQuery.isNotEmpty) {
      results = results.where((destination) {
        final query = _searchQuery.toLowerCase();
        return destination.name.toLowerCase().contains(query) ||
            destination.city.toLowerCase().contains(query) ||
            destination.country.toLowerCase().contains(query);
      }).toList();
    }

    // 2. Apply category filter (nếu có category được chọn)
    if (_selectedCategories.isNotEmpty) {
      results = results.where((destination) {
        // Destination phải có ít nhất 1 category trong danh sách đã chọn
        return destination.categories
            .any((cat) => _selectedCategories.contains(cat));
      }).toList();
    }

    // 3. Apply sorting
    switch (_sortOption) {
      case 'Name A-Z':
        results.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Name Z-A':
        results.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 'Rating High to Low':
        results.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Price Low to High':
        results.sort((a, b) => a.avgCost.compareTo(b.avgCost));
        break;
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    final destinations = _filteredAndSortedDestinations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Destination'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search destinations, cities...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Category filter chips
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: _allCategories.map((category) {
                final isSelected = _selectedCategories.contains(category);
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedCategories.add(category);
                        } else {
                          _selectedCategories.remove(category);
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 8),

          // Sort dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text('Sort by: ', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    value: _sortOption,
                    isExpanded: true,
                    items: [
                      'Name A-Z',
                      'Name Z-A',
                      'Rating High to Low',
                      'Price Low to High',
                    ].map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _sortOption = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Responsive list/grid - sử dụng LayoutBuilder để kiểm tra screen width
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Breakpoint 800px để chuyển giữa ListView và GridView
                final isWideScreen = constraints.maxWidth >= 800;

                if (destinations.isEmpty) {
                  return const Center(
                    child: Text(
                      'No destinations found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                if (isWideScreen) {
                  // GridView với 2 cột cho màn hình lớn
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      return DestinationCard(
                        destination: destinations[index],
                      );
                    },
                  );
                } else {
                  // ListView cho màn hình nhỏ
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: DestinationCard(
                          destination: destinations[index],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== DESTINATION CARD ====================
/// Widget hiển thị một địa điểm dưới dạng Card
class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Navigation đến màn hình chi tiết, truyền trực tiếp object destination
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DestinationDetailScreen(
                destination: destination,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero animation cho ảnh
            Hero(
              tag: 'destination-${destination.id}',
              child: Image.network(
                destination.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên địa điểm
                  Text(
                    destination.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  
                  // Thành phố, quốc gia
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${destination.city}, ${destination.country}',
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Rating và Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, size: 18, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            destination.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Text(
                        '${destination.priceLevel} (\$${destination.avgCost}/day)',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== DESTINATION DETAIL SCREEN ====================
class DestinationDetailScreen extends StatefulWidget {
  final Destination destination;

  const DestinationDetailScreen({
    super.key,
    required this.destination,
  });

  @override
  State<DestinationDetailScreen> createState() => _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  bool _isFavorite = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image với gradient overlay
            Stack(
              children: [
                Hero(
                  tag: 'destination-${widget.destination.id}',
                  child: Image.network(
                    widget.destination.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 300,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, size: 80),
                      );
                    },
                  ),
                ),
                // Gradient overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.white, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.destination.city}, ${widget.destination.country}',
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating và Price info
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              widget.destination.rating.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${widget.destination.priceLevel} \$${widget.destination.avgCost}/day',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Category chips sử dụng Wrap để tránh overflow
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.destination.categories.map((category) {
                      return Chip(
                        label: Text(category),
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                            _showSnackBar(
                              _isFavorite
                                  ? 'Added to favorites!'
                                  : 'Removed from favorites',
                            );
                          },
                          icon: Icon(
                            _isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : null,
                          ),
                          label: const Text('Favorite'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showSnackBar('Share feature coming soon!');
                          },
                          icon: const Icon(Icons.share),
                          label: const Text('Share'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showSnackBar('Opening map...');
                          },
                          icon: const Icon(Icons.map),
                          label: const Text('Map'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Description section
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.destination.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Activities section
                  Text(
                    'Popular Activities',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),

                  // ListView của activities - sử dụng shrinkWrap vì nằm trong scroll view
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.destination.activities.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          child: Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        title: Text(widget.destination.activities[index]),
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
