//
//  ActiveNowView.swift
//  Messanger
//
//  Created by Nijen Patel on 29/05/24.
//

import SwiftUI

struct ActiveNowView: View {
    
    @StateObject var viewModel = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32){
                ForEach(viewModel.users){ user in
                    VStack{
                        ZStack (alignment: .bottomTrailing) {
                            CircularProfileImageView(user: user, size: .md)
                            
                            ZStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18, height: 18)
                                
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width: 12, height: 12)
                            }
                        }
                        Text(user.fullname)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color(.systemGray))
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}
