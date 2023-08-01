//
//  Todo.swift
//  EnumTableViewExample
//
//  Created by 염성필 on 2023/08/01.
//

import UIKit
/*
  🤔 Todo에 static을 사용해서 colors를 만들어 줄때와 TodoList에서 만들어줄때 차이점은???
 
  1️⃣ TodoList에서 만들어주면 한번더 파고 들어가서 만들어주는 것이기 때문에 단지 색상만 뿌려주길 원할때
  2️⃣ Todo에서 만들어주면 예를 들어 Todo를 다른곳에서 사용할때 설정된 randomColor를 사용할 수 있음
 */


struct Todo {
    
    static let category: [String] = ["첫번째 섹션", "두번째 섹션", "세번째 섹션", "네번째 섹션"]
    
    
    var text: [String]
    var textColor: UIColor
    
    init(text: [String], textColor: UIColor) {
        self.text = text
        self.textColor = textColor
    }
    
    
    enum Category: Int {
        case first, second, third, fourth
        
        var sectionTitle: String {
            switch self {
            case .first:
                return "첫번째 섹션"
            case .second:
                return "두번째 섹션"
            case .third:
                return "세번째 섹션"
            case .fourth:
                return "네번째 섹션"
            }
        }
    }
}

