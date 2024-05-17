
fun sumEvenNumbers() {
    var sum = 0
    for (i in 1..50) {
        if (i % 2 == 0) {
            sum += i
        }
    }
    println("The sum of all even numbers from 1 to 50 is: $sum")
}



fun findPrimeNumbers(start: Int, end: Int) {
    println("Prime numbers between $start and $end:")
    var i = start
    while (i <= end) {
        if (isPrime(i)) {
            print("$i ")
        }
        i++
    }
    println()
}

fun isPrime(n: Int): Boolean {
    if (n <= 1) return false
    var i = 2
    while (i * i <= n) {
        if (n % i == 0) return false
        i++
    }
    return true
}




fun isPalindrome(num: Int): Boolean {
    var originalNum = num
    var reversedNum = 0
    while (originalNum != 0) {
        val digit = originalNum % 10
        reversedNum = reversedNum * 10 + digit
        originalNum /= 10
    }
    return num == reversedNum
}

fun main() {
    sumEvenNumbers()
    findPrimeNumbers(10, 30)
    val number1 = 12321
    val number2 = 54345
    println("Is $number1 a palindrome? ${isPalindrome(number1)}")
    println("Is $number2 a palindrome? ${isPalindrome(number2)}")
}