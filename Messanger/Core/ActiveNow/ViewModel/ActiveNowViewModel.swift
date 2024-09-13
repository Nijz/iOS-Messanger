//
//  ActiveNowViewModel.swift
//  Messanger
//
//  Created by Nijen Patel on 04/06/24.
//

import Foundation
import FirebaseAuth

@MainActor
class ActiveNowViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        Task { try await self.fetchUsers() }
    }
    
    func fetchUsers() async throws{
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await UserService.fetchAllUsers()
        let filteredUsers = snapshot.filter({ $0.id != uid })
        self.users = filteredUsers
    }
}
