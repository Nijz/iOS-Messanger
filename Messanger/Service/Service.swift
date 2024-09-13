//
//  Service.swift
//  Messanger
//
//  Created by Nijen Patel on 30/05/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import Firebase

@MainActor
class Service {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = Service()
    
    init(){
        self.userSession = Auth.auth().currentUser
        Task{ try await UserService.shared.fetchCurrentUser()}
    }
    
    
    func login(withEmail email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            Task{ try await UserService.shared.fetchCurrentUser()}
        } catch {
            print("DEBUG: error in loging in user -->> \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        
        do {
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            Task{ try await UserService.shared.fetchCurrentUser()}
            
        } catch {
            print("DEBUG: error in cretae user -->> \(error.localizedDescription)")
        }
    }
    
    func signout(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG: error in loging out user -->> \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws{
        
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
        
    }
}
