//
//  MoodType.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//



import SwiftUI

enum MoodType: String, CaseIterable {
    case verygood
    case good
    case okay
    case sad
    case excited
    case angry
    case emotional
    
    
    var emotions: String {
        switch self {
        case .verygood: return "😀"
        case .good: return "🙂"
        case .okay: return "😐"
        case .excited: return "🤩"
        case .sad: return "😕"
        case .emotional: return "😭"
        case .angry: return "😡"
        
        }
    }
}
