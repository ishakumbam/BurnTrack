//
//  SplashView.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var appState: AppState
    @State private var showAuth = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .gray.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 28) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 72))
                    .foregroundStyle(.orange)
                Text("BurnTrack")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.white)
                Text("Track calories burned, workouts, and goals.")
                    .foregroundStyle(.white.opacity(0.7))

                Button("Get Started") { showAuth = true }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
            }
            .padding()
        }
        .sheet(isPresented: $showAuth) {
            AuthView { appState.isAuthenticated = true }
                .presentationDetents([.large])
        }
    }
}