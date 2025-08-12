//
//  GoalsView.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import SwiftUI

struct GoalsView: View {
    @ObservedObject private var store = GoalsStore.shared
    @State private var title = "Cardio"
    @State private var weeklyMinutes = 150
    @State private var targetCalories = 2000

    var body: some View {
        NavigationStack {
            Form {
                Section("Create Goal") {
                    TextField("Title", text: $title)
                    Stepper("Weekly Minutes: \(weeklyMinutes)", value: $weeklyMinutes, in: 30...1500, step: 10)
                    Stepper("Target Calories: \(targetCalories)", value: $targetCalories, in: 200...20000, step: 50)
                    Button("Add Goal") { store.add(title: title, weeklyMinutes: weeklyMinutes, targetCalories: targetCalories) }
                        .tint(.orange)
                }

                Section("My Goals") {
                    ForEach(store.goals) { g in
                        VStack(alignment: .leading) {
                            Text(g.title).font(.headline)
                            Text("Weekly: \(g.weeklyMinutes) min • Target: \(g.targetCalories) kcal").foregroundStyle(.secondary)
                        }
                    }.onDelete { idx in store.goals.remove(atOffsets: idx) }
                }
            }
            .navigationTitle("Goals")
        }
    }
}