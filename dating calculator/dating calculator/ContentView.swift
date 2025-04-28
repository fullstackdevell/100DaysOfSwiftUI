//
//  ContentView.swift
//  dating calculator
//
//

import SwiftUI

struct ContentView: View {
    
    let startDate = Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 25, hour: 22, minute: 30, second: 0))!
    
    @State private var now = Date()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startDate, to: now)
        
        let timeData: [(String, Int)] = [
                    ("Years", components.year ?? 0),
                    ("Months", components.month ?? 0),
                    ("Days", components.day ?? 0),
                    ("Hours", components.hour ?? 0),
                    ("Minutes", components.minute ?? 0),
                    ("Seconds", components.second ?? 0)
                ]
   
        ZStack {
            
                    VStack(spacing: 10) {
                        
                        HStack {
                            Text("💗")
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("25.03.2025")
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                        }
                        .padding(20)
                        
                        Spacer()
                        
                        Text("days together💗")
                            .font(.system(size: 58, weight: .bold))
                            .padding(.bottom, 30)
                        
                        ForEach(timeData, id: \.0) { (label, value) in
                                HStack(spacing: 10) {
                                    Text("\(value)")
                                        .font(.system(size: 38, weight: .bold))
                                        .contentTransition(.numericText())
                                        .animation(.easeInOut, value: value)

                                    Text(label.lowercased())
                                        .font(.system(size: 38, weight: .bold))
                                }
                            }
                        
                        Spacer()
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onReceive(timer) { input in
                    now = input
                }
    }
}

#Preview {
    ContentView()
}
