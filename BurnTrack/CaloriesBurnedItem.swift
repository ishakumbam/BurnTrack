//
//  CaloriesBurnedItem.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import Foundation

// API Ninjas /v1/caloriesburned response item
struct CaloriesBurnedItem: Codable, Identifiable, Hashable {
    // The API returns an array of items. We'll synthesize an ID from fields.
    var id: String { "\(name)-\(duration_min)-\(met)" }

    let name: String
    let activity: String?
    let calories_per_hour: Double
    let duration_min: Double
    let total_calories: Double
    let met: Double
}

// Local model stored in history
struct WorkoutLog: Codable, Identifiable, Hashable {
    let id: UUID
    let date: Date
    let activity: String
    let durationMin: Double
    let weightKg: Double?
    let calories: Double
}

struct Goal: Codable, Identifiable, Hashable {
    let id: UUID
    var title: String
    var weeklyMinutes: Int
    var targetCalories: Int
}