
class Product {
  String id;
  String name;
  String price;
  String image;
  bool isSelected = false;

  Product(this.id, this.name, this.price, this.image);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}