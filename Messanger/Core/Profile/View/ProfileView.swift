//
//  ProfileView.swift
//  Messanger
//
//  Created by Nijen Patel on 29/05/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State var selectPhotoPicker = false
    @StateObject var viewModel = ProfileViewModel()
  
    let user: User
    
    var body: some View {
        VStack{
            // header
            VStack{
                PhotosPicker(selection: $viewModel.selectedItem) {
                    
                    if let profileImage = viewModel.profileImage{
                        
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                        
                    } else {
                        
                        CircularProfileImageView(user: user, size: .xlg)
                        
                    }
                }
                
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            // lists
            List{
                
                Section{
                    ForEach(SettingsOptionViewModel.allCases){ option in
                        HStack{
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(option.colors))
                            
                            Text(option.title)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                
                        }
                    }
                }
                
                Section{
                    Button("Log Out"){
                        Service.shared.signout()
                    }
                    
                    Button("Delete Account"){
                        
                    }
                }
                .fontWeight(.bold)
                .foregroundStyle(Color(.systemRed))
            }
        }
    }
}

#Preview {
    ProfileView(user: User.mock_user)
}
