
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


