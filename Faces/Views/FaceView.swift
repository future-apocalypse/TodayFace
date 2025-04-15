//
//  FaceView.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//



import SwiftUI


struct FaceView: View {
    let mood: MoodType?
    let date: Date?
    
    init(mood: MoodType?, date: Date? = nil) {
        self.mood = mood
        self.date = date
    }
    
    private var isToday: Bool {
        guard let date = date else { return false }
        return Calendar.current.isDateInToday(date)
    }
    
    var body: some View {
        if let mood = mood {
            Text(mood.emotions)
            .font(.system(size: 15))
            .foregroundColor(.PrimaryText)
        } else if let date = date, Calendar.current.compare(date, to: Date(), toGranularity: .day) != .orderedDescending {
            if isToday {
                // Today with no mood - show dot and pulsating circle
                ZStack {
                    Text("•")
                        .font(.system(size: 15))
                        .foregroundColor(.PrimaryText)
                    PulsingCircleView()
                        .frame(width: 20, height: 20)
                }
            } else {
                // Past date with no mood - show X
                Text("•")
                    .font(.system(size: 15))
                    .foregroundColor(.PrimaryText)
            }
        } else {
            // Future date - show dot
            Text("•")
            .font(.system(size: 15))
            .foregroundColor(.PrimaryText)
        }
    }
}
    
   

