import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "hours"
    @State private var outputUnit = "minutes"
    
    let unit = ["seconds", "minutes", "hours", "days"]
    
    var convertedValue: Double {
        // dictionary of units
        let toSeconds = [
            "seconds": 1.0,
            "minutes": 60.0,
            "hours": 3600.0,
            "days": 86400.0
        ]
        
        //  conver input to seconds
        let seconds = inputNumber * (toSeconds[inputUnit] ?? 1)
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
                    TextField( "Amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
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
            .navigationTitle("Converter")
        }
        
    }
}
    

#Preview {
    ContentView()
}
