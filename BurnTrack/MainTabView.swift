//
//  MainTabView.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import SwiftUI

struct MainTabView: View {
    @State private var selected = 0

    var body: some View {
        TabView(selection: $selected) {
            DashboardView().tabItem { Label("Home", systemImage: "house.fill") }.tag(0)
            CaloriesSearchView().tabItem { Label("Calories", systemImage: "circle.dashed.inset.filled") }.tag(1)
            GoalsView().tabItem { Label("Goals", systemImage: "target") }.tag(2)
            CalendarView().tabItem { Label("Calendar", systemImage: "calendar") }.tag(3)
            ProfileView().tabItem { Label("Profile", systemImage: "person.fill") }.tag(4)
        }
        .tint(.orange)
    }
}