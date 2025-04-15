//
//  MoodType.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//

import SwiftUI

enum MoodType: String, CaseIterable, Codable {
    case excited
    case verygood
    case good
    case okay
    case sad
    case angry
    case emotional
    
    // Change from String to Image in future...
    var emotions: String {
        switch self {
        case .excited: return "🤩"
        case .verygood: return "😊"
        case .good: return "🙂"
        case .okay: return "😐"
        case .sad: return "😕"
        case .emotional: return "😭"
        case .angry: return "😡"
        
        }
    }
}
