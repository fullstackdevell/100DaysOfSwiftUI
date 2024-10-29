//
//  ContentView.swift
//  WeSplit
//
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalCheckAmoount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationStack {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
            }
            
//            Section(header: Text("How much do you want to tip?")) {
//                Picker("Tip percentage", selection: $tipPercentage) {
//                    ForEach(tipPercentages, id: \.self) {
//                        Text($0, format: .percent)
//                    }
//                }
//                .pickerStyle(.segmented)
//            }
//            challenge 3
//            Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.
            Section(header: Text("How much do you want to tip?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0..<101) {
                        Text("\($0) %")
                    }
                }
                .pickerStyle(.navigationLink)
                
            }
            
//            challenge 1
//            Add a header to the third section, saying “Amount per person”
            Section(header: Text("Amount per person")) {
                Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            
//            challenge 2
//            Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
            Section(header: Text("Total amount for the check")) {
                Text(totalCheckAmoount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
        .navigationTitle("WeSplit")
        .toolbar {
            if amountIsFocused {
                Button("Done") {
                    amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
