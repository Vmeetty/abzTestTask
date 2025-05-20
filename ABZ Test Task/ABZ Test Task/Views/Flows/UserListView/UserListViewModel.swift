//
//  UserListViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI
import Combine

class UserListViewModel: BasicViewModel {

    @Published var users: UserItems = []

    private var subscriptions = Set<AnyCancellable>()
    private var page = "1"
    private var canLoadMore = true
    var isLoadingPage = false
    private var didInitialLoad = false

    func fetchUsers(isInitial: Bool = false) {
        guard !isLoadingPage, canLoadMore else { return }
        if isInitial && didInitialLoad { return }
        if isInitial { didInitialLoad = true }
        
        isLoadingPage = true
        getUserList()
    }

    private func getUserList() {
        APIClient.userListClient.getUserList(page: page, count: "6")
            .sink { [weak self] in
                guard let self else { return }
                self.isLoadingPage = false

                switch $0 {
                case .failure(let error):
                    self.errorText = error.localizedDescription
                    self.showingError = true
                case .finished:
                    break
                }
            } receiveValue: { [weak self] data in
                guard let self else { return }
                self.isLoadingPage = false
                self.users.append(contentsOf: data.users)
                if let nextUrl = data.links.nextUrl,
                   let nextPage = getPageValue(from: nextUrl) {
                    self.page = nextPage
                } else {
                    self.canLoadMore = false
                }
            }
            .store(in: &subscriptions)
    }

    private func getPageValue(from urlString: String) -> String? {
        guard let url = URL(string: urlString),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            return nil
        }

        return queryItems.first(where: { $0.name == "page" })?.value
    }
}
