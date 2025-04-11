import SwiftUI

struct ContentView: View {
//    @State private var inputNumber = 0.0
    @State private var inputText = ""
    @State private var inputUnit = "hours"
    @State private var outputUnit = "minutes"
    @FocusState private var amountIsFocused: Bool
    
    let unit = ["seconds", "minutes", "hours", "days"]
    
    var convertedValue: Double {
        // dictionary of units
        let toSeconds = [
            "seconds": 1.0,
            "minutes": 60.0,
            "hours": 3600.0,
            "days": 86400.0
        ]
        
        let normalized = inputText.replacingOccurrences(of: ",", with: ".")
        let input = Double(normalized) ?? 0.0
        
        //  conver input to seconds
        let seconds = input * (toSeconds[inputUnit] ?? 1)
        // Take what the user typed, multiply it by the number of seconds in that unit
        
        // convert settings to output unit
        let result = seconds / (toSeconds[outputUnit] ?? 1)
        // divide the seconds just calculated by the number of seconds in the target unit
        return result
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(unit, id: \.self) {
                            Text($0.capitalized)
                        }
                    }
                    TextField( "Amount", text: $inputText)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                Section("Output") {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(unit, id: \.self) {
                            Text($0.capitalized)
                        }
                    }
                    Text(convertedValue.formatted())
                }
            }
            .environment(\.locale, Locale(identifier: "en_US"))
            .navigationTitle("Converter")
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
