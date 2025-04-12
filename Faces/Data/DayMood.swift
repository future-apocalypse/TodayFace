//
//  DayMood.swift
//  Faces
//
//  Created by Mihail Verejan on 11.04.2025.
//



import Foundation



//Mood for a day
struct DayMood: Identifiable, Codable {
    var id = UUID()
    let date: Date
    var mood: MoodType?
}
