//
//  ContentView.swift
//  Messanger
//
//  Created by Nijen Patel on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        Group{
            if viewModel.userSession != nil {
                InboxView()
            } else {
                LoginView() 
            }
        }
    }
}

#Preview {
    ContentView()
}
