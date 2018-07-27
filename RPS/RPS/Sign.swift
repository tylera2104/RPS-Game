//
//  Sign.swift
//  RPS
//
//  Created by Tyler Albrecht on 7/26/18.
//  Copyright © 2018 Tyler Albrecht. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign{
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign: String{
    case rock, paper, scissors
    
    var emoji: String{
        switch self {
        case .rock: return "👊"
        case .paper: return "🖐"
        case .scissors: return "✌️"
        }
    }
}

func compareSigns(other otherSign: Sign, player playerSign: Sign) -> GameState{
    if otherSign == Sign.paper{
        switch playerSign {
        case .rock: return GameState.lose
        case .scissors: return GameState.win
        default: return GameState.draw
        }
    } else if otherSign == Sign.rock{
        switch playerSign {
        case .rock: return GameState.draw
        case .scissors: return GameState.lose
        default: return GameState.win
        }
    } else {
        switch playerSign {
        case .rock: return GameState.win
        case .scissors: return GameState.draw
        default: return GameState.lose
        }
        
    }
}

