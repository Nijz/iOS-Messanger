//
//  ChatView.swift
//  Messanger
//
//  Created by Nijen Patel on 30/05/24.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText = ""
    let user: User
    
    var body: some View {
        VStack {
            ScrollView{
                
                // header
                VStack{
                    CircularProfileImageView(user: user, size: .lg)
                    
                    VStack(spacing: 4){
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("Messanger")
                            .font(.footnote).bold()
                            .foregroundStyle(Color(.systemGray))
                    }
                }
                
                // message
                ForEach(0 ... 15, id: \.self){ message in
                    ChatMessageView(isFromCurrentUser: Bool.random())
                }
              
                
              
                
            }
            
            Spacer()
            
            // message input
            ZStack(alignment: .trailing){
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 50)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                
                Button(action: {}, label: {
                    Text("Send")
                        .fontWeight(.semibold)
                })
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView(user: User.mock_user)
}
