
fun sortArray(arr: IntArray): IntArray {
    return arr.sorted().toIntArray()
}


fun factorial(n: Int): Long {
    return if (n == 0) 1 else n * factorial(n - 1)
}


fun hasUniqueChars(str: String): Boolean {
    val charSet = hashSetOf<Char>()
    for (char in str) {
        if (charSet.contains(char)) {
            return false
        }
        charSet.add(char)
    }
    return true
}

fun main() {
    val myArray = intArrayOf(5, 2, 8, 1, 9)
    println("Sorted array: ${sortArray(myArray).contentToString()}")

    val number = 5
    println("Factorial of $number is ${factorial(number)}")
    
    val string1 = "hello"
    val string2 = "abcde"
    println("String '$string1' has unique characters: ${hasUniqueChars(string1)}")
    println("String '$string2' has unique characters: ${hasUniqueChars(string2)}")
}