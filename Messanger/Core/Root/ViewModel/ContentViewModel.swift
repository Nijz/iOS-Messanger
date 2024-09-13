//
//  ContentViewModel.swift
//  Messanger
//
//  Created by Nijen Patel on 31/05/24.
//

import Foundation
import FirebaseAuth
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()

    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        Service.shared.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
}
