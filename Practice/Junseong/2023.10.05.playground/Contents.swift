import UIKit

//var greeting = "Hello, playground"

//예제 1
func countlist(_ list: [Int]) -> Int {
    if list.isEmpty {
        return 0
    } else {
        return 1 + countlist(list.dropLast())
    }
}
countlist([1,2,3,4,5,1,4])



//예제2


//예제3
func fibonacci(n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }else {
        return fibonacci(n: n-1) + fibonacci(n: n-2)
    }
}
print(fibonacci(n: 6))
print( (1...9).map {fibonacci(n: $0)})

