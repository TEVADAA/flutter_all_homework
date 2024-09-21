import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarePage(),
    );
  }
}

class CarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will go back to the previous screen
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Ensures the title stays centered
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue, // Background color for the image
                borderRadius: BorderRadius.circular(35), // Rounded corners
              ),
              padding: const EdgeInsets.all(5), // Padding around the image
              child: const Image(
                image: AssetImage('images/care.png'),
                height: 30, // Adjust height as needed
              ),
            ),
            const SizedBox(width: 12),
            const Text("Care"),
          ],
        ),
        centerTitle: true, // Ensures the title stays centered
        actions: [
          IconButton(
            onPressed: () {
              // Shopping cart action here
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(),
            const SizedBox(height: 8),
            CategoryTabs(),
            const SizedBox(height: 8),
            Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search",
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class CategoryTabs extends StatefulWidget {
  @override
  _CategoryTabsState createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  final List<String> categories = [
    "Baby & Kids",
    "Body",
    "Teeth & Mouth",
    "Face"
  ];

  int selectedCategoryIndex = 0; // Track selected category

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Tab height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: selectedCategoryIndex == index, // Highlight selected
              selectedColor: Colors.blue, // Color when selected
              backgroundColor: Colors.white, // Default color
              labelStyle: TextStyle(
                color: selectedCategoryIndex == index
                    ? Colors.white
                    : Colors.black, // Text color when selected
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: selectedCategoryIndex == index
                      ? Colors.blue
                      : Colors.grey, // Border color when selected/unselected
                ),
              ),
              onSelected: (isSelected) {
                setState(() {
                  selectedCategoryIndex = index;
                  // You can add any logic here to filter products based on the selected category.
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products = [
    Product("Baby diapers", "Pampers", "\$20", "", "images/baby-diapers.png"),
    Product("Wet wipes", "Huggies", "\$5", "", "images/wet-wipes.webp"),
    Product(
        "Gentle shampoo", "Mustela", "\$8", "", "images/gentle-shampoo.webp"),
    Product(
        "Body Wash & Shampoo", "Weleda", "\$5", "", "images/body_wash.webp"),
    Product("Extra Care Diapers", "Huggies", "\$35", "",
        "images/extra-care-diapers.png"),
    Product("Aquaphor Therapy", "Weleda", "\$10", "",
        "images/aquaphor-therapy.webp"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 6,
        mainAxisSpacing: 8,
        childAspectRatio:
            0.7, // Controls the height-to-width ratio of each item
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class Product {
  final String name;
  final String brand;
  final String price;
  final String description;
  final String imageUrl;

  Product(this.name, this.brand, this.price, this.description, this.imageUrl);
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4, // Adds shadow effect to the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              // Center the image
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit
                    .contain, // Makes the image fit within the space, keeping its aspect ratio
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.brand,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(product.description, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.price,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart,
                          color: Colors.blue),
                      onPressed: () {
                        // Handle add to cart action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
