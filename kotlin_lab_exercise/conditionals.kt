fun determineTriangleType(a: Double, b: Double, c: Double): String {
    return when {
        a == b && b == c -> "Equilateral"
        a == b || b == c || a == c -> "Isosceles"
        else -> "Scalene"
    }
}


fun calculateTotalSalary(hoursWorked: Int, hourlyRate: Double): Double {
    val regularHours = minOf(hoursWorked, 40)
    val overtimeHours = maxOf(hoursWorked - 40, 0)
    val regularPay = regularHours * hourlyRate
    val overtimePay = overtimeHours * (hourlyRate * 1.5)
    return regularPay + overtimePay
}

fun main() {
    val a = 5.0
    val b = 5.0
    val c = 4.0
    println("The triangle with sides $a, $b, and $c is ${determineTriangleType(a, b, c)}")
    
    val hoursWorked = 45
    val hourlyRate = 20.0
    println("The total salary is $%.2f".format(calculateTotalSalary(hoursWorked, hourlyRate)))
}