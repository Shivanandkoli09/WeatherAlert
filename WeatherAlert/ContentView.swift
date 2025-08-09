//
//  ContentView.swift
//  WeatherAlert
//
//  Created by KPIT on 11/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            
            TextField("Enter City Name", text: $viewModel.cityName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .submitLabel(.search)
                .onSubmit {
                    Task {
                        await viewModel.getWeatherByCityName()
                    }
                }
           
            Text("Weather Details")
                .font(.title)
                .bold()
                
            Text("City: \(viewModel.cityName)")
                .font(.title2)
            
            Text("Temperature: \(viewModel.temperature)")
                .font(.title2)
            
            Text("Condition: \(viewModel.condition)")
                .font(.title2)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
