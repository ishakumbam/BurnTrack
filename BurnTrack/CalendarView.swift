//
//  CalendarView.swift
//  BurnTrack
//
//  Created by Isha Kumbam on 12/08/25.
//


import SwiftUI

struct CalendarView: View {
    @ObservedObject private var history = HistoryStore.shared
    @State private var date = Date()

    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()

                List(history.logs.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }) { log in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(log.activity).bold()
                            Text("\(Int(log.durationMin)) min")
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("\(Int(log.calories)) kcal")
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Calendar")
        }
    }
}