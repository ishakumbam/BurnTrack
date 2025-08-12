//
//  ProfileView.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import SwiftUI

struct ProfileView: View {
    @ObservedObject private var history = HistoryStore.shared
    @State private var showSettings = false

    var totalCalories: Int { Int(history.logs.map { $0.calories }.reduce(0, +)) }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Image(systemName: "person.crop.circle.fill").font(.system(size: 48)).foregroundStyle(.orange)
                        VStack(alignment: .leading) {
                            Text("Athlete").font(.headline)
                            Text("Total Burned: \(totalCalories) kcal").foregroundStyle(.secondary)
                        }
                    }
                }

                Section("History") {
                    ForEach(history.logs) { log in
                        VStack(alignment: .leading) {
                            HStack { Text(log.activity).bold(); Spacer(); Text("\(Int(log.calories)) kcal") }
                            Text(log.date.formatted(date: .abbreviated, time: .shortened)).foregroundStyle(.secondary)
                        }
                    }
                    .onDelete { idx in history.logs.remove(atOffsets: idx) }
                }

                Section { Button("Settings") { showSettings = true } }
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showSettings) { SettingsView() }
        }
    }
}

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var appState: AppState
    @State private var apiKey = (Bundle.main.infoDictionary?["API_NINJAS_KEY"] as? String) ?? ""

    var body: some View {
        NavigationStack {
            Form {
                Section("API Key (Info.plist)") {
                    Text(apiKey.isEmpty ? "No key found. Add API_NINJAS_KEY to Info.plist." : apiKey)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Section("Danger Zone") {
                    Button("Log Out", role: .destructive) {
                        AuthStore.shared.logout(); appState.isAuthenticated = false; dismiss()
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Done") { dismiss() } } }
        }
    }
}