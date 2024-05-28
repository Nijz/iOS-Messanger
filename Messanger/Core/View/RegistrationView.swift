//
//  RegistrationView.swift
//  Messanger
//
//  Created by Nijen Patel on 28/05/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            
            Spacer()
            // logo image
            Image("messanger")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .shadow(radius: 10)
                .padding()
            
            // inout fields
            VStack(spacing: 12){
                
                InputFieldView(inputValue: $email,
                               placeholder: "example@gmail.com")
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                
                InputFieldView(inputValue: $fullname,
                               placeholder: "Enter your full name")
                
                InputFieldView(inputValue: $password,
                               placeholder: "enter your password",
                               isSecure: true)
                
                
            }
            
            Button(action: {}, label: {
                Text("Create Account")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            .padding(.vertical)

            Spacer()
            Divider()
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 3){
                    Text("Already had an account")
                        
                    Text("Log-in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            })
        }
    }
}

#Preview {
    RegistrationView()
}
