//
//  RegistrationViewModel.swift
//  Messanger
//
//  Created by Nijen Patel on 30/05/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws{
        try await Service.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
