//
//  main.swift
//  quiz
//
//  Created by 최동호 on 2023/09/21.
//

import Foundation

/*
// quiz 6
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputTime = readLine(), let inputTime = Int(inputTime) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputTime
}

func solution(_ inputTime : Int) -> Array<Int?>? {
    var result = Array<Int?>()
    result.append(inputTime / 3600)
    result.append((inputTime / 60) % 60)
    result.append(inputTime % 60)
    return result
}

if let t = inputIntValue("초 입력: ") {
    if let tmp = solution(t) {
        print("\(tmp[0]!)시 \(tmp[1]!)분 \(tmp[2]!)초")
    }
}

 

// quiz 7
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputTime = readLine(), let inputTime = Int(inputTime) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputTime
}

func solution(_ inputTime: Int) -> String? {
    var result: Int = 0

    if inputTime <= 8 {
        result = inputTime * 5000
    }else {
        result = 8 * 5000 + ((inputTime - 8)  * 7500)
    }
    
    return String(result)
}

if let t = inputIntValue("노동시간 입력: ") {
    if var money = solution(t) {
        let index = money.index(money.endIndex, offsetBy: -3)
        money.insert(contentsOf: ",", at: index)
        print("총 임금은 \(money) 원 입니다.")
    }
}



// quiz 8
func solution(_ message: String) {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return
    }
    let result = inputValue % 2 == 0 ? "짝수" : "홀수"
    print("\(inputValue)(은) \(result)입니다.")
}

solution("정수 입력 : ")

// quiz 9
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}

func sub(_ num1: Int, _ num2: Int) -> Int {
    return num1 > num2 ? num1 - num2 : num2 - num1
}

if let num1 = inputIntValue("첫 번째 정수 입력: "), let num2 = inputIntValue("두 번째 정수 입력: ") {
    let result = sub(num1, num2)
    print("두 수의 차: \(result)")
}


// quiz 10
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}

if let num = inputIntValue("농구공의 개수를 입력하세요: ") {
    let result = num % 5 == 0 ? num / 5 : num / 5 + 1
    print("필요한 상자의 수:", result)
}


// 예제 1
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}

if let age = inputIntValue("나이 입력: ") {
    if age >= 20 {
        print("성인입니다.")
    }
}

// 예제 2
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
if let num = inputIntValue("숫자를 입력하세요: ") {
    if num % 3 == 0 && num % 5 == 0 {
        print("3과 5의 배수입니다.")
    }
}

// 예제 3
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
if let grade = inputIntValue("점수를 입력하세요: ") {
    let result = grade >= 60 ? "합격입니다." : "불합격입니다."
    print(result)
}

//예제 4
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
if let num = inputIntValue("정수를 입력하세요: ") {
    if num > 0 {
        print(num, "양수입니다.")
    } else if num < 0 {
        print(num, "음수입니다.")
    } else {
        print("0입니다.")
    }
}

// 예제 5
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
if let num1 = inputIntValue("num1 : "), let num2 = inputIntValue("num2 : ") {
    print(max(num1, num2))
}

// 예제 6
enum subjects {
    static let softwareEngineering = "1과목 소프트웨어 설계: "
    static let softwareDevelopment = "2과목 소프트웨어 개발: "
    static let database = "3과목 데이터베이스 구축: "
    static let programming = "4과목 프로그래밍 언어 활용: "
    static let informationSystem = "5과목 정보시스템 구축관리: "
}

func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
func checkPass() -> Bool {
    if let sub1 = inputIntValue(subjects.softwareEngineering),
       let sub2 = inputIntValue(subjects.softwareDevelopment),
       let sub3 = inputIntValue(subjects.database),
       let sub4 = inputIntValue(subjects.programming),
       let sub5 = inputIntValue(subjects.informationSystem) {
        if min(sub1, sub2, sub3, sub4, sub5) >= 8 {
            return true
        }
    }
    return false
}

if checkPass() {
    print("합격입니다!")
} else {
    print("불합격입니다!")
}


// 예제 7

func inputIntValue(_ message: String) -> Int? {
    print(message)
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
print("==== 디즈니랜드에 오신 걸 환영합니다! ====")
if let age = inputIntValue("나이를 말씀해주세요"),
   let nums = inputIntValue("인원수를 말씀해주세요") {
    if age > 19 {
        print("총 \(nums * 5000)원 입니다.")
    } else{
        print("총 \(nums * 2500)원 입니다.")
    }
}


// 예제 8
func inputIntValue(_ message: String) -> Int? {
    print(message)
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
if let num = inputIntValue("구매하려는 상품 갯수를 입력하세요") {
    if num < 10 {
        print("가격은 \(num * 10000) 원 입니다.")
    } else {
        print("가격은 \(num * 9000) 원 입니다.")
    }
}

// 예제 9
func inputIntValue(_ message: String) -> Int? {
    print(message)
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}
if let grade = inputIntValue("성적을 입력하세요.") {
    if grade >= 90 {
        print("A학점입니다.")
    } else if grade >= 80 {
        print("B학점입니다.")
    } else if grade >= 70 {
        print("C학점입니다.")
    }
}

//예제 10
enum messages {
    static let hello = "hello"
    static let niceToMeetYou = "nice to meet you"
    static let takeCare = "take care"
    static let notFindMessage = "잘못 입력하셨습니다."
    static let macMessage = [hello: "네, 안녕하세요", niceToMeetYou: "네, 반가워요!", takeCare: "네, 수고하세요!"]
}

func inputValue(_ message: String) -> String? {
    print(message, terminator: "")
    guard let inputValue = readLine() else {
        print("입력값이 없습니다.")
        return nil
    }
    return inputValue
}
if let inputMessage = inputValue("user: ") {
    switch inputMessage
    {
    case messages.hello:
        print("mac:", messages.macMessage[inputMessage]!)
    case messages.niceToMeetYou:
            print("mac:", messages.macMessage[inputMessage]!)
    case messages.takeCare:
            print("mac:", messages.macMessage[inputMessage]!)
    default:
        print(messages.notFindMessage)
    }
}


// 예제 12
func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}

if let month = inputIntValue("월 입력: ") {
    var season = ""
    switch month{
    case 12, 1, 2:
        season = "겨울"
    case 3...5:
        season = "봄"
    case 6...8:
        season = "여름"
    case 9...11:
        season = "겨울"
    default:
        print("입력값이 1~12를 벗어났습니다.")
        break
    }
    print("\(month)월은 \(season)입니다!")
}

enum machine {
    static let enter = "금액을 입력하세요.\n"
    static let menu = "1.콜라(800원) 2.생수(500원) 3.비타민워터(1500원) : "
    static let fail = "돈이 부족해요ㅠㅠ"
    
    static let price: [Int: Int] = [1: 800,
                                    2: 500,
                                    3: 1500
    ]
}

func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}

// 예제 16
if let money = inputIntValue(machine.enter) {
    print("메뉴를 고르세요")
    if let choice = inputIntValue(machine.menu) {
        if let choicePrice = machine.price[choice]{
            let changes = money - choicePrice
            // 예제 14
            if changes < 0 {
                print(machine.fail)
                print("잔돈: \(money)원")
            } else {
                print("잔돈: \(changes)원")
                // 예제 15~16
                print("천원: \(changes / 1000)개, 오백원: \((changes % 1000) / 500)개, 백원: \((changes % 500) / 100)개")
            }
        } else {
            print("\(choice)를 찾을 수 없습니다.")
        }
    }
}

 */
//

func inputIntValue(_ message: String) -> Int? {
    print(message, terminator: "")
    guard let inputValue = readLine(), let inputValue = Int(inputValue) else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}

func inputValue(_ message: String) -> String? {
    print(message, terminator: "")
    guard let inputValue = readLine() else {
        print("입력값이 잘못되었습니다.")
        return nil
    }
    return inputValue
}

func countFactors(_ num: Int) -> [Int] {
    var nums : [Int] = []
    for i in 1...num {
        if num % i == 0 {
            nums.append(i)
        }
    }
    return nums
}

let userID = "Hello"
let passward = 1234

/*
// while 예제 1
while true {
    if let num = inputIntValue("정수 입력: ") {
        if num >= 10 {
            print("종료되었습니다.")
            break
        }
    }
}
 
 // while 예제 2
var day = 0

if var nowWeight = inputIntValue("현재 몸무게: "),
   let target = inputIntValue("목표 몸무게: ") {
    while nowWeight > target {
            day += 1
        if let w = inputIntValue("\(day)주차 감량 몸무게: ") {
            nowWeight -= w
        }
    }
    print("\(nowWeight)kg 달성! 축하합니다!!")
}

// while 예제 3
if let inputId = inputValue("아이디를 입력해 주세요: "),
   let inputPassward = inputIntValue("비밀번호를 입력해 주세요: ") {
    if inputId != userID || inputPassward != passward {
        print("아이디와 비밀번호가 잘못되었습니다.")
    } else {
        print("로그인 성공!")
    }
}

// while 예제 4

while true {
    if let inputId = inputValue("아이디를 입력해 주세요: "),
       let inputPassward = inputIntValue("비밀번호를 입력해 주세요: ") {
        if inputId != userID || inputPassward != passward {
            print("아이디와 비밀번호가 잘못되었습니다.\n")
        } else {
            print("로그인 성공!")
            break
        }
    }

}


// whjle 예제 5

while true {
    if let inputId = inputValue("아이디를 입력해 주세요: "),
       let inputPassward = inputIntValue("비밀번호를 입력해 주세요: ") {
        if inputId != userID || inputPassward != passward {
            print("아이디와 비밀번호가 잘못되었습니다.")
            if let checkContinue = inputValue("계속 하시겠습니까? (Y/N) ") {
                if checkContinue == "N" {
                    print("\n종료되었습니다.")
                    break
                }
                print()
            }
        } else {
            print("로그인 성공!")
            break
        }
    }

}

while true {
    if let firstNum = inputIntValue("첫 번째 정수를 입력하세요: "),
       let secondNum = inputIntValue("두 번째 정수를 입력하세요: ") {
        if let choice = inputIntValue("1.더하기 2.빼기 : ") {
            switch choice {
            case 1:
                print("더하기 연산 결과는 \(firstNum + secondNum)입니다.")
            case 2:
                print("빼기 연산 결과는 \(firstNum - secondNum)입니다.")
            default:
                print("\(choice)를 찾을 수 없습니다.")
            }
        }
        if let checkContinue = inputValue("계속 하시겠습니까? (Y/N) ") {
            if checkContinue == "N" {
                print("\n종료되었습니다.")
                break
            }
            print()
        }
    }
}

// 예제 7
print("=== Plus Game ===")
let num1 = Int.random(in: 0...100)
let num2 = Int.random(in: 0...100)
if let sumNum = inputIntValue("\(num1)+\(num2)= ") {
    if sumNum == num1 + num2 {
        print("Success")
    } else {
        print("Fail")
    }
}

// 예제 7-1
print("=== Plus Game ===")
let num1 = Int.random(in: 0...100)
let num2 = Int.random(in: 0...100)
while true {
    if let sumNum = inputIntValue("\(num1)+\(num2)= ") {
        if sumNum == num1 + num2 {
            print("Success")
        } else {
            print("Fail")
        }
        if let checkContinue = inputValue("계속 하시겠습니까? (Y/N) ") {
            if checkContinue == "N" {
                print("\n종료되었습니다.")
                break
            }
            print()
        }
    }
}

// 예제 7-2
print("=== Plus Game ===")
while true {
    let num1 = Int.random(in: 0...100)
    let num2 = Int.random(in: 0...100)
    if let sumNum = inputIntValue("\(num1)+\(num2)= ") {
        if sumNum == num1 + num2 {
            print("Success")
        } else {
            print("Fail")
        }
        if let checkContinue = inputValue("계속 하시겠습니까? (Y/N) ") {
            if checkContinue == "N" {
                print("\n종료되었습니다.")
                break
            }
            print()
        }
    }
}

// for 예제 00
for index in (53...96).reversed() {
    print(index)
}
for index in (21...57) {
    if index % 2 == 1{
        print(index)
    }
}

if let num = inputIntValue("정수입력: ") {
    for index in (1...num) {
        print(index, terminator: " ")
    }
    print()
}

if let num = inputIntValue("정수입력: ") {
    for index in (1...10) {
        print(num * index, terminator: " ")
    }
    print()
}

var sumNum = 0
for i in 1...100 {
    i % 3 == 0 ? sumNum += i : nil
}
print(sumNum)

// for  예제 4
if let level = inputIntValue("단 입력: ") {
    for index in 1...9 {
        print("\(level) * \(index) = \(level * index)")
    }
}


// for 예제 5
for i in 1...9 {
    print("===\(i)단===")
    for j in 1...9 {
        print("\(i) * \(j) = \(i * j)")
    }
    print()
}


// for 예제 6
for i in 1...9 {
    print("\(i)단: ", terminator: "")
    for j in 1...9 {
        print("\(i) * \(j) = \(i * j)", terminator: "\t")
    }
    print()
}


// for 예제 7
if let num = inputIntValue("정수입력: ") {
    let factors = countFactors(num)
    print("\(num)의 약수:", factors.map{String($0)}.joined(separator: " "))
}


// for 예제 8
var factors : [Int] = []
for num in 2...30 {
    factors = countFactors(num)
    print("\(num)의 약수:", factors.map{String($0)}.joined(separator: " "))
}


// for 예제 9

for i in 0...4 {
    for _ in 0...i{
        print("*", terminator: "")
    }
    print()
}

// -----
for i in (0...4).reversed() {
    for _ in 0...i {
        print("*", terminator: "")
    }
    print()
}

// ----
for i in 0...4 {
    for _ in (0...(4-i)).reversed() {
        print(" ", terminator: "")
    }
    for _ in 0...i {
        print("*", terminator: "")
    }
    print()
}

// ----
for i in 0...4 {
    for _ in 0...(4-i) {
        print(" ", terminator: "")
    }
    for _ in 0...i {
        print("**", terminator: "")
    }
    print()
}
for j in (0...4).reversed() {
    for _ in 0...(4-j) {
        print(" ", terminator: "")
    }
    for _ in 0...j {
        print("**", terminator: "")
    }
    print()
}


// for 예제 10

for i in 0...99 {
    var tmp = String(i)
    var num = ""
    for n in tmp {
        if n == "3" || n == "6" || n == "9" {
            num += "*"
        } else {
            num += String(n)
        }
    }
    print(num)
}

// 함수 예제 1
func addNumber(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

// 함수 예제 2
func compareNum(_ num1: Int, _ num2: Int) -> Int {
    if num1 > num2 {
        return num1
    } else if num2 > num1 {
        return num2
    } else {
        return 0
    }
}

// 함수 예제 3
func close10(_ a: Int, _ b: Int) -> Int {
    let aDiff = abs(10 - a)
    let bDiff = abs(10 - b)
    
    if aDiff < bDiff {
        return a
    } else if bDiff < aDiff {
        return b
    } else {
        return 0
    }
    
}

// 함수 예제 4
func powerN(_ base: Int, _ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    return base * powerN(base, n - 1)
}

// 함수 예제 5
func getAbsoluteValue(_ num1: Int, _ num2: Int) -> Int {
    let result = abs(num1 - num2)
    return result
}

// 함수 예제 6
func isDivide(_ num1: Int, _ num2: Int) -> Bool {
    if num2 == 0 {
        return false
    }

    return num1 % num2 == 0
}

// 함수 예제 7
func getDivisor(_ num: Int) {
    var nums : [Int] = []
    for i in 1...num {
        if num % i == 0 {
            nums.append(i)
        }
    }
    print("\(num)의 약수:", nums.map{String($0)}.joined(separator: " "))
}


// 함수 예제 8
func getSumOfDivisors(_ num: Int) -> Int {
    var nums : [Int] = []
    for i in 1...num {
        if num % i == 0 {
            nums.append(i)
        }
    }
    return nums.reduce(0, +)
}
print("10의 약수의 합:", getSumOfDivisors(10))


// 함수 예제 9
func getPerfectNumber(startValue: Int, endValue: Int) {
    var results: [Int] = []
    for number in startValue...endValue {
        if number * 2 == getSumOfDivisors(number) {
            results.append(number)
        }
    }
    print("\(startValue)~\(endValue)까지의 완전수:", results.map{String($0)}.joined(separator: " "))
}
getPerfectNumber(startValue: 2, endValue: 1000)


// 함수 예제 10
func getPrimeNumbers(startValue: Int, endValue: Int) {
    var isPrime = Array(repeating: true, count: endValue + 1)
    var primes: [Int] = []

    isPrime[0] = false
    isPrime[1] = false

    for number in 2...endValue {
        if isPrime[number] {
            primes.append(number)

            var multiple = 2 * number
            while multiple <= endValue {
                isPrime[multiple] = false
                multiple += number
            }
        }
    }

    let filteredPrimes = primes.filter { $0 >= startValue }
    print("\(startValue)~\(endValue)까지의 소수:", filteredPrimes.map{String($0)}.joined(separator: " "))
}
getPrimeNumbers(startValue: 2, endValue: 30)


class PiggBank {
    var money = 0
    var size = 0
    
    func deposit(_ m: Int) {
        money += m
    }
    func withdraw(_ m: Int) {
        money -= m
    }
    func show() {
        print("현재 잔액: \(money)")
    }
}

let myPiggBank = PiggBank()
myPiggBank.deposit(1500)
myPiggBank.withdraw(700)
myPiggBank.show()

// class 예제 01-03
class Student {
    var name: String
    var number: String
    var age: Int
    var scoreSwift: Int
    var scoreiOS: Int
    var scoreWeb: Int
    
    init(name: String, number: String, age: Int, scoreSwift: Int, scoreiOS: Int, scoreWeb: Int) {
        self.name = name
        self.number = number
        self.age = age
        self.scoreSwift = scoreSwift
        self.scoreiOS = scoreiOS
        self.scoreWeb = scoreWeb
    }
    
    func show() {
        print("\(name)님 안녕하세요.")
        print("[ \(number), \(age)살 ]")
        print("\(name)님의 Swift 점수는 \(scoreSwift)점 입니다.")
        print("\(name)님의 iOS 점수는 \(scoreiOS)점 입니다.")
        print("\(name)님의 Web 점수는 \(scoreWeb)점 입니다.")
    }
}

let student1 = Student(name: "홍길동", number: "20200677", age: 22, scoreSwift: 50, scoreiOS: 89, scoreWeb: 77)
let student2 = Student(name: "김영희", number: "20190541", age: 26, scoreSwift: 90, scoreiOS: 85, scoreWeb: 70)

student1.show()
print("======================================")
student2.show()

// class 예제 04
class Person {
    var name = ""
    var age = 0
    
    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
    
    func getName() -> String {
        return self.name
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func getAge() -> Int{
        return self.age
    }
    
    func setAge(_ age: Int) {
        self.age = age
    }
}

let st1 = Person(name: "홍길동", age: 25)
let st2 = Person(name: "김영희", age: 27)
print("st1 객체 학생이름: \(st1.getName()), 나이: \(st1.getAge())")
print("st2 객체 학생이름: \(st2.getName()), 나이: \(st2.getAge())")

// class 예제 05

class Calculator {
    var num1 = 0
    var num2 = 0
    
    init(_ num1: Int = 0, _ num2: Int = 0) {
        self.num1 = num1
        self.num2 = num2
    }
    func setNum1(_ num: Int) {
        self.num1 = num
    }
    func setNum2(_ num: Int) {
        self.num2 = num
    }
    func sum() -> Int {
        return self.num1 + self.num2
    }
    func sub() -> Int {
        return self.num1 - self.num2
    }
    func mul() -> Int {
        return self.num1 * self.num2
    }
    func div() -> Int {
        return self.num1 / self.num2
    }
}

let cal = Calculator(50, 10)
print(cal.sum())
cal.setNum1(75)
cal.setNum2(5)
print(cal.sub(), cal.mul(), cal.div())


// class 예제 06

class TV {
    var name: String
    var year: Int
    var size: Int
    
    init(name: String, year: Int, size: Int) {
        self.name = name
        self.year = year
        self.size = size
    }
    
    func show() -> String{
        return "\(name)에서 만든 \(year)년형 \(size)인치 TV"
    }
}

let myTV = TV(name: "LG", year: 2023, size: 48)
print( myTV.show() )


// array 예제 1-1
var array : [Int] = []

// array 예제 1-2
array = Array(repeating: 0, count: 10)

// array 예제 1-3
array = array.map({(_: Int) -> Int in
    return Int.random(in: 1...20)
})

// array 예제 1-4
print(array.map{String($0)}.joined(separator: " "))

// array 예제 1-5
if array.count > 9 {
    print(array[3] + array[8])
}

// array 예제 1-6
print(array.reduce(0) { $0 + $1 })

// array 예제 1-7
print((Double(array.reduce(0){ $0 + $1 })) / Double(array.count))


// array 예제 2
print("array에 들어있는 짝수는", array.filter{ $0 % 2 == 0 }, "입니다.")

// array 예제 3
let result = array.filter{ $0 % 2 == 1 }
print("array에 들어있는 홀수는 \(result) 이며, 총 \(result.count)개 입니다.")

// array 예제 4
if let maxNum = array.max() {
    print("가장 큰 값은 \(maxNum) 입니다.")
} else {
    print("ArrayIndexOutOfBoundsExceptio")
}

// array 예제 5
if let minNum = array.min() {
    print("가장 작은 값은 \(minNum) 입니다.")
} else {
    print("ArrayIndexOutOfBoundsExceptio")
}

// array 예제 6
var waterMelon = ["수", "박"]
print("=== 수박 게임 시작! ===")
if let num = inputIntValue("숫자를 입력해주세요: ") {
    for i in 2...(num-1) {
        waterMelon.append(waterMelon[i % 2])
    }
    print(waterMelon.map{$0}.joined(separator: ""))
}

// array 예제 7
var intArray = Array(repeating: 0, count: 10)
for i in 0...(intArray.count-1) {
    if let num = inputIntValue("\(i+1)번 째 정수 입력: ") {
        intArray[i] = num
    }
}
let result = intArray.filter{ $0 % 3 == 0 }
print("3의 배수:", result.map{String($0)}.joined(separator: " "))


// array 예제 8

let answers = [1, 1, 4, 2, 3]
var check = Array(repeating: "x", count: answers.count)
print("""
=== 채점하기! ===
답을 입력하세요
""")
var i = 1
var cnt = 0
answers.forEach { answer in
    if let num = inputIntValue("\(i)번답: ") {
        if answer == num {
            check[i-1] = "o"
            cnt += 1
        }
        i += 1
    }
}
print("정답확인")
print(check.map{String($0)}.joined(separator: " "), "총점:", (100 / answers.count) * cnt)

// array 예제 9
array.forEach { num in
    print("\(num): ", terminator: "")
    for _ in 0...num {
        print("*", terminator: "")
    }
    print()
}
 */
