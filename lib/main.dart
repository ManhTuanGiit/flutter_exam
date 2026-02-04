import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

// ==================== MODEL ====================
/// Model class đại diện cho một địa điểm du lịch với thông tin đầy đủ
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
  
  // Thông tin liên hệ
  final String phoneNumber;
  final String email;
  final String address;
  final String googleMapsUrl;
  
  // Thông tin chi tiết
  final String openingHours;
  final List<String> suitableFor; // Family, Couples, Solo travelers, Groups
  final List<String> nearbyAttractions; // Các địa điểm gần đó
  final Map<String, int> priceBreakdown; // {accommodation: 100, food: 50, activities: 30}
  final List<String> facilities; // WiFi, Parking, Restaurant, etc.

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
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.googleMapsUrl,
    required this.openingHours,
    required this.suitableFor,
    required this.nearbyAttractions,
    required this.priceBreakdown,
    required this.facilities,
  });
}

/// Model class cho booking
class Booking {
  final String id;
  final Destination destination;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfPeople;
  final String specialRequests;
  final DateTime bookingDate;

  Booking({
    required this.id,
    required this.destination,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfPeople,
    required this.specialRequests,
    required this.bookingDate,
  });

  int get numberOfDays => checkOutDate.difference(checkInDate).inDays;
  double get totalCost => numberOfDays * destination.avgCost.toDouble();
}

// Global list để lưu bookings (trong app thực tế dùng database)
List<Booking> allBookings = [];

// Global set để lưu favorite destination IDs
Set<String> favoriteDestinationIds = {};

// ==================== HARDCODED DATA ====================
/// Dữ liệu mẫu 10 địa điểm du lịch được hardcode với thông tin đầy đủ
final List<Destination> allDestinations = [
  Destination(
    id: '1',
    name: 'Bali Paradise Beach Resort',
    city: 'Bali',
    country: 'Indonesia',
    categories: ['Beach', 'Culture', 'Adventure'],
    imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800',
    rating: 4.8,
    priceLevel: '\$\$',
    avgCost: 80,
    description: 'Bali is known for its stunning beaches, vibrant culture, and amazing surfing spots. Experience the perfect blend of relaxation and adventure in this tropical paradise.',
    activities: ['Surfing', 'Temple visits', 'Yoga retreats', 'Snorkeling', 'Traditional dance shows'],
    phoneNumber: '+62 361 730361',
    email: 'info@baliparadise.com',
    address: 'Jl. Pantai Kuta No. 88, Kuta, Badung, Bali 80361, Indonesia',
    googleMapsUrl: 'https://maps.google.com/?q=-8.718464,115.168876',
    openingHours: '24/7 - Check-in: 2 PM, Check-out: 12 PM',
    suitableFor: ['Couples', 'Families', 'Solo travelers'],
    nearbyAttractions: ['Tanah Lot Temple (15 km)', 'Ubud Rice Terraces (25 km)', 'Seminyak Beach (5 km)'],
    priceBreakdown: {'Accommodation': 50, 'Food & Drinks': 20, 'Activities': 10},
    facilities: ['Free WiFi', 'Swimming Pool', 'Spa', 'Restaurant', 'Beach Access', 'Parking'],
  ),
  Destination(
    id: '2',
    name: 'Swiss Alps Mountain Lodge',
    city: 'Zermatt',
    country: 'Switzerland',
    categories: ['Mountain', 'Adventure'],
    imageUrl: 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800',
    rating: 4.9,
    priceLevel: '\$\$\$\$',
    avgCost: 250,
    description: 'The Swiss Alps offer breathtaking mountain views, world-class skiing, and charming alpine villages. Perfect for adventure seekers and nature lovers.',
    activities: ['Skiing', 'Hiking', 'Mountain biking', 'Cable car rides', 'Alpine photography'],
    phoneNumber: '+41 27 966 8100',
    email: 'reservations@swissalpslodge.ch',
    address: 'Bahnhofstrasse 55, 3920 Zermatt, Switzerland',
    googleMapsUrl: 'https://maps.google.com/?q=46.020651,7.749117',
    openingHours: 'Dec - Apr: 7 AM - 10 PM | May - Nov: 8 AM - 8 PM',
    suitableFor: ['Adventure seekers', 'Families', 'Groups'],
    nearbyAttractions: ['Matterhorn Peak (3 km)', 'Gornergrat Railway (2 km)', 'Glacier Paradise (8 km)'],
    priceBreakdown: {'Accommodation': 180, 'Food & Drinks': 50, 'Ski Pass': 20},
    facilities: ['Ski Storage', 'Sauna', 'Restaurant', 'WiFi', 'Mountain View', 'Ski-in/Ski-out'],
  ),
  Destination(
    id: '3',
    name: 'Tokyo City Experience Hotel',
    city: 'Tokyo',
    country: 'Japan',
    categories: ['City', 'Culture', 'Food'],
    imageUrl: 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
    rating: 4.7,
    priceLevel: '\$\$\$',
    avgCost: 150,
    description: 'Tokyo is a vibrant metropolis blending traditional culture with cutting-edge technology. Explore ancient temples, modern skyscrapers, and incredible cuisine.',
    activities: ['Temple visits', 'Sushi making class', 'Shopping in Shibuya', 'Sumo wrestling show', 'Cherry blossom viewing'],
    phoneNumber: '+81 3-5321-8111',
    email: 'contact@tokyoexperience.jp',
    address: '1-1-3 Shinjuku, Shinjuku-ku, Tokyo 160-0022, Japan',
    googleMapsUrl: 'https://maps.google.com/?q=35.689487,139.691711',
    openingHours: '24/7 - Reception available all day',
    suitableFor: ['Solo travelers', 'Couples', 'Culture enthusiasts'],
    nearbyAttractions: ['Senso-ji Temple (5 km)', 'Tokyo Skytree (8 km)', 'Shibuya Crossing (3 km)'],
    priceBreakdown: {'Accommodation': 100, 'Food & Drinks': 35, 'Transport': 15},
    facilities: ['Free WiFi', 'Restaurant', 'Bar', 'Gym', 'Concierge', '24/7 Front Desk'],
  ),
  Destination(
    id: '4',
    name: 'Machu Picchu Adventure Base',
    city: 'Cusco',
    country: 'Peru',
    categories: ['Mountain', 'Culture', 'Adventure'],
    imageUrl: 'https://images.unsplash.com/photo-1587595431973-160d0d94add1?w=800',
    rating: 4.9,
    priceLevel: '\$\$',
    avgCost: 100,
    description: 'Discover the ancient Inca citadel of Machu Picchu, one of the New Seven Wonders of the World. A breathtaking journey through history and stunning landscapes.',
    activities: ['Inca Trail hiking', 'Ruins exploration', 'Local market visits', 'Traditional cuisine tasting', 'Llama encounters'],
    phoneNumber: '+51 84 211234',
    email: 'tours@machupicchu-adventure.pe',
    address: 'Av. El Sol 106, Cusco 08002, Peru',
    googleMapsUrl: 'https://maps.google.com/?q=-13.163141,-72.545128',
    openingHours: '6 AM - 5:30 PM (Last entry 3 PM)',
    suitableFor: ['Adventure seekers', 'History buffs', 'Photographers'],
    nearbyAttractions: ['Sacred Valley (20 km)', 'Cusco Historic Center (75 km)', 'Rainbow Mountain (100 km)'],
    priceBreakdown: {'Accommodation': 40, 'Food': 25, 'Tour Guide': 35},
    facilities: ['Tour Guide', 'Transport', 'Restaurant', 'WiFi', 'Luggage Storage'],
  ),
  Destination(
    id: '5',
    name: 'Maldives Luxury Beach Resort',
    city: 'Malé',
    country: 'Maldives',
    categories: ['Beach'],
    imageUrl: 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800',
    rating: 4.9,
    priceLevel: '\$\$\$\$',
    avgCost: 300,
    description: 'The Maldives offers pristine white sand beaches, crystal-clear turquoise waters, and luxurious overwater bungalows. The ultimate tropical paradise for relaxation.',
    activities: ['Snorkeling', 'Scuba diving', 'Spa treatments', 'Sunset cruises', 'Private beach dining'],
    phoneNumber: '+960 664-0011',
    email: 'luxury@maldivesresort.mv',
    address: 'Medhufushi Island, Meemu Atoll, Maldives',
    googleMapsUrl: 'https://maps.google.com/?q=3.202778,73.220680',
    openingHours: '24/7 - All-inclusive resort',
    suitableFor: ['Couples', 'Honeymooners', 'Luxury travelers'],
    nearbyAttractions: ['Male City (45 km)', 'Banana Reef (30 km)', 'HP Reef (25 km)'],
    priceBreakdown: {'Overwater Villa': 250, 'All-inclusive meals': 30, 'Activities': 20},
    facilities: ['Private Pool', 'Spa', 'Fine Dining', 'Water Sports', 'Butler Service', 'WiFi'],
  ),
  Destination(
    id: '6',
    name: 'Paris Boutique Hotel',
    city: 'Paris',
    country: 'France',
    categories: ['City', 'Culture', 'Food'],
    imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800',
    rating: 4.8,
    priceLevel: '\$\$\$',
    avgCost: 180,
    description: 'The City of Light enchants visitors with its iconic landmarks, world-class museums, and exquisite cuisine. Experience art, history, and romance in every corner.',
    activities: ['Eiffel Tower visit', 'Louvre Museum tour', 'Seine River cruise', 'French pastry tasting', 'Montmartre exploration'],
    phoneNumber: '+33 1 42 60 34 56',
    email: 'bonjour@parisboutique.fr',
    address: '12 Rue de Rivoli, 75004 Paris, France',
    googleMapsUrl: 'https://maps.google.com/?q=48.856613,2.352222',
    openingHours: '24/7 - Check-in: 3 PM, Check-out: 11 AM',
    suitableFor: ['Couples', 'Art lovers', 'Foodies'],
    nearbyAttractions: ['Eiffel Tower (3 km)', 'Louvre Museum (1 km)', 'Notre-Dame (800 m)'],
    priceBreakdown: {'Accommodation': 120, 'Food & Wine': 40, 'Museum tickets': 20},
    facilities: ['WiFi', 'Breakfast', 'Bar', 'Concierge', 'Room Service', 'City View'],
  ),
  Destination(
    id: '7',
    name: 'Serengeti Safari Lodge',
    city: 'Arusha',
    country: 'Tanzania',
    categories: ['Adventure', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=800',
    rating: 4.8,
    priceLevel: '\$\$\$',
    avgCost: 200,
    description: 'Witness the Great Migration and experience incredible wildlife encounters in the vast plains of the Serengeti. An unforgettable African safari adventure.',
    activities: ['Game drives', 'Hot air balloon safari', 'Maasai village visit', 'Wildlife photography', 'Camping under the stars'],
    phoneNumber: '+255 27 254 4595',
    email: 'safari@serengeti-lodge.tz',
    address: 'Seronera, Serengeti National Park, Tanzania',
    googleMapsUrl: 'https://maps.google.com/?q=-2.333333,34.833333',
    openingHours: '24/7 - Safari tours: 6 AM - 6 PM',
    suitableFor: ['Adventure seekers', 'Families', 'Wildlife enthusiasts'],
    nearbyAttractions: ['Ngorongoro Crater (140 km)', 'Olduvai Gorge (90 km)', 'Lake Victoria (200 km)'],
    priceBreakdown: {'Lodge': 120, 'Safari tours': 60, 'Meals': 20},
    facilities: ['Game Drive', 'Restaurant', 'Bar', 'Pool', 'WiFi', 'Safari Guide'],
  ),
  Destination(
    id: '8',
    name: 'Bangkok Street Food Hotel',
    city: 'Bangkok',
    country: 'Thailand',
    categories: ['City', 'Food', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
    rating: 4.6,
    priceLevel: '\$',
    avgCost: 50,
    description: 'Bangkok is a food lover\'s paradise with incredible street food, ornate temples, and bustling markets. Experience authentic Thai culture and flavors.',
    activities: ['Street food tours', 'Temple hopping', 'Floating market visit', 'Thai cooking class', 'Traditional Thai massage'],
    phoneNumber: '+66 2 234 5678',
    email: 'hello@bangkokstreetfood.th',
    address: '123 Sukhumvit Soi 11, Khlong Toei Nuea, Bangkok 10110, Thailand',
    googleMapsUrl: 'https://maps.google.com/?q=13.756331,100.501762',
    openingHours: '24/7 - Tours available 8 AM - 10 PM',
    suitableFor: ['Foodies', 'Solo travelers', 'Budget travelers'],
    nearbyAttractions: ['Grand Palace (5 km)', 'Wat Pho (6 km)', 'Chatuchak Market (10 km)'],
    priceBreakdown: {'Accommodation': 25, 'Street food': 15, 'Transport': 10},
    facilities: ['WiFi', 'Rooftop Bar', 'Tour Desk', 'Laundry', '24/7 Reception'],
  ),
  Destination(
    id: '9',
    name: 'New York Manhattan Hotel',
    city: 'New York',
    country: 'USA',
    categories: ['City', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=800',
    rating: 4.7,
    priceLevel: '\$\$\$\$',
    avgCost: 250,
    description: 'The Big Apple offers endless entertainment, world-famous landmarks, Broadway shows, and diverse culinary experiences. The city that never sleeps awaits.',
    activities: ['Statue of Liberty tour', 'Broadway show', 'Central Park stroll', 'Museum visits', 'Times Square exploration'],
    phoneNumber: '+1 212-555-0199',
    email: 'reservations@nymanhattan.com',
    address: '350 5th Avenue, New York, NY 10118, USA',
    googleMapsUrl: 'https://maps.google.com/?q=40.748817,-73.985428',
    openingHours: '24/7 - Check-in: 3 PM, Check-out: 12 PM',
    suitableFor: ['Culture enthusiasts', 'Families', 'Business travelers'],
    nearbyAttractions: ['Empire State Building (200 m)', 'Times Square (1 km)', 'Central Park (2 km)'],
    priceBreakdown: {'Accommodation': 200, 'Food': 30, 'Broadway ticket': 20},
    facilities: ['WiFi', 'Gym', 'Rooftop Bar', 'Concierge', 'Business Center', 'Restaurant'],
  ),
  Destination(
    id: '10',
    name: 'Santorini Caldera View Resort',
    city: 'Santorini',
    country: 'Greece',
    categories: ['Beach', 'Culture'],
    imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=800',
    rating: 4.9,
    priceLevel: '\$\$\$',
    avgCost: 170,
    description: 'Famous for its stunning sunsets, white-washed buildings, and blue-domed churches. Santorini is a romantic Greek island paradise.',
    activities: ['Sunset watching in Oia', 'Wine tasting', 'Beach hopping', 'Ancient ruins visit', 'Greek cuisine tasting'],
    phoneNumber: '+30 22860 71234',
    email: 'info@santorini-caldera.gr',
    address: 'Oia, Santorini 84702, Greece',
    googleMapsUrl: 'https://maps.google.com/?q=36.461204,25.375216',
    openingHours: 'Apr - Oct: 24/7 | Nov - Mar: Limited services',
    suitableFor: ['Couples', 'Honeymooners', 'Photographers'],
    nearbyAttractions: ['Red Beach (12 km)', 'Akrotiri Archaeological Site (15 km)', 'Fira Town (10 km)'],
    priceBreakdown: {'Cave Suite': 120, 'Breakfast': 25, 'Wine tour': 25},
    facilities: ['Infinity Pool', 'Caldera View', 'Restaurant', 'WiFi', 'Spa', 'Sunset Terrace'],
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
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
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
  bool _showOnlyFavorites = false; // Filter để chỉ hiển thị favorites

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
  /// Search -> Filter (AND logic) -> Favorites -> Sort
  List<Destination> get _filteredAndSortedDestinations {
    // Tạo copy để không mutate list gốc
    List<Destination> results = List.from(allDestinations);

    // 1. Apply search filter (case-insensitive) - chạy trước
    if (_searchQuery.isNotEmpty) {
      results = results.where((destination) {
        final query = _searchQuery.toLowerCase();
        return destination.name.toLowerCase().contains(query) ||
            destination.city.toLowerCase().contains(query) ||
            destination.country.toLowerCase().contains(query);
      }).toList();
    }

    // 2. Apply category filter với AND logic (chạy sau search)
    // Destination phải chứa TẤT CẢ categories được chọn
    if (_selectedCategories.isNotEmpty) {
      results = results.where((destination) {
        // Sử dụng every thay vì any để kiểm tra tất cả categories đã chọn
        return _selectedCategories.every(
          (selectedCat) => destination.categories.contains(selectedCat)
        );
      }).toList();
    }

    // 3. Apply favorites filter (nếu được bật)
    if (_showOnlyFavorites) {
      results = results.where((destination) {
        return favoriteDestinationIds.contains(destination.id);
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
        title: const Text(
          'Find a Destination',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer,
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${allBookings.length}'),
              isLabelVisible: allBookings.isNotEmpty,
              child: const Icon(Icons.bookmark),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookingsListScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar với gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search destinations, cities...',
                prefixIcon: const Icon(Icons.search, color: Colors.deepOrange),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Category filter chips với Favorite button
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // Favorite filter button
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _showOnlyFavorites ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: _showOnlyFavorites ? Colors.red : null,
                        ),
                        const SizedBox(width: 4),
                        const Text('Favorites'),
                        if (favoriteDestinationIds.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Text(
                                '${favoriteDestinationIds.length}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    selected: _showOnlyFavorites,
                    onSelected: (selected) {
                      setState(() {
                        _showOnlyFavorites = selected;
                      });
                    },
                  ),
                ),
                // Category chips
                ..._allCategories.map((category) {
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
              ],
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
                        onFavoriteToggle: () {
                          setState(() {}); // Refresh để update UI
                        },
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
                          onFavoriteToggle: () {
                            setState(() {}); // Refresh để update UI
                          },
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

/// Widget hiển thị một địa điểm dưới dạng Card với UI đẹp hơn
class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback? onFavoriteToggle;

  const DestinationCard({
    super.key,
    required this.destination,
    this.onFavoriteToggle,
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
            // Hero animation cho ảnh với badge
            Stack(
              children: [
                Hero(
                  tag: 'destination-${destination.id}',
                  child: Image.network(
                    destination.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.grey[300]!, Colors.grey[400]!],
                          ),
                        ),
                        child: const Icon(Icons.image_not_supported, size: 50),
                      );
                    },
                  ),
                ),
                // Rating badge ở góc trên phải
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          destination.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Favorite button - có thể toggle trực tiếp
                Positioned(
                  top: 12,
                  left: 12,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        final isFavorite = favoriteDestinationIds.contains(destination.id);
                        if (isFavorite) {
                          favoriteDestinationIds.remove(destination.id);
                        } else {
                          favoriteDestinationIds.add(destination.id);
                        }
                        // Trigger callback để parent refresh
                        onFavoriteToggle?.call();
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          favoriteDestinationIds.contains(destination.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20,
                          color: favoriteDestinationIds.contains(destination.id)
                              ? Colors.red
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
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
                  // Tên địa điểm
                  Text(
                    destination.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  
                  // Thành phố, quốc gia
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${destination.city}, ${destination.country}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Category chips mini
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: destination.categories.take(2).map((category) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  
                  // Price với gradient background
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primaryContainer,
                              Theme.of(context).colorScheme.secondaryContainer,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '\$${destination.avgCost}/day',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        destination.priceLevel,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildContactRow(BuildContext context, IconData icon, String text, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            if (onTap != null)
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Đồng bộ favorite state từ global Set
    final isFavorite = favoriteDestinationIds.contains(widget.destination.id);
    
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

                  // Action buttons với style cố định để tránh text wrap
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (isFavorite) {
                                favoriteDestinationIds.remove(widget.destination.id);
                              } else {
                                favoriteDestinationIds.add(widget.destination.id);
                              }
                            });
                            _showSnackBar(
                              !isFavorite
                                  ? 'Added to favorites!'
                                  : 'Removed from favorites',
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(0, 46),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                            size: 18,
                          ),
                          label: const Text(
                            'Favorite',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showSnackBar('Share feature coming soon!');
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(0, 46),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.share, size: 18),
                          label: const Text(
                            'Share',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _showSnackBar('Opening Google Maps...\n${widget.destination.googleMapsUrl}');
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(0, 46),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.map, size: 18),
                          label: const Text(
                            'Map',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
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

                  // Contact Information Section
                  Text(
                    'Contact Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        _buildContactRow(
                          context,
                          Icons.phone,
                          widget.destination.phoneNumber,
                          () => _showSnackBar('Calling ${widget.destination.phoneNumber}...'),
                        ),
                        const Divider(height: 24),
                        _buildContactRow(
                          context,
                          Icons.email,
                          widget.destination.email,
                          () => _showSnackBar('Opening email...'),
                        ),
                        const Divider(height: 24),
                        _buildContactRow(
                          context,
                          Icons.location_on,
                          widget.destination.address,
                          () => _showSnackBar('Opening Google Maps...'),
                        ),
                        const Divider(height: 24),
                        _buildContactRow(
                          context,
                          Icons.access_time,
                          widget.destination.openingHours,
                          null,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Price Breakdown Section
                  Text(
                    'Price Breakdown',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        ...widget.destination.priceBreakdown.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '\$${entry.value}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        const Divider(),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total per day',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${widget.destination.avgCost}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Suitable For Section
                  Text(
                    'Suitable For',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.destination.suitableFor.map((type) {
                      IconData icon;
                      switch (type) {
                        case 'Couples':
                          icon = Icons.favorite;
                          break;
                        case 'Families':
                          icon = Icons.family_restroom;
                          break;
                        case 'Solo travelers':
                          icon = Icons.person;
                          break;
                        case 'Groups':
                          icon = Icons.groups;
                          break;
                        case 'Adventure seekers':
                          icon = Icons.terrain;
                          break;
                        case 'Business travelers':
                          icon = Icons.business_center;
                          break;
                        default:
                          icon = Icons.check_circle;
                      }
                      return Chip(
                        avatar: Icon(icon, size: 18),
                        label: Text(type),
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Facilities Section
                  Text(
                    'Facilities & Amenities',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.5,
                    children: widget.destination.facilities.map((facility) {
                      IconData icon;
                      switch (facility) {
                        case 'Free WiFi':
                        case 'WiFi':
                          icon = Icons.wifi;
                          break;
                        case 'Swimming Pool':
                        case 'Pool':
                        case 'Infinity Pool':
                          icon = Icons.pool;
                          break;
                        case 'Spa':
                          icon = Icons.spa;
                          break;
                        case 'Restaurant':
                        case 'Fine Dining':
                          icon = Icons.restaurant;
                          break;
                        case 'Parking':
                          icon = Icons.local_parking;
                          break;
                        case 'Gym':
                          icon = Icons.fitness_center;
                          break;
                        case 'Bar':
                        case 'Rooftop Bar':
                          icon = Icons.local_bar;
                          break;
                        case 'Beach Access':
                          icon = Icons.beach_access;
                          break;
                        default:
                          icon = Icons.check_circle_outline;
                      }
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                facility,
                                style: const TextStyle(fontSize: 11),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Nearby Attractions Section
                  Text(
                    'Nearby Attractions',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.destination.nearbyAttractions.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                widget.destination.nearbyAttractions[index],
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
      // Floating Book Now button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(destination: widget.destination),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            icon: const Icon(Icons.calendar_month, size: 24),
            label: const Text(
              'Book Now',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== BOOKING SCREEN ====================
class BookingScreen extends StatefulWidget {
  final Destination destination;

  const BookingScreen({super.key, required this.destination});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _numberOfPeople = 2;
  final TextEditingController _specialRequestsController = TextEditingController();

  @override
  void dispose() {
    _specialRequestsController.dispose();
    super.dispose();
  }

  Future<void> _selectCheckInDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _checkInDate = picked;
        // Reset checkout nếu nó trước checkin
        if (_checkOutDate != null && _checkOutDate!.isBefore(_checkInDate!)) {
          _checkOutDate = null;
        }
      });
    }
  }

  Future<void> _selectCheckOutDate() async {
    if (_checkInDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select check-in date first')),
      );
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _checkInDate!.add(const Duration(days: 1)),
      firstDate: _checkInDate!.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _checkOutDate = picked;
      });
    }
  }

  void _confirmBooking() {
    if (_checkInDate == null || _checkOutDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select check-in and check-out dates')),
      );
      return;
    }

    final booking = Booking(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      destination: widget.destination,
      checkInDate: _checkInDate!,
      checkOutDate: _checkOutDate!,
      numberOfPeople: _numberOfPeople,
      specialRequests: _specialRequestsController.text,
      bookingDate: DateTime.now(),
    );

    setState(() {
      allBookings.add(booking);
    });

    // Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green[600], size: 32),
            const SizedBox(width: 12),
            const Text('Booking Confirmed!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Destination: ${widget.destination.name}'),
            const SizedBox(height: 8),
            Text('Check-in: ${_checkInDate!.day}/${_checkInDate!.month}/${_checkInDate!.year}'),
            Text('Check-out: ${_checkOutDate!.day}/${_checkOutDate!.month}/${_checkOutDate!.year}'),
            Text('Guests: $_numberOfPeople'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Cost:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${booking.totalCost.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to detail screen
              Navigator.of(context).pop(); // Go back to list screen
            },
            child: const Text('View Bookings'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = _checkInDate != null && _checkOutDate != null
        ? _checkOutDate!.difference(_checkInDate!).inDays
        : 0;
    final totalCost = days * widget.destination.avgCost.toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Your Trip'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Destination info card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.destination.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.destination.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${widget.destination.city}, ${widget.destination.country}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star, size: 16, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(widget.destination.rating.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Date selection
            Text(
              'Select Dates',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _selectCheckInDate,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Check-in',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                _checkInDate != null
                                    ? '${_checkInDate!.day}/${_checkInDate!.month}/${_checkInDate!.year}'
                                    : 'Select date',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: _selectCheckOutDate,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Check-out',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                _checkOutDate != null
                                    ? '${_checkOutDate!.day}/${_checkOutDate!.month}/${_checkOutDate!.year}'
                                    : 'Select date',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Number of people
            Text(
              'Number of Guests',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.person_outline, size: 24),
                      SizedBox(width: 12),
                      Text(
                        'Guests',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_numberOfPeople > 1) {
                            setState(() {
                              _numberOfPeople--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        _numberOfPeople.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_numberOfPeople < 10) {
                            setState(() {
                              _numberOfPeople++;
                            });
                          }
                        },
                        icon: const Icon(Icons.add_circle_outline),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Special requests
            Text(
              'Special Requests (Optional)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _specialRequestsController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Any special requests or preferences...',
              ),
            ),

            const SizedBox(height: 24),

            // Price summary
            if (days > 0)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.secondaryContainer,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price per night:'),
                        Text('\$${widget.destination.avgCost}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Number of nights:'),
                        Text('$days nights'),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${totalCost.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 24),

            // Confirm button
            ElevatedButton(
              onPressed: _confirmBooking,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Confirm Booking',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ==================== BOOKINGS LIST SCREEN ====================
class BookingsListScreen extends StatefulWidget {
  const BookingsListScreen({super.key});

  @override
  State<BookingsListScreen> createState() => _BookingsListScreenState();
}

class _BookingsListScreenState extends State<BookingsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        elevation: 0,
      ),
      body: allBookings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No bookings yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: allBookings.length,
              itemBuilder: (context, index) {
                final booking = allBookings[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                booking.destination.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.image),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking.destination.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${booking.destination.city}, ${booking.destination.country}',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              '${booking.checkInDate.day}/${booking.checkInDate.month}/${booking.checkInDate.year} - ${booking.checkOutDate.day}/${booking.checkOutDate.month}/${booking.checkOutDate.year}',
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 16),
                            const SizedBox(width: 8),
                            Text('${booking.numberOfPeople} guests'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${booking.numberOfDays} nights',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              '\$${booking.totalCost.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
