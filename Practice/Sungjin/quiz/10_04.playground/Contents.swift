import Foundation

// stack 예제 1번
func isRight (_ input: String) -> Bool {
    var stack: [Character] = []
    
    for char in input {
        if char == "(" || char == "{" || char == "[" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty || stack.popLast() != "(" {
                return false
            }
        } else if char == "}" {
            if stack.isEmpty || stack.popLast() != "{" {
                return false
            }
        } else if char == "]" {
            if stack.isEmpty || stack.popLast() != "[" {
                return false
            }
        }
    }
    return stack.isEmpty
}

print(isRight("()()"))
print(isRight("({[}])"))
print(isRight("())("))
print(isRight("({}[()]())"))

//// stack 예제 2번
//func postfix(_ input: String) -> Int {
//    var stack: [Int] = []
//    let tokens = input.split(separator: " ")
//    
//    for token in tokens {
//        if let number = Int(token) {
//            stack.append(number)
//        } else {
//            let one = stack.popLast()
//            let two = stack.popLast()
//            let result = Int
//            switch token {
//            case "+":
//                result = two + one
//            case "-":
//                result = two - one
//            case "*":
//                result = two * one
//            case "/":
//                result = two / one
//            default:
//                print("dddd")
//            }
//        }
//    }
//    return 1
//}
//
//
//
//postfix("2 3 + 4 *")
