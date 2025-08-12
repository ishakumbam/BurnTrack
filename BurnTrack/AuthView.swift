//
//  AuthView.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import SwiftUI

struct AuthView: View {
    var onAuthSuccess: () -> Void
    @State private var isLogin = true
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 18) {
                Picker("Mode", selection: $isLogin) {
                    Text("Login").tag(true)
                    Text("Create Account").tag(false)
                }
                .pickerStyle(.segmented)

                if !isLogin {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .roundedField()
                }

                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .roundedField()

                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .roundedField()

                Button(isLogin ? "Login" : "Create Account") {
                    AuthStore.shared.login(email: email, password: password)
                    onAuthSuccess()
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .disabled(email.isEmpty || password.isEmpty || (!isLogin && name.isEmpty))

                Spacer()
            }
            .padding()
            .navigationTitle(isLogin ? "Login" : "Create Account")
        }
    }
}

struct RoundedField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white.opacity(0.07))
            .foregroundStyle(.white)
            .cornerRadius(12)
    }
}

extension View { func roundedField() -> some View { modifier(RoundedField()) } }

final class AuthStore {
    static let shared = AuthStore()
    private init() {}

    private let loggedInKey = "bt.loggedin"

    var isLoggedIn: Bool { UserDefaults.standard.bool(forKey: loggedInKey) }

    func login(email: String, password: String) {
        UserDefaults.standard.set(true, forKey: loggedInKey)
    }

    func logout() {
        UserDefaults.standard.set(false, forKey: loggedInKey)
    }
}