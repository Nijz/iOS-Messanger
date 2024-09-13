//
//  InboxView.swift
//  Messanger
//
//  Created by Nijen Patel on 28/05/24.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ActiveNowView()
                    .padding(.top, 10)
                
                
                    List{
                        ForEach(viewModel.users){ chat in
                            InboxRowView(user: chat)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: UIScreen.main.bounds.height - 120)
                
            }
            .onChange(of: selectedUser,perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser{
                    ChatView(user: user)
                }
            })
            .sheet(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                       
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xs)
                        }
                        
                        Text("Chats")
                            .font(.title).bold()
                        
                        Spacer()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showNewMessageView.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                            
                    })
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
