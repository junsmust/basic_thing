//
//  클로저_캡처에_대해서.swift
//  Basic_Thing
//
//  Created by 임주영 on 4/18/24.
//

import Foundation

/*
 
    클로저 캡처가 뭘까?
 
    우선 Capture Values에 대해서 알아보자
 
    A closure can capture constants and variables from the surrounding context in which it's defiend.
    -> 클로저는 변수와 상수를 정의된 내 안에서 잡아놓을 수 있다고 한다.
    The Closure can then refer to and modfiy the values of those contants and variables from whithin its body, even if the original scope that defined the constants and variables no longer exists.
    -> 클로저는 클로저 바디 안에서 상수와 변수들을 언급과 수정할 수 있다고 합니다. 단, 클로저가 더이상 존재하지 않다고 할지다로요..
    -> 그러니깐 클로저가 더이상 존재하지 않아도 남아있을 수 있다고 합니다.
 
 
    Captureing By Reference
 
 
    공부한 Blog: https://velog.io/@kipsong/Swift%EB%AC%B8%EB%B2%95-Closure-Capture%EC%97%90-%EB%8C%80%ED%95%98%EC%97%AC
 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var total: Int = 0
    
    func increment() -> Int {
        total += amount
        return total
    }
    
    return increment
}

/*
    let incrementer = makeIncrementer(forIncrement: 10)
    incrementer() // 10
    incrementer() // 20
    incrementer() // 30
*/
/*
    클로저에서 total이라는 변수를 캡처하고 있어
 
    클로저는 상수나 변수를 캡처할 수 있습니다. surrounding context로 부터요!!!!!
    그리고 다시 한번 말하지만 값을 참조하거나 변경할 수 있어!!!
 
    클로저 또한 참조 타입이란 것을 명시 !!!!
 
    makeIncrementer() 매소드는 한 번 호출되면 내부에 있는 매소드의 변수인 total은 메모리에서 해제되어야 합니다.
    
    그런데 계속 값이 추가되는 이유는?
 
    capture values -> 값을 잡아두고 있기 때문에
 
    다시 한번 말하지만 클로저는 참조타입으로 값을 공유하게 됩니다.
 
    그러면 value 타입의 경우는 값이 복사된다고 하는데, 어떻게 값을 참조하지?
    -> value Type이더라도 reference count를 생성합니다.
    -> value Type이더라도 클로저가 캡처하면 heap 영역으로 저장한다고 합니다.
 
    그러므로 value Type도 동일하게 캡처될 것이고, 동일하게 동작합니다.
 
    2. 캡처된 변수는 실행될 시점에서 값을 가져옵니다.
 
     class Person {
         var name: String
         
         init(name: String) {
             self.name = name
         }
     }

     func capturingValueTest02() {
         
         var person = Person(name: "Moya")
         print("최초 closure \(person.name)")
         
         delay(1) {
             print("내부 closure \(person.name)")
         }
         
         person = Person(name: "Swift")
         print("변경이후 closure \(person.name)")
         
     }
 
    이렇게 될 경우에 맨 처음에 Moya를 출력하고
    그 다음 person.name을 클로저에 캡처합니다.
    그 이후엔 person.name으 Swift로 변경합니다.
 
    그렇게 되면 delay된 capture에서 제일 최신의 값을 가져옵니다. (Swift)
 
 
    3. Capture List를 통해 메소드가 호출되는 시점에서의 값을 가져온다.
 
    Capture List란?
    - 클로저 내부에서 참조타입을 획득하는 규칙을 정하는 기능
    - 이 기능을 통해서 메모리 누수의 주 원인인 강한 참조 순환을 막을 수 있다.
    - 참조하는 값이 변경되어 클로저 내부의 값이 변경된느 것을 막을 수 있다.
 
     func capturingValueTest03() {
         
         var person = Person(name: "Uno")
         print("최초 closure \(person.name)")
         
         delay(1) { [person] in
             print("내부 closure \(person.name)")
         }
         
         person = Person(name: "Moya")
         print("변경이후 closure \(person.name)")
     }
     capturingValueTest03()
 
     // <Console Result>
     // 최초 closure Uno
     // 변경이후 closure Moya
     // Moya 메모리에서 해제
     // 타이머 끝
     // 내부 closure Uno
     // Uno 메모리에서 해제
 */


