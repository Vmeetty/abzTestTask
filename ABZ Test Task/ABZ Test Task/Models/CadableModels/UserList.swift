//
//  UserList.swift
//  InstaProfileClone
//
//  Created by Vlad Chuvashov on 1/23/25.
//

import Foundation

struct Users: Codable {
    let success: Bool
    let totalPages: String
    let totalUsers: String
    let count: String
    let page: String
    let links: Links
    let users: UserItems
    
    enum CodingKeys: String, CodingKey {
        case success
        case totalPages = "total_pages"
        case totalUsers = "total_users"
        case count
        case page
        case links
        case users
    }
}

typealias UserItems = [UserItem]

struct UserItem: Codable, Identifiable, Equatable {
    static func == (lhs: UserItem, rhs: UserItem) -> Bool {
        return true
    }
    
    let id: String
    let name: String
    let email: String
    let phone: String
    let position: String
    let positionId: String
    let registrationTimestamp: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case email = "email"
        case phone = "phone"
        case position = "position"
        case positionId = "position_id"
        case registrationTimestamp = "registration_timestamp"
        case photo = "photo"
    }
}
