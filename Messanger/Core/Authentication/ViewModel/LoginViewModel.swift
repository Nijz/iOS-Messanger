//
//  LoginViewModel.swift
//  Messanger
//
//  Created by Nijen Patel on 30/05/24.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        Task {
            try await Service.shared.login(withEmail: email, password: password)
        }
    }
}
