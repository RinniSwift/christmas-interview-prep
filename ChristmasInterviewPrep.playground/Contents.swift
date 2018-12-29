
/*
    question 1) given an array of Int, return the largest product of 3 integers
    question 2) calculate the indexes of the ocean view apartments
                 E.g: Input [4, 4, 2, 3, 1] Output [1, 3, 4]
                  ___   ___
                  |  |  |  |        ___
                  |  |  |  |  ___   |  |
                  |  |  |  |  |  |  |  |  ___
                  |  |  |  |  |  |  |  |  |  |
                                             ~~~~~~
    question 3) create a binary search on a sorted array and returns a bool
 */


// 1)
func largestThreeProducts(array: [Int]) -> Int {
    
    let sortedArray = array.sorted()
    
    let lastNumbers = sortedArray.suffix(3)
    let largestProduct = lastNumbers.reduce(1, *)
    let nextLargestNum = sortedArray[0] * sortedArray[1] * sortedArray.last!
    
    if largestProduct > nextLargestNum {
        return largestProduct
    } else {
        return nextLargestNum
    }

}
largestThreeProducts(array: [-100, -400, 4, 5, 3, 6, 1, 22, 100])


// 2)
func oceanViewApartment(apartStory: [Int]) -> [Int] {
    let reversed = apartStory.reversed()
    var stories = 0
    var oceanViewApartments = [Int]()
    for (index, item) in reversed.enumerated() {
        if item > stories {
            oceanViewApartments.append(index)
            stories = item
        }
    }
    return oceanViewApartments
}
oceanViewApartment(apartStory: [4, 5, 4, 2, 3, 1])             // this gives the index in reverse order


// 3)
func binarySearch(numbers: [Int], num: Int) -> Bool {

    let minIndex = 0
    let maxIndex = numbers.count - 1
    let midIndex = maxIndex / 2
    let midValue = numbers[midIndex]
    
    
    if num == midValue {
        return true
    } else if num > numbers[maxIndex] || num < numbers[minIndex] {
        return false
    }
    
    if num > midValue {
        let slice = Array(numbers[midIndex+1...maxIndex])
        return binarySearch(numbers: slice, num: num)
    } else if num < midValue {
        let slice = Array(numbers[minIndex...midIndex-1])
        return binarySearch(numbers: slice, num: num)
    }
    return false
    
}
binarySearch(numbers: [1, 2, 3, 4, 5], num: 4)







/*
 
    question 4) given an array, numbers, of N integers, return an array output such that output[i] is equal to the product  of all integers exept numbers[i]
    question 5) create a factorial recurssive function that returns an Int  (e.g. factorialRecurssive(num: 5) returns 120 (5*4*3*2*1)
    question 6) check if a word has all unique characters. returns true if is a unique word.
 
 */


// 4)
func productOfAll(numbers: [Int]) -> [Int] {
    var returnArray = [Int]()
    let productOfAll = numbers.reduce(1, { $0 * $1 })
    
    for i in numbers {
        returnArray.append(productOfAll / i)
    }
    
    return returnArray
}
productOfAll(numbers: [2, 5, 3, 4])


// 5)
func factorialRecurssive(num: Int) -> Int {
    if num == 1 || num == 0 {
        return 1
    }
    else {
        return num * factorialRecurssive(num: num - 1)
    }
}
factorialRecurssive(num: 5)


// 6)
func uniqueWord(word: String) -> Bool {
    
    var wordsSeen = Set<Character>()
    var uniqueCount = 0
    
    for i in word.lowercased() {
        if wordsSeen.contains(i) {
            return false
        } else {
            uniqueCount += 1
            wordsSeen.insert(i)
        }
    }
    
    if uniqueCount == word.count {
        return true
    } else {
        return false
    }
}
uniqueWord(word: "Happy")







/*
 
 question 7) reverse words. (e.g. "I am happy" returns "happy am I")
 question 8) create a die with given sides that randomizes a number
 question 9) given an array of duplicate Ints, return the number that hasnt been duplicated
 
 */






// 7)
func reverseWords(sentence: String) -> String {
    
    var arrayOfWords = sentence.split(separator: " ")
    return arrayOfWords.reversed().joined(separator: " ")
    
}
reverseWords(sentence: "I am happy")


// 8)
func die(sides: Int) -> Int {
    return Int.random(in: 1...sides)
}
die(sides: 6)


// 9)
func findUniqueNum(duplicates: [Int]) -> [Int] {
    var uniqueNums = [Int]()
    var numbersCount = [Int: Int]()
    
    for i in duplicates {
        if numbersCount.keys.contains(i) {
            numbersCount[i]! += 1
        } else {
            numbersCount[i] = 1
        }
    }
    
    for i in numbersCount {
        if i.value == 1 {
            uniqueNums.append(i.key)
        }
    }
    
    return uniqueNums
}
findUniqueNum(duplicates: [2, 2, 3, 4, 5, 5, 4, 7, 8, 6, 7, 8])
