class Rectangle {
  double width;
  double height;

 
  Rectangle({required this.width, required this.height});


  double calculateArea() {
    return width * height;
  }

  
  double calculatePerimeter() {
    return 2 * (width + height);
  }
}

void main() {
 
  Rectangle rectangle = Rectangle(width: 5, height: 10);

 
  double area = rectangle.calculateArea();
  double perimeter = rectangle.calculatePerimeter();

  print("Rectangle:");
  print("Width: ${rectangle.width}");
  print("Height: ${rectangle.height}");
  print("Area: $area");
  print("Perimeter: $perimeter");
}
