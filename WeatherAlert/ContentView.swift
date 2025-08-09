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
            
            Text(viewModel.cityName)
                .font(.largeTitle)
                .bold()
            Text(viewModel.temperature)
                .font(.system(size: 48))
            
            Text(viewModel.condition)
                .font(.title2)
        }
        .padding()
        .task {
            await viewModel.getWeather()
        }
    }
}

#Preview {
    ContentView()
}
