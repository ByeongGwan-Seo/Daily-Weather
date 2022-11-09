//
//  ForecastM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import Foundation

// MARK: - Welcome
struct Forecast: Codable {
    let cod: String
    let message, cnt: Int
    let list: [ForecastList]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct ForecastList: Codable {
    let dt: Int
    let main: MainClass
    let weather: [ForecastWeather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt
        case rain
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure
        case seaLevel
        case grndLevel
        case humidity
        case tempKf
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct ForecastWeather: Codable {
    let id: Int
    let main: MainEnum
    let weatherDescription: Description
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription
        case icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
