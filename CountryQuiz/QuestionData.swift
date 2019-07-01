//
//  QuestionData.swift
//  CountryQuiz
//
//  Created by MacOS on 2/24/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import Foundation



struct Question {
    
    var text: String
    var answers: [Answer]
    var type: ResponseType
    
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    var text: String
    var type: CountryType
    
}

enum CountryType: Character {
    case Thailand = "🇹🇭"
    case France = "🇫🇷"
    case Spain = "🇪🇸"
    case Iceland = "🇮🇸"
    
    
    var definition: String {
        switch self {
        case .France:
         return   "You like tasty food, romantic cities and great nature. You should visit this wonderful country!"
        case .Iceland:
         return   "You like unusual places and picturesque countries. It is a land of myth and legends, and landscape from ice to green. You should visit this great country!"
        case .Spain:
          return  "You like magnificent architecture, friendly people, mucis and festivals and humor. You should fall in love in this country!"
        case .Thailand:
           return "You prefer ecotic food and locations.You should visit this country!"
        }
    }
    
}
