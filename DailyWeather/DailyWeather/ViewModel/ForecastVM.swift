//
//  ForecastVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import Foundation
import Combine
import SwiftUI

final class ForeCastViewModel: ObservableObject {
    @Published var forecast: Forecast?

    private let forecastService: ForecastService
    private var cancellables = Set<AnyCancellable>()
    
    init(cityName: String = "Tokyo") {
        self.forecastService = ForecastService(cityName: cityName)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        forecastService.$forecastInfo
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] returnedForecast in
                self?.forecast = returnedForecast
            })
            .store(in: &cancellables)
    }
    
    func getForecastweather(cityName: String) {
        forecastService.getForecast(cityName: cityName)
    }
    
    func getMinTempCelcius(index: Int) -> String {
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return ""
        }
        let minTempK: Double = index.main?.tempMin ?? 0
        let minTemp: String = String(format: "%.1f", minTempK - 273.15)
        
        return minTemp
    }
    
    func getMaxTempCelcius(index: Int) -> String {
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return ""
        }
        let maxTempK: Double = index.main?.tempMax ?? 0
        let maxTemp: String = String(format: "%.1f", maxTempK - 273.15)
        
        return maxTemp + "°"
    }
    
    func getForecastFeelsLike(index: Int) -> String{
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return ""
        }
        let feelsLikeK: Double = index.main?.feelsLike ?? 0
        let feelsLike: String = String(format: "%.1f", feelsLikeK - 273.15)
      
        return feelsLike + "°"
    }
    
    func getForecastHumidity(index: Int) -> String {
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return ""
        }
        let humidity: String = String(index.main?.humidity ?? 0)
        return humidity + "%"
    }
    
    func getForecastWindSpeed(index: Int) -> String {
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return ""
        }
        let windSpeed: String = String(index.wind?.speed ?? 0)
        return windSpeed + "m/s"
    }
    
    func getForecastMainDesc(index: Int) -> Image {
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return Image(systemName: "archivebox")
        }
        
        let mainDesc = index.weather?.first?.main ?? ""
        
        return weatherImage(mainDesc: mainDesc)
    }
    
    func weatherImage(mainDesc: String) -> Image {
        switch mainDesc {
        case "Clear":
            return Image(systemName: "sun.max.fill")
        case "Clouds":
            return Image(systemName: "cloud.fill")
        case "Rain":
            return Image(systemName: "cloud.rain.fill")
        case "Snow":
            return Image(systemName: "cloud.snow.fill")
        case "Extreme":
            return Image(systemName: "cloud.bolt.fill")
        default:
            return Image(systemName: "sun.max.fill")
            
        }
    }
}
