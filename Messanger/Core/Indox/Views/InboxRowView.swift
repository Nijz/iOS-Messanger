//
//  InboxRowView.swift
//  Messanger
//
//  Created by Nijen Patel on 29/05/24.
//

import SwiftUI

struct InboxRowView: View {
    let user : User
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            CircularProfileImageView(user: user, size: .md)
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.fullname)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("The meaning of Karma is in the intention. The intention behind the action is what matters. Those who are motivated only by the desire for the fruits of action are miserable, for they are constantly anxious about the results of what they do.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.systemGray))
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack{
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(Color(.systemGray))
        }
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView(user: User.mock_user)
}
