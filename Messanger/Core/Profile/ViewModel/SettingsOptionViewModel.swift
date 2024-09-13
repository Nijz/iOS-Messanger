//
//  SettingsOptionViewModel.swift
//  Messanger
//
//  Created by Nijen Patel on 29/05/24.
//

import Foundation
import SwiftUI

enum SettingsOptionViewModel: Int, Identifiable, CaseIterable {
    
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var id: Int { return self.rawValue }
    
    var title: String {
        
        switch self {
        case .darkMode:
            return "Dark Mode"
        case .activeStatus:
            return "Active Status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy and Safety"
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageName: String {
        
        switch self {
        case .darkMode:
            return "moon.circle.fill"
        case .activeStatus:
            return "message.badge.fill"
        case .accessibility:
            return "accessibility.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.badge.circle.fill"
        }
    }
    
    var colors: Color {
        
        switch self {
        case .darkMode:
            return .black
        case .activeStatus:
            return .green
        case .accessibility:
            return .blue
        case .privacy:
            return .purple
        case .notifications:
            return .pink
        }
    }
}
