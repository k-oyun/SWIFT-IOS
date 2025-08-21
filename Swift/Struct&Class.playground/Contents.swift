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
