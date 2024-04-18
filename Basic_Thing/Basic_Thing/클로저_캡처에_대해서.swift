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


