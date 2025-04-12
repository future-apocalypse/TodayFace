//
//  MoodStorage.swift
//  Faces
//
//  Created by Mihail Verejan on 11.04.2025.
//

import Foundation

class MoodStorage {
    private static let userDefaultsKey = "savedMoods"
    
    static func saveMood(_ mood: MoodType, for date: Date) {
        var moods = loadMoods()
        if let index = moods.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
            moods[index].mood = mood
        } else {
            moods.append(DayMood(date: date, mood: mood))
        }
        
        if let encoded = try? JSONEncoder().encode(moods) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    static func loadMoods() -> [DayMood] {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey),
              let decodedMoods = try? JSONDecoder().decode([DayMood].self, from: data) else {
            return []
        }
        return decodedMoods
    }
    
    static func getMood(for date: Date) -> MoodType? {
        let moods = loadMoods()
        return moods.first(where: { Calendar.current.isDate($0.date, inSameDayAs: date) })?.mood
    }
}