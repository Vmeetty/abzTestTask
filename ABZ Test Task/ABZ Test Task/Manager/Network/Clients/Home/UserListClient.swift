//
//  UserListClient.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation
import Combine

protocol UserListClientProtocol {
    func getUserList(page: String, count: String) -> AnyPublisher<Users, Error>
    func getPosition() -> AnyPublisher<PositionList, Error>
}

final class UserListClient: UserListClientProtocol {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUserList(page: String, count: String) -> AnyPublisher<Users, Error> {
        networkService.performRequest(route: Router(endpoint: .getUserList(page: page, count: count)), isAthorizedRequired: false)
    }
    
    func getPosition() -> AnyPublisher<PositionList, Error> {
        networkService.performRequest(route: Router(endpoint: .getPositionList), isAthorizedRequired: false)
    }
}
