//
//  TodoList.swift
//  EnumTableViewExample
//
//  Created by 염성필 on 2023/08/01.
//

import UIKit

struct TodoList {

     static var colors: [UIColor] = [.blue, .brown, .cyan, .darkGray, .purple, .red, .systemMint, .systemPink, .orange, .yellow, .green, .systemIndigo].shuffled()
     
     
     static func randomColor(list: TodoList.ListEnumElement) -> UIColor {
         
         enum ColorSequence: Int {
             case first, second, third, fourth
             
             var colorlist: Int {
                 switch self {
                 case .first:
                     return 0
                 case .second:
                     return 1
                 case .third:
                     return 2
                 case .fourth:
                     return 3
                 }
             }
         }
       
         switch list {
         case .first:
             return TodoList.colors[ColorSequence.first.colorlist]
         case .second:
             return TodoList.colors[ColorSequence.second.colorlist]
         case .third:
             return TodoList.colors[ColorSequence.third.colorlist]
         case .fourth:
             return TodoList.colors[ColorSequence.fourth.colorlist]
         }
     }
     
    enum ListEnumElement: CaseIterable {
        case first, second, third, fourth

        var listElement: Todo {
            switch self {
            case .first:
                return Todo(text: ["개인정보" ,"두 개인정보", "세 개인정보", "네 개인정보"], textColor: TodoList.randomColor(list: self))
            case .second:
                return Todo(text: ["보안설정" ,"두 보안설정", "세 보안설정"], textColor: TodoList.randomColor(list: self))
                
            case .third:
                return  Todo(text: ["기념일" ,"두 기념일"], textColor: TodoList.randomColor(list: self))
            case .fourth:
                return Todo(text: ["마지막 섹션"], textColor: TodoList.randomColor(list: self))
            }
        }
    }
}
