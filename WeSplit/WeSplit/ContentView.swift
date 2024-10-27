//
//  ContentView.swift
//  WeSplit
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello world!")
                }
                Section {
                    Text("Hello world!")
                    Text("Hello world!")
                    Text("Hello world!")
                }
                Section {
                    Text("Hello world!")
                    Text("Hello world!")
                    Text("Hello world!")
                    Text("Hello world!")
                    Text("Hello world!")
                    Text("Hello world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
