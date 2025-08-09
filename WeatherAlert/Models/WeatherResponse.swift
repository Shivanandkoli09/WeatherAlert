//
//  WeatherResponse.swift
//  WeatherAlert
//
//  Created by KPIT on 13/07/25.
//


import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: WeatherMain
    let weather: [WeatherCondition]
}

struct WeatherMain: Codable {
    let temp: Double
    let humidity: Int
}

struct WeatherCondition: Codable {
    let main: String
    let description: String
    let icon: String
}
