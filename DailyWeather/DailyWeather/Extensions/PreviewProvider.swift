//
//  PreviewProvider.swift
//  DailyWeather
//
//  Created by 金峻聖 on 2022/10/13.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let currentWeatherVM = CurrentWeatherViewModel(cityName: "Seoul")
    let forecastWeatherVM = ForeCastViewModel(cityName: "tokyo")
    let weatherInfo = WeatherInformation(coord: Coord1(lon: 126.9778, lat: 37.5683), weather: [Weather(id: 803, main: "Clouds", weatherDescription: "broken clouds", icon: "04d")], base: "stations", main: Main(temp: 283.81, feelsLike: 282.16, tempMin: 283.81, tempMax: 288.84, pressure: 1027, humidity: 47), visibility: 10000, wind: Wind1(speed: 1.39, deg: 57), clouds: Clouds1(all: 56), dt: 1665619509, sys: Sys1(type: 1, id: 5509, country: "KR", sunrise: 1665610659, sunset: 1665651535), timezone: 32400, id: 1835848, name: "Seoul", cod: 200)
}

// SAMPLE　"https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=62cbe212a87167152e0493c513f437c7"
