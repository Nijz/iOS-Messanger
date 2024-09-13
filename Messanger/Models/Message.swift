//
//  Message.swift
//  Messanger
//
//  Created by Nijen Patel on 04/06/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

struct Message: Identifiable, Codable, Hashable {
    
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
}
