//MARK: - 버블정렬
/* 버블 정렬(bubble sort)은 배열의 인접한 두 원소를 비교하면서 정렬하는 알고리즘이다.

시간 복잡도는 O(n^2)이다.

1. 배열을 복사해서 새로운 배열을 만든다.
2. 배열의 크기를 n이라고...
3. n-1번 반복한다
4. i번째부터 n-1번째까지의 원소들을 순회
5. j번째 원소가 j+1번째 원소보다 크면 서로 교환
6.  정렬된 배열을 반환한다.
*/

import Foundation

func bubbleSort(_ input: [Int]) -> [Int] {
    var num: [Int] = input
    for _ in 0..<num.count{
        for j in 0..<num.count - 1 {
            if num[j] > num[j+1] {
                let temp = num[j]
                num[j] = num[j+1]
                num[j+1] = temp
            }
        }
    }
    return num
}

//print(bubbleSort([5,3,6,2,1]))


//MARK: - 선택 정렬
/*
 선택정렬(selection sort는 배열에서 가장 작은 값을 찾아서 맨 앞의 값과 교환하는 과정을 반복한다.
 시간 복잡도는 O(n^2) 이다.
 */

func selectionsort(_ input: [Int]) -> [Int] {
    var num: [Int] = input
    for i in 0..<num.count{
        for j in i+1..<num.count{
            print(i,j)
            if num[i] > num[j] {
                num.swapAt(i, j)
            }
        }
    }
    return num
}

//print(selectionsort([5,3,6,2,1]))

//MARK: - 정렬예제 1
/*
 가장 많이 들은 것부터 가장 적게 들은 것 순서로 정렬하여 가장 좋아하는 곡 순위를 알고 싶다면?
 곡명                   가수             연주 횟수
 롤린 (Rollin')      브레이브걸스            156
 Celebrity             아이유             141
 On The Ground      로제 (ROSÉ)          35
 LOVE DAY (2021)    양요섭, 정은지          94
 밤하늘의 별을(2020)        경서             88
 Gone               로제 (ROSÉ)           61
 Dynamite            방탄소년단            111
 */
class MusicCD: CustomStringConvertible {
    var song = ""
    var singer = ""
    var numPlay = 0

    init(song: String = "", singer: String = "", numPlay: Int = 0) {
        self.song = song
        self.singer = singer
        self.numPlay = numPlay
    }

    var description: String {
        return "\(numPlay), \(song), \(singer)"
    }
}


func bubbleSort(_ array: [MusicCD]) -> [MusicCD] {
    var sortedArray = array
    let n = sortedArray.count
    for i in 0..<n-1 {
        for j in 0..<n-1-i {
            if sortedArray[j].numPlay > sortedArray[j+1].numPlay {
                sortedArray.swapAt(j, j+1)
            }
        }
    }
    return sortedArray
}


var musicCDList: [MusicCD] = []
musicCDList.append(MusicCD(song: "롤린(Rollin')", singer: "브레이브걸스", numPlay: 156))
musicCDList.append(MusicCD(song: "Celebrity", singer: "아이유", numPlay: 156))
musicCDList.append(MusicCD(song: "On the Ground", singer: "로제", numPlay: 35))
musicCDList.append(MusicCD(song: "Love Day(2021)", singer: "양요섭, 정은지", numPlay: 94))
musicCDList.append(MusicCD(song: "밤하늘의 별을(2020)", singer: "경서", numPlay: 88))
musicCDList.append(MusicCD(song: "Gone", singer: "로제", numPlay: 61))
musicCDList.append(MusicCD(song: "Dynamite", singer: "방탄소년단", numPlay: 111))

//for item in bubbleSort(musicCDList).reversed() {
//    print(item)
//}

//MARK: - 팩토리얼(재귀호출)
func factorial(_ input: Int) -> Int {
    if input < 2 {
        return input
    } else {
        return factorial(input-1) * input
    }
}

//print(factorial(3))

//MARK: - 재귀함수 예제1
// 배열을 받아 카운트 - count([1,2,3,4,5])
func count(_ input: [Int]) -> Int{
    if input.count == 0{
        return 0
    } else {
        return count(input.dropLast()) + 1
    }
}

//print(count([1,2,3,4,5]))

//MARK: - 재귀함수 예제2
// 리스트에서 가장 큰수를 검색 - max([1,2,6,9,10,3,4])
//func max(_ input: [Int]) -> Int {
//    if input.isEmpty {
//        return 0
//    } else if input.count == 1 {
//        return input[0]
//    } else {
//        if max[0] > max[1] {
//            input.remove(at: 1)
//        }
//    }
//    return 0
//}
//print(max([1,2,6,9,10,3,4]))
//MARK: - 재귀함수 예제3
// 피보나치 수열
// 1. 일반함수 구현
// 2. 재귀 함수 구현
func fibo1(_ input: Int) -> Int {
    var fibo = [0,1,1]
    if input == 0 {
        return 0
    } else if input == 1 {
        return 1
    } else if input == 2 {
        return 1
    }
    for i in 2...input - 1 {
        fibo.append((fibo[i]) + fibo[i-1])
    }
    return fibo[input]
}

func fibo2(_ input:Int) -> Int {
    var fibo = [0,1,1]
    if input == 0 {
        return 0
    } else if input == 1 {
        return 1
    } else if input == 2 {
        return 1
    }
    for i in 2...input - 1 {
        fibo.append((fibo[i-1]) + fibo[i])
    }
    return fibo[input]
}
print(fibo1(7))
print(fibo2(7))
//MARK: - 재귀함수 예제4
//가로 1680m x 세로 640m 인 사각형을 똑같은 크기의 가장 큰 정사각형으로 나눌려고 한다. 정사각형의 크기는?
//재귀적 알고리즘을 사용하기 위한 분할 정복 기법 2단계 (기본단계, 재귀단계)
//
//가장 간단한 경우의 기본 단계를 찾는다
//주어진 문제를 작게 줄여서 기본 단계가 되도록 만드는 법을 찾는다
