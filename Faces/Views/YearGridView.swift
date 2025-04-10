//
//  ContentView.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//

import SwiftUI

struct YearGridView: View {
    let days = Array(repeating: MoodType.neutral, count: 365)
    let columns = [GridItem(.fixed(7)) // ← Emoji width
    ] + Array(repeating: GridItem(.fixed(20), spacing: 2), count: 13)
    
    var body: some View {
        ZStack {
            // Background
            Color.appBackground
                .ignoresSafeArea()
            
            VStack {
                // Header
                VStack{
                    Text("312")
                        .font(.system(size: 32, design: .serif))
                        .foregroundColor(.primaryText)
                    
                    (
                        Text("days ")
                            .font(.system(size: 24, design: .serif))
                            .italic()
                            .foregroundColor(.secondaryText)
                        +
                        Text("left in 2025")
                            .font(.system(size: 24, design: .serif))
                            .foregroundColor(.primaryText)
                    )
                }
                .padding(.top)

                // Grid of Faces
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(0..<days.count, id: \.self) { index in
                            FaceView(mood: days[index])
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    YearGridView()
}
