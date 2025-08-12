import SwiftUI

struct CaloriesSearchView: View {
    @State private var query = "running"
    @State private var duration: Double = 30
    @State private var weight: Double = 70
    @State private var results: [CaloriesBurnedItem] = []
    @State private var isLoading = false
    @State private var errorMessage: String?   // <- renamed

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                VStack {
                    TextField("Activity (e.g. running, basketball)", text: $query)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .roundedField()

                    HStack {
                        Stepper("Duration: \(Int(duration)) min",
                                value: $duration, in: 5...180, step: 5)
                        Spacer()
                    }
                    .padding(12)
                    .background(Color.white.opacity(0.07)).cornerRadius(12)

                    HStack {
                        Stepper("Weight: \(Int(weight)) kg",
                                value: $weight, in: 30...180, step: 1)
                        Spacer()
                    }
                    .padding(12)
                    .background(Color.white.opacity(0.07)).cornerRadius(12)
                }

                Button(action: load) {
                    HStack { if isLoading { ProgressView() }; Text(isLoading ? "Searching..." : "Search") }
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .disabled(query.isEmpty || isLoading)

                if let errorMessage {                       // <- display string
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .padding(.top, 4)
                }

                List(results) { item in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.name.capitalized).font(.headline)
                        HStack {
                            Text("\(Int(item.total_calories)) kcal")
                            Text("MET: \(String(format: "%.1f", item.met))")
                        }
                        .foregroundStyle(.secondary)
                        Button("Log This Workout") {
                            let log = WorkoutLog(
                                id: UUID(),
                                date: Date(),
                                activity: item.name.capitalized,
                                durationMin: item.duration_min,
                                weightKg: weight,
                                calories: item.total_calories
                            )
                            HistoryStore.shared.add(log)
                        }
                        .buttonStyle(.bordered)
                        .tint(.orange)
                    }
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationTitle("Calories")
        }
    }

    private func load() {
        Task { @MainActor in
            isLoading = true
            errorMessage = nil
            do {
                let res = try await APIClient.shared.getCalories(
                    activity: query,
                    durationMin: duration,
                    weightKg: weight
                )
                results = res
            } catch APIError.missingKey {
                errorMessage = "Missing API_NINJAS_KEY in Info.plist"
            } catch {
                let err = error                      // avoid shadowing
                errorMessage = (err as NSError).localizedDescription
            }
            isLoading = false
        }
    }
}
