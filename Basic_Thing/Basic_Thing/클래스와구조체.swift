//
//  ClassStructAbout.swift
//  Basic_Thing
//
//  Created by 임주영 on 2024/04/02.
//

import Foundation
/*
    구조체와 클래스에 대해서
 */

struct AnimalStruct {
    
}

class AnimalClass {
    
}

/*
   //MARK: 개념
    struct와 class는 하나의 큰 코드 블럭이다.
    이 안에 변수나 상수를 넣어 값을 저장할 수도 있다.
    함수와 값을 저장하고 변수와 상수를 모아 놓은 것이라고 보면 된다.
 
 
    구조체나 클래스 내부에 정의되면 프로퍼티라는 이름을 가지게 된다.
    마찬가지로 함수 또한 평션이 아니라 매소드라고 불린다.
 
    그 이유는 변수와 상수가 함수나 구조체에 들어가면 특별한 성격을 지녔기 때문이다.
 
 */


/*
   //MARK: 공통점
    프로퍼티, 매서드, 서브스크립트, 초기화 블록, 확장, 프로토콜
    
    프로퍼티: 변수나 상수를 사용해 값을 저장하는 프로퍼티를 정의할 수 있다.
    매서드: 함수를 사용하여 기능을 제공하는 매서드를 제공할 수 있다.
    서브스크립트: 속성값에 접근할 수 있는 방법을 제공하는 서브크스립트를 정의할 수 있다.
    초기화 블록: 객체를 원하는 초기 상태로 설정해주는 초기화 블록을 정의할 수 있다.
    확장: 객체에 함수적 기능을 추가하는 확장 구문을 사용할 수 있다.
    프로토콜: 특정 형식의 함수적 표준을 제공하기 위한 프로토콜을 구현할 수 있다;
 */


/*
    //MARK: 차이점
    - 상속: 클래스의 특성을 다른 클래스에게 물려준다.
    - 타입 캐스팅: 실행 시 컴파일러가 클래스 인스턴스의 타입을 미리 파악하고 검사할 수 있다.
    - 소멸화 구문: 인스턴스가 소멸되기 전에 처리해야 할 구문을 미리 등록할 수 있다.
        (Deinitializers may only be declared within a class, actor, or noncopyable type) 이런 오류가 발생
 
    - 첨조에 의한 전달: 클래스 인스턴스가 전달될 때에는 참조형식으로 제공되며, 참조 가능한 개수에 제약은 없다.
*/

/*
 Resolution 구조체
    width, height라는 두 개의 저장 프로퍼티가 있다.
    저장 프로퍼티란 특정값을 저장하기 위해 클래스나 구조체 내부에 정의된 변수나 상수를 말한다.
 */
struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}
/*
 VideoMode 클래스
    세 개의 저장 프로퍼티가 정의되어 있고, 최기화가 되어있음
 */
class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    deinit {
        
    }
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}

//구조체나 클래스는 실행할 수 있는 객체가 아니라, 값을 담을 수 있는 실질적인 그릇들을 만들기 위한 일종의 틀로 생각 해야한다.
//이 때, 원형 틀을 이용해 찍어낸 그릇을 인스턴스라고 한다.
//타입의 설계도를 사용해 메모리 공간을 할당받는 것이 인스턴스인 것이다.
//그리고 우리가 이 설계도를 이용해 실질적인 값을 담을 수 있는 것이 바로 인스턴스이다.

func main() {
    let resoultion = Resolution()
    let videoMode = VideoMode()

    videoMode.name = "임주영"
    
    //resoultion.height = 4 (불가)
    //struct 인스턴스가 let으로 지정되어 있을 경우 값을 변경하지 못 하기 때문에 struct 내부의 인스턴스를 변경하지 못한다.
}

/*
    //MARK: 구조체의 값 전달 방식 : 복사에 의한 전달
    구조체는 인스턴스를 생성한 후 이를 변수나 상수에 할당하거나 함수의 인자값으로 전달할 때 값을 복사합니다.
    이를 값 타입 또는 복사에 의한 전달 이라고 합니다.
 
    스위프트에서 모든 구조체는 값 타입 입니다.
 
    이 말은 우리가 생성하는 모든 구조체 인스턴스들이 상수나 변수에 할당될 때 복사된다는 뜻 입니다.
    
    구조체 인스턴스를 변수에 대입하면 기존의 인스턴스가 그대로 대입되는 것이 아니라 이를 복사한 새로운 값이 대입된다.
    따라서 변수에 대입된 인스턴스와 기존의 인스턴스는 서로 독립적인 존재가 된다.
    인스턴스를 할당한 후 기존 인스턴스나 할당된 쪽의 인스턴스에 무언가 변경이 발생하더라도 서로에게 전혀 영향을 미치지 않는다.
 
    아래 코드를 예로 들어 보겠다.
 */

func structTest() {
    let hd = Resolution(width: 1920, height: 1080)
    var cinema = hd
    cinema.height = 2999
    
    print("cinema 의 인스 height : \(cinema.height)")
    print("hd 의 인스 height : \(hd.height)")
}
/*
    hd라는 인스턴스를 만들고 cinema 변수에 할당하였다.
    Resolution은 구조체이므로 hd를 cinema에 대입하는 시점에서 기존 인스턴스의 복사본이 하나 더 만들어져
    이 복사본이 하나 더 만들어져 cinema 변수에 대입된다.
    즉, hd와 cinema는 같은 width, height 값을 가졌지만 값만 같을 뿐 실제로는 별개인 인스턴스가 대입되어 있는 것
 
     cinema 의 인스 height : 2999
     hd 의 인스 height : 1080
 
    이렇게 다른 값을 가지고 있다.
 */


/*
    //MARK: 클래스의 값 전달 방식: 참조에 의한 전달
    값의 복사에 의해 전달되는 구조체와는 달리, 클래스는 메모리 주소 참조에 의한 전달 방식을 사용한다.
    이를 참조 타입(Reference Type)이라고 한다.
    
    참조타입은 변수나 상수에 할당될 때 또는 함수의 인자 값으로 전달될 때 값의 복사가 이루어지는 것이 아니라 인스턴스의 주소에 접근해 참조가 전달된다.
 
 */

func classTest() {
    let video = VideoMode()
    let dvd = video
    
    dvd.name = "dvd video instance"
    
    print("video 인스턴스의 name 값은 : \(video.name ?? "") 입니다.")
}
