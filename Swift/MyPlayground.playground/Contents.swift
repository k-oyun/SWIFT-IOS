import UIKit

var greeting = "Hello, playground"
print(greeting)

var greeting2 = "Hello, Swift"
print(greeting2)

var greeting3 = "Hello, Swift3"
print(greeting3)

UIImage(systemName: "star")

var sum = 0
for i in 1...10 {
    sum += i
}

// MARK: - 주석

// 한 줄 주석

// greeting3

// 커맨드 + /

/* 여러 줄 주석 */


///  문서 주석
///  -이것은 문서 주석입니다.
///  클래스, 메서드 등의 도큐멘트를 작성할 때 많이 사용한다.


/**
    문서 주석 가능합니다.
    여러줄 주석도 문서주석 가능
 */

// 출력하기

print(greeting)
dump(greeting)

var num = 10
print(num)
dump(num)


// 수행문 작성
// 스위프트 수행문 작성은 코틀린과 같이 수행문 뒤에 ";"을 붙이지 않아도 된다.
print("Hello, World!")
print("Hello, World!") ; print("Hello, World!") ; print("Hello, World!")

print("Hello, World!", terminator: "")
print("Hello, World!", terminator: "")

// MARK: - 이름 짓기 규칙

// Lower Camel Case
// 함수, 메서드, 변수, 상수 등의 이름을 지을 때

var someVar1 = 0
func someFunc1() {
    
}

// Upser Camel Case
// 타입(Int, String, Bool, Float, Double 등), 클래스

var someInt2: Int = 0
//class SomeClass() {
//    
//}


// 기타 참고
// 일반 스네이크 케이스 : my_variable_name
// 어퍼 스네이크 케이스 : MY_CONSTANT_NAME

// 문자열 보간법 (String Interpolation)
let t1 = "안녕하세요." + greeting + "반갑습니다."
let t2 = "안녕하세요. \(greeting)반갑습니다."
let t3 = "안녕하세요. \(100)"
print(t1)
print(t2)
print(t3)

// MARK: 변수와 상수

var a = 10 // 변수 var : 변수는 다른 값으로 변경 가능
let b = 20 // 변수 let : 상수는 한번 값을 지정하면 변경 불가능

var c: Int
let d: Int

c = 50
c = 60

d = 70
//d = 80 -> 에러 발생

// 여러 변수와 상수를 한 번에 선언 및 초기화 할 수 있다.
var ab1, ab2, ab3: Int
var cd1 = 100, cd2 = 200, cd3 = 300

// var z // 타입이 정해지지 않고 초기화도 하지 않을 경우 에러 발생

// MARK: - 데이터 타입

// Int
// Int, UInt 각각 8바이트를 가짐

var int1 = 100
print(Int.max)
print(Int.max)

print(UInt.max)
print(UInt.max)

// Int16~Int64까지 다양한 정수 타입이 존재
let int16: Int16 = 100

// uint1 = -100 // UInt 타입은 음의 정수 담지 못한다.


// 진수별 정수 표현
let decimalInteger = 17 // 10진수
let binaryInteger = 0b10001 // 2진수로 17
let octalInteger = 0o144 // 8진수로 17
let hexadecimalInteger = 0x10 // 16진수로 17

// 숫자 리터럴 포맷. 가독성을 위해. 실제 언더바는 아무 영향 안끼친다.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// Bool(Boolean)
var boolean: Bool = true
print(boolean)
boolean.toggle( )
print(boolean)

// 부동 소수형 타입: Float(32), Double(64)
var floatValue: Float = 3.14
var doubleValue: Double = 3.14159

print(Int.random(in: -100...100))
print(UInt.random(in: 1...300))
print(Double.random(in: 1.5...4.3))
print(Float.random(in: -0.5...1.5))


// 문자 Character

let alphabet: Character = "a"
print(alphabet)

let 한글변수: Character = "😀"
print(한글변수)

let name: String = "김민수"
//name = "박민수" // 문자열 상수로 선언하면 변경 불가

var introduce: String = String()
introduce.append("안녕하세요")
introduce.append(name)
print(introduce)
print(introduce.count)
print(introduce.isEmpty)

var isSameString: Bool = false
isSameString = name == "김민수"
print(isSameString)

print(name.hasPrefix("김민"))
print(name.hasPrefix("민수"))

var hello = "Hello"

print(hello.uppercased())

print(hello.lowercased())


greeting = """
    안녕하세요.
    저는 조기환입니다.
"""

print(greeting)

// 스위프트의 제어문자들
// \n: 줄바꿈 문자(개행문자)
// \\: 문자열 내에서 백슬래시 표현
// \": 문자열 내에서 큰따옴표를 표현
// \t: 탭 문자. 키보드의 탭키를 눌렀을 때와 같은 효과


print("문자열 내부에서 \n줄바꿈을 하고 싶어요")
print("문자열 내부에서 \\줄바꿈\\을 하고 싶어요")
print("문자열 내부에서 \"줄바꿈\"을 하고 싶어요")
print(#"문자열 내부에서 \"줄바꿈\"을 \(100) 하고 싶어요"#)
print(#"문자열 내부에서 \"줄바꿈\"을 \#(100) 하고 싶어요"#)


// MARK : - Any, AnyObject, nil(=null)

// Any -> 어떤 타입이든 들어갈 수 있음
var someAny: Any = 10.111
someAny = "어떤 타입의 값도 할당 가능"
//var someString: String = someAny // Any도 하나의 타입이기 때문에 다른 타입에 할당하지 못한다.

// AnyObject
class SomeClass2 {}
var someAnyObject: AnyObject = SomeClass2()
//someAnyObject = 10 // AnyObject 타입에는 기본 타입 할당 불가

// nil: 아무것도 없는 값
//someAny = nil // 특정 타입에 할당 시 컴파일 에러 발생

var someAny2: Any? = 200 // 옵셔널로 만들어줘야 한다.
someAny2 = nil

// MARK: - 데이터 타입 안심(안정성)
/// 서로 다른 타입끼리의 데이터 교환은 꼭 타입 캐스팅을 거쳐야 한다.
/// 엄밀히 말하면 새로운 인스턴스를 생성하여 할당한다

var safe1: Int = 100
var safe2: Double = 200.333


//safe2 = safe1 // 형 변환을 거치지 않으면 에러가 발생한다.
safe2 = Double(safe1) // 형 변환을 해서 대입해야함

print(safe1)
print(safe2)

var name22 = "권오윤" // 타입을 추론한다.
let int33 = 100
let double = 333.333 // 기본 부동소수형 타입은 Double
// Float, Double

//int33 = "Asdf" // 타입 추론으로 변수를 선언했더라도 다른 타입을 할당할 수는 없다.

// MARK: - 타입 별칭 type alias
typealias MyInt = Int
typealias YourInt = Int

var age: MyInt = 10
var myAge: YourInt = 20

myAge = age
typealias MyString = String
var name222: MyString = "권오윤"


// 튜플 Tuple: 타입의 이름이 따로 지정되어 있지 않은 프로그래머 마음대로 만드는 타입, 데이터 묶음.
var person: (String, Int, Double) = ("권오윤", 27, 178.5)

print("이름: \(person.0), 나이: \(person.1), 키: \(person.2)")

person.0 = "김호민" // 값 수정도 인덱스로 가능하다.

var person2: (name: String, age: Int, height: Double) = ("권오윤", 27, 178.5)
print("이름: \(person2.0), 나이: \(person2.1), 키: \(person2.2)")
person2.name = "김호민"

typealias PersonTuples = (name:String, age: Int, height: Double)
var person3: PersonTuples = ("권오윤", 27, 178.5)

fun11()
func fun11() -> (Int, String) {
    return (100, "권오윤")
}

// MARK: - 컬렉션
/// 스위프트의 컬렉션에는 배열, 딕셔너리 
