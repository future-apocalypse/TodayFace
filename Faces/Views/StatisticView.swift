//
//  StatisticView.swift
//  Faces
//
//  Created by Mihail Verejan on 21.05.2025.
//

import SwiftUI

struct StatisticView: View {
    var body: some View {
        ZStack {
            // Background
            Color.AppBackground
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // Custom title
                Text("Statistic")
                    .font(.largeTitle.bold())
                    .foregroundColor(.PrimaryText)
                    .padding(.horizontal)
                    .padding(.top, 48) // Adjust top padding for status bar space
            }
        }
    }
}

#Preview {
    StatisticView()
}
