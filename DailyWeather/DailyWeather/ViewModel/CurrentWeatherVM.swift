//
//  CurrentWeatherVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/06.
//

import Foundation
import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject {
    
    @Published var currentWeather: WeatherInformation? = nil
    @Published var searchText: String = ""

    private let currentWeatherService: CurrentWeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init(cityName: String = "tokyo") {
        self.currentWeatherService = CurrentWeatherService(cityName: cityName)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        currentWeatherService.$weatherInfo
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] returnedCurrentWeather in
                self?.currentWeather = returnedCurrentWeather
            })
            .store(in: &cancellables)
    }
    
    func getCurrentWeather(cityName: String) {
        currentWeatherService.getCurrentWeather(cityName: cityName)
    }
    
    func getCurrentMinTemp(cityName: String) -> String {
        let minTempK: Double = currentWeatherService.weatherInfo?.main?.tempMin ?? 0
        let minTemp: String = String(format: "%.1f", minTempK - 273.15)
        
        return minTemp + "°"
    }
    
    func getCurrentMaxTemp(cityName: String) -> String {
        let maxTempK: Double = currentWeatherService.weatherInfo?.main?.tempMax ?? 0
        let maxTemp: String = String(format: "%.1f", maxTempK - 273.15)
        
        return maxTemp + "°"
    }
    
    func getCurrentFeelTemp(cityName: String) -> String{
        guard let currentFeelK: Double = currentWeatherService.weatherInfo?.main?.feelsLike else {
            return ""
        }
        let currentFeel: String = String(format: "%.1f", currentFeelK - 273.15)
        
        return currentFeel + "°"
    }
    
    func getCurrentWeatherDesc(cityName: String) -> Image {
        let forMainDesc: String = currentWeatherService.weatherInfo?.weather?.first?.main ?? ""
        return weatherImage(forMainDesc: forMainDesc)
    }
    
    func weatherImage(forMainDesc: String) -> Image {
        switch forMainDesc {
        case "Clear":
            return Image(systemName: L10n.Resources.Image.sunFillMax)
        case "Clouds":
            return Image(systemName: L10n.Resources.Image.cloud)
        case "Rain":
            return Image(systemName: L10n.Resources.Image.rain)
        case "Snow":
            return Image(systemName: L10n.Resources.Image.snow)
        case "Extreme":
            return Image(systemName: L10n.Resources.Image.extreme)
        default:
            return Image(systemName: L10n.Resources.Image.sunFillMax)
        }
    }
    
    func getCurrentWeatherBack(cityName: String) -> [Color] {
        let forMainDesc: String = currentWeatherService.weatherInfo?.weather?.first?.main ?? ""
        return weatherBackground(forMainDesc: forMainDesc)
    }
    
    func weatherBackground(forMainDesc: String) -> [Color] {
        switch forMainDesc {
        case "Clear":
            return [Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))]
        case "Clouds":
            return [Color(#colorLiteral(red: 0.6131833196, green: 0.7450816035, blue: 0.9466372132, alpha: 1)), Color(#colorLiteral(red: 0.3644966483, green: 0.5740805268, blue: 0.7990383506, alpha: 1))]
        case "Rain":
            return [Color(#colorLiteral(red: 0.6564016938, green: 0.7317531109, blue: 0.6656756997, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
        case "Snow":
            return [Color(#colorLiteral(red: 0.6745098039, green: 0.7960784314, blue: 0.9333333333, alpha: 1)), Color(#colorLiteral(red: 0.9058823529, green: 0.9411764706, blue: 0.9921568627, alpha: 1))]
        case "Extreme":
            return [Color(#colorLiteral(red: 0.007843137255, green: 0.3137254902, blue: 0.7725490196, alpha: 1)), Color(#colorLiteral(red: 0.831372549, green: 0.2470588235, blue: 0.5529411765, alpha: 1))]
        default:
            return [Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))]
        }
    }
    
    func getCurrentHumidity(cityName: String) -> String {
        let humidity: String = String(currentWeatherService.weatherInfo?.main?.humidity ?? 0)
        
        return humidity + "%"
    }
    
    func getCurrentPressure(cityName: String) -> String {
        let pressure: String = String(currentWeatherService.weatherInfo?.main?.pressure ?? 0)
        
        return pressure + "hPa"
    }
    
    func getCurrentWindSpeed(cityName: String) -> String {
        let windSpeed: String = String(currentWeatherService.weatherInfo?.wind?.speed ?? 0)
        
        return windSpeed + "m/s"
    }
    
    func getCurrentSunrise(cityName: String) -> String {
        let sunRiseUnix = Date(timeIntervalSince1970: TimeInterval(currentWeatherService.weatherInfo?.sys?.sunrise ?? 0))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd : HH : mm"
        let result = formatter.string(from: sunRiseUnix)
        
        return result
    }
    
    func getCurrentSunset(cityName: String) -> String {
        let sunSetUnix = Date(timeIntervalSince1970: TimeInterval(currentWeatherService.weatherInfo?.sys?.sunset ?? 0))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd : HH : mm"
        let result = formatter.string(from: sunSetUnix)
        
        return result
    }
}
