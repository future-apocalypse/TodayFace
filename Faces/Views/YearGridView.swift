//
//  YearGridContentView.swift
//  Faces
//
//  Created by Mihail Verejan on 16.04.2025.
//



import SwiftUI




struct YearGridView: View {
    
    @State private var showTodayView = false
    @State private var selectedMoodDay: DayMood? = nil
    private let currentYear: Int
    @State private var days: [DayMood]
    
    // Haptics
    @State private var haptics = false
    
    private var remainingDays: Int {
        let calendar = Calendar.current
        let today = Date()
        let year = calendar.component(.year, from: today)
        
        // Get the last day of the year
        guard let endOfYear = calendar.date(from: DateComponents(year: year, month: 12, day: 31)) else {
            return 0
        }
        
        // Calculate days between today and end of year (inclusive)
        // The +1 ensures we count today as well
        return calendar.dateComponents([.day], from: today, to: endOfYear).day! + 1
    }
    private let columns = Array(repeating: GridItem(.fixed(20), spacing: 4), count: 14)
    
    init() {
        self.currentYear = Calendar.current.component(.year, from: Date())
        let generatedDays = CalendarManager.generateDaysForYear(year: currentYear)
        let savedMoods = MoodStorage.loadMoods()
        
        // Merge generated days with saved moods
        self.days = generatedDays.map { day in
            if let savedMood = savedMoods.first(where: { Calendar.current.isDate($0.date, inSameDayAs: day.date) }) {
                return DayMood(date: day.date, mood: savedMood.mood)
            }
            return day
        }
    }
    
    var body: some View {
        ZStack {
            // Background
            Color.AppBackground
                .ignoresSafeArea()
            
            VStack{
                // Header
                VStack {
                    Text("\(remainingDays)")
                        .font(.system(size: 32, design: .serif))
                        .foregroundColor(.PrimaryText)
                    
                    (
                        Text("days ")
                            .italic()
                            .foregroundColor(.SecondaryText)
                            .fontWeight(.semibold)
                        +
                        Text("left in \(String(currentYear))")
                            .foregroundColor(.PrimaryText)
                    )
                    .font(.system(size: 22, design: .serif))
                }
                
                // Grid of Faces
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(days) { day in
                        if Calendar.current.isDateInToday(day.date) {
                            Button {
                                showTodayView = true
                                haptics.toggle()
                            } label: {
                                FaceView(mood: day.mood, date: day.date)
                            }
                            .buttonStyle(PlainButtonStyle())
                        } else if let mood = day.mood {
                            Button {
                                selectedMoodDay = day
                                haptics.toggle()
                            } label: {
                                FaceView(mood: mood, date: day.date)
                            }
                            .buttonStyle(PlainButtonStyle())
                        } else {
                            FaceView(mood: day.mood, date: day.date)
                        }
                    }
                }
                // Haptic Feedback
                .sensoryFeedback(.impact(flexibility: .soft, intensity: 1), trigger: haptics)
               
                
                // TabBar here
                //.padding()
                TabBar()
                .padding(.top, 50)
            }
            
        }
        
        
        .sheet(isPresented: $showTodayView) {
            TodayFaceView()
                .onDisappear {
                    // Reload moods when TodayFaceView is dismissed
                    let savedMoods = MoodStorage.loadMoods()
                    days = days.map { day in
                        if let savedMood = savedMoods.first(where: { Calendar.current.isDate($0.date, inSameDayAs: day.date) }) {
                            return DayMood(date: day.date, mood: savedMood.mood)
                        }
                        return day
                    }
                }
        }
        .sheet(item: $selectedMoodDay) { moodDay in
            MoodDetailView(mood: moodDay.mood!, date: moodDay.date)
        }
      
       
      }

    }

    

#Preview {
    YearGridView()
}

