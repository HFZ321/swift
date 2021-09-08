import UIKit

func reverse(array:[Any]) -> [Any]{
    var arr: [Any] = []
    let size = array.count
    for i in 0...(size - 1){
        arr.append(array[size - i - 1])
    }
    return arr
}
func isPrime(num: Int) -> Bool{
    let end = num / 2 + 1
    if num < 2{
        return false
    }
    if num == 2{
        return true
    }
    for i in 2...end{
        if num % i == 0{
            return false
        }
    }
    return true

}
func findPrime(array:[Int]) -> [Int]{
    var fin: [Int] = []
    for item in array{
        if isPrime(num: item){
            fin.append(item)
        }
    }
    return fin
}

func even(array:[Int]) -> [Int]{
    var evenArray: [Int] = []
    for item in array{
        if item % 2 == 0{
            evenArray.append(item)
        }
    }
    return evenArray
}
func odd(array:[Int]) -> [Int]{
    var oddArray: [Int] = []
    for item in array{
        if item % 2 != 0{
            oddArray.append(item)
        }
    }
    return oddArray
}
let b = [1,2,3,4,5,6,7,8]
print(even(array: b))
print(odd(array: b))

func factorial(num: Int) -> Int{
    var result = 1
    for i in 1...num{
        result *= i
    }
    return result
}

func split(array:[Int],groupSize: Int) -> [[Int]]{
    var fin: [[Int]] = []
    var temp: [Int] = []
    let size = array.count
    var count = 0
    var splitNum = size / groupSize
    if splitNum == 0{
        return fin
    }
    while splitNum > 0{
        temp.append(array[count])
        count += 1
        if temp.count == groupSize{
            fin.append(temp)
            temp = []
            splitNum -= 1
        }
    }
    return fin
}
print(split(array: b, groupSize: 2))
