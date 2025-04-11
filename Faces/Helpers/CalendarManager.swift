//
//  CalendarManager.swift
//  Faces
//
//  Created by Mihail Verejan on 11.04.2025.
//



import Foundation

struct CalendarManager {
    static func generateDaysForYear(year: Int) -> [DayMood] {
        var days: [DayMood] = []
        let calendar = Calendar.current
        let today = Date()
        
        // January 1st of the given year
        guard let startDate = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) else {
            return []
        }

        for dayOffset in 0..<365 {
            guard let date = calendar.date(byAdding: .day, value: dayOffset, to: startDate) else { continue }
            
            let isPastOrToday = calendar.compare(date, to: today, toGranularity: .day) != .orderedDescending
            
            //  Past gets emoji, future gets dot
            let mood: MoodType? = isPastOrToday ? .okay : nil
            

            days.append(DayMood(date: date, mood: mood))
        }

        return days
    }
    
}
