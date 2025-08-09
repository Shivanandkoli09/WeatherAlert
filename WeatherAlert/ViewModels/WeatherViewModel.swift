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

    func getWeather() async {
        do {
            let weather = try await service.fetchWeather(lat: 28.6139, lon: 77.209) // Example: Delhi
            cityName = weather.name
            temperature = "\(Int(weather.main.temp))°C"
            condition = weather.weather.first?.main ?? "N/A"
        } catch {
            print("Error fetching weather: \(error.localizedDescription)")
        }
    }
}
