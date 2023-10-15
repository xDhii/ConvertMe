//
//  ContentView.swift
//  ConvertMe
//
//  Created by Adriano Valumin on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var temperature:Double?
    @State var temperatureUnit = "Fahrenheit"
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var celsiusToFarenheit:Double {
        let celsius:Double = temperature ?? 0
        let farenheit:Double = celsius * 1.8 + 32
        return farenheit
    }
    
    var celsiusToKelvin:Double {
        let celsius:Double = temperature ?? 0
        let kelvin:Double = celsius + 273.15
        return kelvin
    }
    
    var convertedTemperature: Double {
        if temperature != nil {
            if temperatureUnit == "Fahrenheit" {
                return celsiusToFarenheit
            } else if temperatureUnit == "Kelvin" {
                return celsiusToKelvin
            } else {
                return temperature ?? 0
            }
        }
        return 0
    }

        var body: some View {
            NavigationStack {
                Form {
                    Section("Temperature Conversion") {
                        TextField("Input temperature in Celsius", value: $temperature, format: .number)
                        Picker("Unit", selection: $temperatureUnit) {
                            ForEach(temperatureUnits, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.segmented)
                        Text("Converted Value: \(convertedTemperature.formatted())º \(temperatureUnit)")
                    }
                }.navigationTitle("ConvertMe")
            }
        }
    }

#Preview {
    ContentView()
}
