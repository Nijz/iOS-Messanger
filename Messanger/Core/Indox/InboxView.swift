//
//  InboxView.swift
//  Messanger
//
//  Created by Nijen Patel on 28/05/24.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        Image("rk")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                        
                        Text("Chats")
                            .font(.title).bold()
                        
                        Spacer()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
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
