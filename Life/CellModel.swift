//
//  CellModel.swift
//  Life
//
//  Created by владислав Руднев on 24.07.2022.
//

import Foundation
struct Cell {
    var isAlive: Bool = false
    
    static func makeDeadCell() -> Cell {
        return Cell(isAlive: false)
    }
    
    static func makeLiveCell() -> Cell {
        return Cell(isAlive: true)
    }
}
