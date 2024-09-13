//
//  ChatMessageView.swift
//  Messanger
//
//  Created by Nijen Patel on 30/05/24.
//

import SwiftUI

struct ChatMessageView: View {
    
    let isFromCurrentUser: Bool
    
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                
                Text("Always think of Me and become My devotee. Worship Me and offer your homage unto Me. Thus you will come to Me without fail.")
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundStyle(Color(.white))
                    .clipShape(ChatBubbleView(isFromCurrentUser: true))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
                  
            } else {
                HStack(alignment: .bottom, spacing: 8){
                    
                    CircularProfileImageView(user: User.mock_user, size: .xs)
                    
                    Text("Be steadfast in yoga, O Arjuna.")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubbleView(isFromCurrentUser: false))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    ChatMessageView(isFromCurrentUser: true)
}
