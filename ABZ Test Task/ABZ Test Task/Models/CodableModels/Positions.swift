//
//  Positions.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/10/25.
//

import Foundation

struct PositionList: Codable {
    let success: Bool
    let positions: Positions
}

typealias Positions = [Position]

struct Position: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}
