//
//  UserService.swift
//  Messanger
//
//  Created by Nijen Patel on 04/06/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

@MainActor
class UserService: ObservableObject {
    
    static let shared = UserService()
    
    @Published var currentUser: User?
    
    func fetchCurrentUser() async throws {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshoot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshoot.data(as: User.self)
        self.currentUser = user
        
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
