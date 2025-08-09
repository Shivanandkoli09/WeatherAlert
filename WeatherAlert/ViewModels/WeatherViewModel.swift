//
//  WeatherViewModel.swift
//  WeatherAlert
//
//  Created by KPIT on 13/07/25.
//


import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var cityName: String = ""
    @Published var temperature: String = ""
    @Published var condition: String = ""

    private let service = WeatherService()
    
    func getWeatherByCityName() async {
        guard !cityName.isEmpty else { return }
        
        do {
            let weather = try await service.fetchWeatherOfCity(for: cityName)
            cityName = weather.name
            temperature = "\(Int(weather.main.temp))\u{00B0}C"
            condition = weather.weather.first?.description ?? "NA"
        } catch {
            print("Error fetching weather: \(error)")
        }
        
    }
}
