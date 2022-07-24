//
//  GameState .swift
//  Life
//
//  Created by владислав Руднев on 24.07.2022.
//

import Foundation
struct GameState {
    var cells: [Cell] = []
    
    subscript(index: Int) -> Cell {
        get {
            return cells[index]
        } set {
            cells[index] = newValue
        }
    }
}

extension GameState: Equatable {
    public static func == (lhs: GameState, rhs: GameState) -> Bool {
        for lhsCell in lhs.cells {
            for rhsCell in rhs.cells {
                if lhsCell.isAlive != rhsCell.isAlive {
                    return false
                }
            }
        }
        return true
    }
}
