//
//  LoginView.swift
//  Messanger
//
//  Created by Nijen Patel on 28/05/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                // logo image
                Image("messanger")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding()
                
                // inout fields
                VStack(spacing: 12){
                    
                    InputFieldView(inputValue: $email,
                                   placeholder: "example@gmail.com")
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    
                    InputFieldView(inputValue: $password,
                                   placeholder: "enter your password",
                                   isSecure: true)
                    
                }
                
                // forget password
                Button {
                    print("Forget Password")
                } label: {
                    Text("Forget Password ?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                
                // login btn
                Button(action: {}, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding(.vertical)
                
                //fb login
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundStyle(Color(.systemGray))
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    
                    Text("continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                Divider()
                //sign up link
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                }label: {
                    HStack(spacing: 3){
                        Text("Don't have an Account?")
                            
                        Text("Create Account")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
