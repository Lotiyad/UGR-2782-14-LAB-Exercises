class Product {
  String name;
  double price;
  int quantity;

  Product({required this.name, required this.price, required this.quantity});

  
  double calculateTotalCost() {
    return price * quantity;
  }
}

void main() {

  Product product = Product(name: "Laptop", price: 1000, quantity: 2);


  double totalCost = product.calculateTotalCost();

  print("Product:");
  print("Name: ${product.name}");
  print("Price: \$${product.price}");
  print("Quantity: ${product.quantity}");
  print("Total Cost: \$${totalCost.toStringAsFixed(2)}"); 
}
