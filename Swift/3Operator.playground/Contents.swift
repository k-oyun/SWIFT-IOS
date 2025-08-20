import UIKit

// -MARK: - 연산자

// 할당 연산자: "=" (대입 연산자)

var a = 10
var b = 2

// 산술 연산자
print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%b) // 나누고 남는 나머지 연산자

// 비교 연산자: 불리언 값으로 반환한다.
print( a == b ) // 같은지
print( a >= b ) // 크거나 같은지
print( a <= b ) // 작거나 같은지
print( a > b ) // 큰지
print( a < b ) // 작은지
print( a != b ) // 값이 다른지


// 삼항 조건 연산자
var valueA: Int = 3
var valueB: Int = 5
var biggerValue: Int = valueA > valueB ? valueA : valueB
print(biggerValue)

// 범위 연산자
print(a...b) // a부터 b까지 (b를 포함)
print(a..<b) // a부터 b미만까지
print(a...)
print(...a)
print(..<a)

// 논리 연산자
var isTrue: Bool = true
var isFalse: Bool = false
print(!isTrue)

isTrue && isFalse // 앞 뒤 조건식이 모두 참일때만 참이된다.
isTrue || isFalse // 앞 뒤 조건식 중 하나만 참일 때 참이된다.

// 복합 할당 연산자
let c1: Int = 10
let C2: Int = 20

