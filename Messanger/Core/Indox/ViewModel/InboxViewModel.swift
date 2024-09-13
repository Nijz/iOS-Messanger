//
//  InboxViewModel.swift
//  Messanger
//
//  Created by Nijen Patel on 04/06/24.
//

import Foundation
import Combine
import Firebase

@MainActor
class InboxViewModel: ObservableObject {
        
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    @Published var users = [User]()
    
    init(){
        setupSubscriber()
        Task { try await fetchUsers()}
    }
    
    private func setupSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
