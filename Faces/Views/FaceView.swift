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
    
    var body: some View {
        if let mood = mood {
            Text(mood.emotions)
            .font(.system(size: 15))
            .foregroundColor(.PrimaryText)
        } else if let date = date, Calendar.current.compare(date, to: Date(), toGranularity: .day) != .orderedDescending {
            // Past date with no mood show dot
            Text("⨯")
                .foregroundColor(.PrimaryText)
                .font(.system(size: 15))
            .foregroundColor(.PrimaryText)
        }
        else {
            // Future date - show dot
            Text("•")
            .font(.system(size: 15))
            .foregroundColor(.PrimaryText)
        }
    }
}
    
   

