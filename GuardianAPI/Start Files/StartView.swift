//
//  StartView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 1/6/26.
//

import SwiftUI


struct StartView: View {

    private var introFont: Font {
        #if targetEnvironment(macCatalyst)
        .title.weight(.medium)
        #else
        .body.weight(.medium)
        #endif
    }

    var category = ["World News",
                    "US News",
                    "UK News",
                    "Australia News",
                    "Cricket",
                    "Tennis",
                    "Rugby Union",
                    "World Cup 2026"]

    @State private var selectedCategory = "Select News Category"
    @State private var isNavigating = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Introduction") {
                    Text("This app retrieves news articles from The Guardian API.  The Guardian is a British daily newspaper.\n\nUsers can select a news category from the picker below and then view the top 40 articles in the selected category, sorted by age (newest first).")
                        .font(introFont)
                        .foregroundStyle(Color.accentColor)
                }

                Section("Category Selection") {
                    Picker("Select news category:", selection: $selectedCategory) {
                        ForEach(category, id: \.self) {
                            Text($0)
                        }
                        .font(.title2).italic()
                        .bold()
                        .foregroundStyle(Color.red)
                        .padding(.horizontal, 20)
                    }
                    .pickerStyle(.inline)
                    .font(introFont)
                    .foregroundStyle(Color.blue)
                }
            }
            .frame(width: 900, alignment: .leading)
            .navigationTitle("The Guardian API")
            .preferredColorScheme(ColorScheme.light)
            .onChange(of: selectedCategory) {
                isNavigating = true
            }
            .navigationDestination(isPresented: $isNavigating) {
                ContentView(apiUrlCategory: selectedCategory)
            }
        }
    }
}




#Preview {
    StartView()
}
