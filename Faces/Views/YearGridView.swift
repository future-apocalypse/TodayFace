//
//  ContentView.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//

import SwiftUI

struct YearGridView: View {
    
    private let currentYear: Int
    private let days: [DayMood]
    
    private var remainingDays: Int {
        let passedDays = days.filter { $0.mood != nil }.count
        return days.count - passedDays
    }
    
    private let columns = Array(repeating: GridItem(.fixed(20), spacing: 4), count: 14)
    
    init() {
        self.currentYear = Calendar.current.component(.year, from: Date())
        self.days = CalendarManager.generateDaysForYear(year: currentYear)
    }
    
    var body: some View {
        ZStack {
            // Background
            Color.appBackground
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 25) {
                // Header
                VStack {
                    Text("\(remainingDays)")
                        .font(.system(size: 32, design: .serif))
                        .foregroundColor(.primaryText)
                    
                    (
                        Text("days ")
                            .italic()
                            .foregroundColor(.secondaryText)
                        +
                        Text("left in \(String(currentYear))")
                            .foregroundColor(.primaryText)
                    )
                    .font(.system(size: 24, design: .serif))
                }
                .padding(.top)

                // Grid of Faces
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(days) { day in
                            FaceView(mood: day.mood)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    YearGridView()
}
