//
//  HistoryStore.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import Foundation

final class HistoryStore: ObservableObject {
    static let shared = HistoryStore()
    private init() { load() }

    @Published var logs: [WorkoutLog] = [] { didSet { save() } }

    func add(_ log: WorkoutLog) { logs.insert(log, at: 0) }

    private let key = "bt.history.v1"
    private func save() {
        if let data = try? JSONEncoder().encode(logs) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([WorkoutLog].self, from: data) {
            logs = decoded
        }
    }
}

final class GoalsStore: ObservableObject {
    static let shared = GoalsStore()
    private init() { load() }

    @Published var goals: [Goal] = [] { didSet { save() } }

    func add(title: String, weeklyMinutes: Int, targetCalories: Int) {
        goals.append(Goal(id: UUID(), title: title, weeklyMinutes: weeklyMinutes, targetCalories: targetCalories))
    }

    private let key = "bt.goals.v1"
    private func save() {
        if let data = try? JSONEncoder().encode(goals) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Goal].self, from: data) {
            goals = decoded
        }
    }
}