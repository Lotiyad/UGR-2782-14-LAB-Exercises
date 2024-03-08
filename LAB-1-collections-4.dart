import 'dart:io';

void main() {
 
  Map<String, int> shoppingCart = {};

  
  addToCart(shoppingCart, "Apple", 2);
  addToCart(shoppingCart, "Banana", 3);
  addToCart(shoppingCart, "Orange", 1);


  print("Shopping Cart:");
  printCart(shoppingCart);

  
  double totalPrice = calculateTotalPrice(shoppingCart);
  print("Total Price: \$${totalPrice.toStringAsFixed(2)}");

  removeFromCart(shoppingCart, "Banana");

  
  print("\nUpdated Shopping Cart:");
  printCart(shoppingCart);
}


void addToCart(Map<String, int> cart, String product, int quantity) {
  if (cart.containsKey(product)) {
    
    cart[product]! += quantity;
  } else {
   
    cart[product] = quantity;
  }
}


void removeFromCart(Map<String, int> cart, String product) {
  if (cart.containsKey(product)) {
    
    cart.remove(product);
  } else {
    print("Error: $product not found in the cart.");
  }
}


double calculateTotalPrice(Map<String, int> cart) {
  double totalPrice = 0;
  cart.forEach((product, quantity) {
   
    double pricePerItem = getProductPrice(product);
    totalPrice += pricePerItem * quantity;
  });
  return totalPrice;
}


double getProductPrice(String product) {
  switch (product) {
    case "Apple":
      return 1.5;
    case "Banana":
      return 0.75;
    case "Orange":
      return 2.0;
    default:
      return 0.0; 
  }
}

void printCart(Map<String, int> cart) {
  if (cart.isEmpty) {
    print("The cart is empty.");
  } else {
    cart.forEach((product, quantity) {
      print("$product: $quantity");
    });
  }
}
