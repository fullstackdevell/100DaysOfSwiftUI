//
//  ContentView.swift
//  dating calculator
//
//

import SwiftUI

struct ContentView: View {
    
    let startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 25, hour: 22, minute: 30, second: 0))!
    
    var body: some View {
        let today = Date()
        
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startDate, to: today)
        
        let years = components.year ?? 0
        let months = components.month ?? 0
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        VStack(spacing: 10) {
            Text("days together 💗")
                .font(.largeTitle)
                    .bold()
                    .padding()
            
            Text("\(years) years")
                    .font(.title2)
                    .bold()
                
            Text("\(months) months")
                    .font(.title2)
                    .bold()
                
            Text("\(days) days")
                    .font(.title2)
                    .bold()
            
            Text("\(hours) hours")
                    .font(.title2)
                    .bold()
            
            Text("\(minutes) minutes")
                    .font(.title2)
                    .bold()
            
            Text("\(seconds) seconds")
                    .font(.title2)
                    .bold()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
//22:30
