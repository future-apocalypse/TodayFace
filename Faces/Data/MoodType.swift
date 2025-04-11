//
//  MoodType.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//



import SwiftUI

enum MoodType: String, CaseIterable {
    case happy
    case neutral
    case sad
    
    
    var emoji: String {
        switch self {
        case .happy: return "🙂"
        case .neutral: return "😐"
        case .sad: return "☹️"
        }
    }
}
