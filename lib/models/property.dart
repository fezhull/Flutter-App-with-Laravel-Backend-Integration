class Property {
  final int id;
  final String name;
  final String address;
  final double price;
  final String description;

  Property({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.description,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'price': price,
      'description': description,
    };
  }
}
