//
//  SettingsView.swift
//  Faces
//
//  Created by Mihail Verejan on 18.04.2025.
//

import SwiftUI

enum FrequencyNotification: String, CaseIterable {
    case always = "Always"
    case onlyWhenUnlocked = "When Unlocked"
    case never = "Never"
}

struct SettingsView: View {
    // MARK: - Properties
    
    @State private var notificationEnabled = true
    @State private var frequency = FrequencyNotification.always
    @State private var description = ""
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Background
            Color.AppBackground
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // Custom title
                Text("Settings")
                    .font(.largeTitle.bold())
                    .foregroundColor(.PrimaryText)
                    .padding(.horizontal)
                    .padding(.top, 48) // Adjust top padding for status bar space
                
                
            }
            
        }
    }
}
#Preview {
    SettingsView()
}
