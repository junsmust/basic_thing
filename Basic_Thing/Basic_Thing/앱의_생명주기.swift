//
//  앱의_생명주기.swift
//  Basic_Thing
//
//  Created by 임주영 on 4/18/24.
//

import Foundation
/**
 
 1.  init
 
 2. loadView :
            - view를 메모리에 올리는 함수
            - ViewController는 메모리에 올라온 후, 인스턴스 메서드인 loadView()를 통해 화면을 메모리에 올린다.
            - ViewController의 IUO 저장 프로퍼티로 선언되어 있는 vievw의 요청으로 이 메서드가 호출되면 view를 로드하거나 생성하여 해당 저장 프로퍼티에 할당한다.
            - 만약, view를 수동으로 생성했다면 loadView()를 재정의해서 ViewController의 view에 직접 생성한다.
            - 만약 수동생성 한다면 super.loadView() 는 불필요
 3. viewDidLoad
            - view가 메모리에 올라온 후 호출된다.
            - 스토리보드와 IBOulet을 이용하여 view를 구성했다면, 스토리보드의 뷰객체와 ViewController의 코드가 연결된 후 호출된다.
            - 뷰가 메모리에 올라온 후 한번만 호출된다.
 
 4. viewWillApear
            - 화면읠 띄울 때 마다 호출
            - 화면 갱신할 때 주로 사용
 
 5. viewDidAppear
            - 뷰의 애니메이션을 시작하거나, 타이머를 시작하는 등 화면이 나타난 후 필요한 작업을 처리
 
 6. viewWillDisappear
            -  스크린에서 뷰가 사라기지 전에 호출
            - 진행중인 애니메이션을 멈추거나, 타이머를 종료시키는 등의 작업을 처리
 
 7. viewDidDisappear
            - 스크린에서 뷰가 사라진 후에 호출
            - ㄷ화면이 스크린에서 내려갔을 뿐, 메모리에서 해제된 것은 아님
 8. viewDidUnLoad
 
 
    
 */
