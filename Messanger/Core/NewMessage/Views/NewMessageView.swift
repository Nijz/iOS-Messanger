//
//  NewMessageView.swift
//  Messanger
//
//  Created by Nijen Patel on 29/05/24.
//

import SwiftUI

struct NewMessageView: View {
    
    @State private var search = ""
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    
    var body: some View {
        NavigationStack {
            ScrollView{
                InputFieldView(inputValue: $search,
                               placeholder: "To: ")
                
                Text("CONTACTS")
                    .foregroundStyle(Color(.systemGray))
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                ForEach(viewModel.users){ user in
                    VStack {
                        HStack{
                            CircularProfileImageView(user: user, size: .xs)
                                
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                
                            Spacer()
                            
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    })
                    .foregroundStyle(Color(.systemRed))
                    
                }
        }
        }
    }
}

#Preview {
    NavigationStack{
        NewMessageView(selectedUser: .constant(User.mock_user))
    }
}
