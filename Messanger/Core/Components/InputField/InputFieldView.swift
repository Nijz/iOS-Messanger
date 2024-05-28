//
//  InputFieldView.swift
//  Messanger
//
//  Created by Nijen Patel on 28/05/24.
//

import SwiftUI

struct InputFieldView: View {
    
    @Binding var inputValue: String
    var placeholder: String
    var isSecure = false
    
    var body: some View {
        VStack{
            if isSecure {
                SecureField(placeholder, text: $inputValue)
            } else {
                TextField(placeholder, text: $inputValue)
            }
        }
        .font(.subheadline)
        .padding(12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 24)
    }
}

#Preview {
    InputFieldView(inputValue: .constant(""), placeholder: "Enter your email")
}
