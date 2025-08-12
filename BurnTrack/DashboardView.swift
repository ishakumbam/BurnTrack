//
//  DashboardView.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import SwiftUI

struct DashboardView: View {
    @ObservedObject private var history = HistoryStore.shared

    var weeklyCalories: Double {
        let cal = Calendar.current
        let weekStart = cal.date(from: cal.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
        return history.logs
            .filter { $0.date >= weekStart }
            .map { $0.calories }
            .reduce(0, +)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Card(title: "This Week", subtitle: "Calories Burned", value: String(Int(weeklyCalories)), unit: "kcal")
                    Card(title: "Workouts", subtitle: "Last 7 Days", value: String(history.logs.prefix(7).count), unit: "sessions")

                    RecentList()
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct Card: View {
    let title: String; let subtitle: String; let value: String; let unit: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.white.opacity(0.8))
            HStack(alignment: .firstTextBaseline) {
                Text(value).font(.system(size: 42, weight: .bold))
                Text(unit).foregroundStyle(.white.opacity(0.7))
            }
            Text(subtitle).foregroundStyle(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(16)
    }
}

struct RecentList: View {
    @ObservedObject private var history = HistoryStore.shared
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack { Text("Recent").font(.title3).bold(); Spacer() }
            ForEach(history.logs.prefix(5)) { log in
                NavigationLink(value: log.id) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(log.activity).font(.headline)
                            Text(log.date.formatted(date: .abbreviated, time: .shortened)).font(.caption).foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("\(Int(log.calories)) kcal")
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
            }
        }
    }
}