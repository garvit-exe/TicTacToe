//
//  Cell.swift
//  TicTacToe
//
//  Created by Garvit Budhiraja on 26/03/2024.
//

import Foundation
import SwiftUI

struct Cell{
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile) {
        case Tile.O:
            return "O"
        case Tile.X:
            return "X"
        default:
            return ""
        }
    }
    
    func tileColor() -> Color {
            switch(tile) {
            case Tile.O:
                return Color.red
            case Tile.X:
                return Color.black
            default:
                return Color.black
            }
        }
}

enum Tile {
    case O
    case X
    case Empty
}
