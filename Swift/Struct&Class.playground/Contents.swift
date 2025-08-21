import UIKit

// 구조체와 클래스는 프로그래머가 데이터와 기능을 용도에 맞게 묶어 표현하고자 할 때 사용한다.
// - 구조체: 값 타입
// - 클래스: 참조 타입
// MARK: - struct(구조체)

struct Sample{
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    // 불변 프로퍼티
    let immutableProperty: Int = 200
    // 타입 프로퍼티
    static let typeProperty: Int = 300
    
    // 인스턴스 메서드
    func instanceMethod(){
        print("인스턴스 메서드")
    }
    
    // 타입 메서드
    
    static func typeMethod(){
        print("타입 메서드")
    }
}


// 가변 인스턴스 생성
var mutable: Sample = Sample()
mutable.mutableProperty = 1000
print("mutable \(mutable.mutableProperty)")
//mutable.immutableProperty = 2000  // 불변 프로퍼티(let)은 수정이 불가능함

// 불변 인스턴스 생성
let immutable: Sample = Sample()
//immutable.mutableProperty = 1000 // 불변 인스턴스는 프로퍼티 수정이 불가능함
//immutable.immutableProperty = 1000 // 불변 인스턴스는 프로퍼티 수정이 불가능함

// 타입 프로퍼티에 접근
print("Sample.typeproperty: \(Sample.typeProperty)")
Sample.typeMethod() // 인스턴스 생성 없이도 접근 가능
//mutable.typeMethod() // 인스턴스로 타입 메서드, 타입 프로퍼티 접근 불가


print("-------------------------------------------")

// 학생 구조체 만들어 보기
struct Student {
    // 가변 프로퍼티
    var name: String = "unknown"
    var `class`: String = "스위프트"
    // 강의실 호수
    @MainActor static var classroom: Int = 7
    // 타입 메서드
    static func selfIntroduce() {
        print("학생입니다.")
    }
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(`class`)반 \(name)입니다.")
    }
}

// 가변 인스턴스 생성

var oyun = Student()
oyun.name = "오윤"
oyun.class = "스위프트"
Student.classroom = 7
oyun.selfIntroduce()
Student.selfIntroduce()
print("\(Student.classroom) 강의실 입니다.")



struct Circle {
    static let pi: Double = 3.14
    var radius: Double = 0.0
    
    func area () -> Double {
        return Circle.pi * radius * radius
    }
    
}

var circle1 = Circle()
circle1.radius = 5.0
print("원의 넓이: \(circle1.area())")


var circle2 = Circle()
circle2.radius = 10.0
print("원의 넓이: \(circle2.area())")


/// 구조체 정리
/// 1. 상속 불가
/// 2. 모델 설계할 때 사용, 상속하지 않아도 되는 모델 설계할 때 사용.

// MARK: - class(클래스)

class Sample2 {
    // 가변 프로퍼티
    var mutableProperty: Int = 200
    
    // 불변 프로퍼티
    let immutableProperty: Int = 300
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("인스턴스 메서드")
    }
    
    // 타입 메서드
    static func typeMethod() {
        print("타입 메서드")
    }
    
}


// 가변 인스턴스 생성
var mutableReference: Sample2 = Sample2()
mutableReference.mutableProperty = 1000
print("mutableReference.mutableProperty: \(mutableReference.mutableProperty)")
//mutableReference.immutableProperty = 1000 // 불가능 가변 프로퍼티

// 불변 인스턴스 생성
let immutableReference: Sample2 = Sample2()
immutableReference.mutableProperty = 1000 // 불변 인스턴스를 만들어도 프로퍼티가 var로 되어있으면 수정 가능하다
//immutableReference.immutableProperty = 2000



// MARK: - 구조체와 클래스 비교

struct ValueType {
    var property: Int = 1
}



// 첫 번째 구조체 인스턴스
let firstStructInstance: ValueType = ValueType()
// 두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사
var secondStructInstance: ValueType = firstStructInstance
// 두 번째 구조체 인스턴스 프로퍼티 값 수정
secondStructInstance.property = 2

// 두 번째 구조체 인스턴스는 첫 번째 구조체를 똑같이 복사한
// 별도의 인스턴스이기 때문에
// 두 번째 구조체 인스턴스의 프로퍼티 값을 변경해도
// 첫 번째 구조체 인스턴스의 프로퍼티 값에는 영향이 없다.

print("firstStructInstance.property: \(firstStructInstance.property)") // 출력: 1
print("secondStructInstance.property: \(secondStructInstance.property)") // 출력: 2


class ReferenceType {
    var property: Int = 1
}

// 클래스 인스턴스 생성 후 첫 번째 참조 생성
let firstClassReference: ReferenceType = ReferenceType()
// 두번째 참조 변수에 첫 번째 참조 할당
var secondClassReference: ReferenceType = firstClassReference
secondClassReference.property = 2


// let으로 참조변수 만들게 되면 다른 인스턴스 참조하지 못하고 프로그램이 끝날 때까지 하나의 인스턴스만 가리킬 수 있다.
// var로 참조변수 만들게 되면 다른 인스턴스 참조로 수정할 수 있다.
let thirdClassReference: ReferenceType = ReferenceType()
secondClassReference = thirdClassReference
// firstClassReference = thirdClassReference // 참조 변수의 주소값은 바꿀 수 없다.


// 동일한 메모리를 공유
// 두 번째 클래스 참조는 첫 번째 클래스 인스턴스를 찹조하기 때문에
// 두 번째 참조를 통해 인스턴스의 프로퍼티 값을 변경하면
// 첫 번째 클래스 인스턴스의 프로퍼티 값을 변경하게 된다.
print("firstClassReference.property: \(firstClassReference.property)")
print("secondClassReference.property: \(secondClassReference.property)")
