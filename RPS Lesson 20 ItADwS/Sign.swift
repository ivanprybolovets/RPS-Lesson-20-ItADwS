//
//  Sign.swift
//  RPS Lesson 20 ItADwS
//
//  Created by Ivan Prybolovetz on 4/3/20.
//  Copyright © 2020 Ivan Prybolovetz. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper ,scissors
    
    var emoji : String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func getResult(for opposite: Sign ) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
             (.paper, .rock),
             (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
    
    
    
    
    //        switch self {
    //        case .rock:
    //            switch opposite {
    //            case .rock:
    //                return .draw
    //            case .paper:
    //                return .lose
    //            case .scissors:
    //                return .win
    //            }
    //        case .paper:
    //            switch opposite {
    //            case .rock:
    //                return .win
    //            case .paper:
    //                return .draw
    //            case .scissors:
    //                return .lose
    //            }
    //        case .scissors:
    //            switch opposite {
    //            case .rock:
    //                return .lose
    //            case .paper:
    //                return .win
    //            case .scissors:
    //                return .draw
    //            }
    //        }
}



