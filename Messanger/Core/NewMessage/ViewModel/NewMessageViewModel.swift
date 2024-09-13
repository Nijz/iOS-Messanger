//
//  NewMessageViewModel.swift
//  Messanger
//
//  Created by Nijen Patel on 04/06/24.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class NewMessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task{ try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        guard let curretUserId = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.id != curretUserId})
    }
}
