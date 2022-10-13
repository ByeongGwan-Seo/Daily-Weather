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
    
    let weatherInfo = WeatherInformation(
        weather: [
            Weather(id: 803, main: "Clouds", description: "broken", icon: "04d")
        ],
        temp: Temp(temp: 283.81, minTemp: 283.81, maxTemp: 288.84),
        name: "Seoul"
    )
}

// SAMPLE　"https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=62cbe212a87167152e0493c513f437c7"
//{"coord":{"lon":126.9778,"lat":37.5683},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"base":"stations","main":{"temp":283.81,"feels_like":282.16,"temp_min":283.81,"temp_max":288.84,"pressure":1027,"humidity":47,"sea_level":1027,"grnd_level":1020},"visibility":10000,"wind":{"speed":1.39,"deg":57,"gust":1.89},"clouds":{"all":56},"dt":1665619509,"sys":{"type":1,"id":5509,"country":"KR","sunrise":1665610659,"sunset":1665651535},"timezone":32400,"id":1835848,"name":"Seoul","cod":200}
