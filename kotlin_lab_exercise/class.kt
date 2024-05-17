
class Rectangle(var length: Double, var width: Double) {
    fun calculatePerimeter(): Double {
        return 2 * (length + width)
    }

    fun calculateArea(): Double {
        return length * width
    }
}



class Triangle(var side1: Double, var side2: Double, var side3: Double) {
    
    fun isEquilateral(): Boolean {
        return side1 == side2 && side2 == side3
    }

    fun isIsosceles(): Boolean {
        return side1 == side2 || side2 == side3 || side1 == side3
    }

    fun isScalene(): Boolean {
        return side1 != side2 && side2 != side3 && side1 != side3
    }
}


class ShoppingCart {
    private val items = mutableListOf<Item>()

    data class Item(val name: String, val price: Double)

    fun addItem(name: String, price: Double) {
        items.add(Item(name, price))
    }

    fun removeItem(name: String) {
        items.removeIf { it.name == name }
    }

    fun calculateTotalPrice(): Double {
        return items.sumOf { it.price }
    }
}

fun main() {
    val myRectangle = Rectangle(5.0, 3.0)
    println("Perimeter of the rectangle: ${myRectangle.calculatePerimeter()}")
    println("Area of the rectangle: ${myRectangle.calculateArea()}")

    val myTriangle1 = Triangle(5.0, 5.0, 5.0)
    val myTriangle2 = Triangle(5.0, 5.0, 7.0)
    val myTriangle3 = Triangle(5.0, 6.0, 7.0)

    println("Is the first triangle equilateral? ${myTriangle1.isEquilateral()}")
    println("Is the second triangle isosceles? ${myTriangle2.isIsosceles()}")
    println("Is the third triangle scalene? ${myTriangle3.isScalene()}")

    val cart = ShoppingCart()
    cart.addItem("Apple", 0.5)
    cart.addItem("Banana", 0.25)
    cart.addItem("Orange", 0.75)
    println("Total price: ${cart.calculateTotalPrice()}")
    cart.removeItem("Banana")
    println("Total price after removing Banana: ${cart.calculateTotalPrice()}")
}