//
//  WeatherService.swift
//  WeatherAlert
//
//  Created by KPIT on 13/07/25.
//


import Foundation
import CoreLocation

class WeatherService {
    private let apiKey = "f9ff6af384daca23dcadfdaf24af81da"

    func fetchWeather(lat: Double, lon: Double) async throws -> WeatherResponse {
        guard let url = URL(string:
            "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        ) else {
            throw URLError(.badURL)
        }
        
        print("Url: \(url)")

        let (data, _) = try await URLSession.shared.data(from: url)

        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse
    }
    
    func fetchWeatherOfCity(for city: String) async throws -> WeatherResponse {
       let apiKey = "f9ff6af384daca23dcadfdaf24af81da"
        let cityQuery = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityQuery)&appid=\(apiKey)&units=metric") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
