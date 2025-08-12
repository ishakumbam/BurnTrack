//
//  APIError.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import Foundation

enum APIError: LocalizedError { case invalidURL, missingKey, server(String), decoding(Error) }

final class APIClient {
    static let shared = APIClient()
    private init() {}

    private var apiKey: String? {
        Bundle.main.infoDictionary?["https://api.api-ninjas.com/v1/caloriesburned"] as? String
    }

    /// Fetch calories burned estimates.
    /// - Parameters:
    ///   - activity: e.g. "running", "basketball" or "5 mph running" etc.
    ///   - durationMin: minutes (optional)
    ///   - weightKg: weight in kilograms (optional)
    func getCalories(activity: String, durationMin: Double? = nil, weightKg: Double? = nil) async throws -> [CaloriesBurnedItem] {
        guard let key = apiKey, !key.isEmpty else { throw APIError.missingKey }

        var comps = URLComponents(string: "https://api.api-ninjas.com/v1/caloriesburned")
        var items = [URLQueryItem(name: "activity", value: activity)]
        if let d = durationMin { items.append(URLQueryItem(name: "duration", value: String(d))) }
        if let w = weightKg { items.append(URLQueryItem(name: "weight", value: String(w))) }
        comps?.queryItems = items
        guard let url = comps?.url else { throw APIError.invalidURL }

        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.setValue(key, forHTTPHeaderField: "X-Api-Key")

        let (data, resp) = try await URLSession.shared.data(for: req)
        if let http = resp as? HTTPURLResponse, http.statusCode >= 400 {
            let msg = String(data: data, encoding: .utf8) ?? "HTTP \(http.statusCode)"
            throw APIError.server(msg)
        }

        do {
            return try JSONDecoder().decode([CaloriesBurnedItem].self, from: data)
        } catch {
            throw APIError.decoding(error)
        }
    }
}
