fun determineSeason(month: Int): String {
    if (month in 3..5) {
        return "Spring"
    } else if (month in 6..8) {
        return "Summer"
    } else if (month in 9..11) {
        return "Fall"
    } else if (month == 12 || month == 1 || month == 2) {
        return "Winter"
    } else {
        return "Invalid month"
    }
}



fun findLargest(a: Int, b: Int, c: Int): Int {
    if (a >= b && a >= c) {
        return a
    } else if (b >= a && b >= c) {
        return b
    } else {
        return c
    }
}


fun main() {
    val month = 6
    val day = 15
    println("The season of month: ${month}, day: ${day} is ${determineSeason(month)}")

    val num1 = 10
    val num2 = 20
    val num3 = 15
    println("The largest number is ${findLargest(num1, num2, num3)}")
}