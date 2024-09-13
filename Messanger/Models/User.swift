//
//  User.swift
//  Messanger
//
//  Created by Nijen Patel on 29/05/24.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable, Identifiable, Hashable {

    @DocumentID var id: String?
    var fullname: String
    var email: String
    var profileImageUrl: String?

}

extension User {
    static let mock_user = User(fullname: "Kiara Advani", email: "kiaraadvani@gmail.com", profileImageUrl: "rk1")
}
