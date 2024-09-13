//
//  CircularProfileImageView.swift
//  Messanger
//
//  Created by Nijen Patel on 29/05/24.
//

import SwiftUI

enum profileImageSize {
    case xxs
    case xs
    case sm
    case md
    case lg
    case xlg
    
    var dimension: CGFloat {
        switch self {
        case .xxs:
            return 30
        case .xs:
            return 34
        case .sm:
            return 42
        case .md:
            return 62
        case .lg:
            return 84
        case .xlg:
            return 120
        }
    }
}

struct CircularProfileImageView: View {
    
    let user : User?
    let size : profileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl{
            Image(imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemMint))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.mock_user, size: .xlg)
}
