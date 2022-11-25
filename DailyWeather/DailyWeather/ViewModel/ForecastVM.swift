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
        
        return minTemp + "°"
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
    
    func getForecastMainColor(index: Int) -> [Color] {
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return [Color.teal, Color.blue]
        }
        
        let mainDesc = index.weather?.first?.main ?? ""
        
        return weatherBackground(mainDesc: mainDesc)
    }
    
    func weatherBackground(mainDesc: String) -> [Color] {
        switch mainDesc {
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
    
    func getForecastDate(index: Int) -> String {
        guard let index = forecastService.forecastInfo?.list?[index] else {
            return ""
        }
        
        let date = index.dtTxt ?? ""
        let stringDate = date.toDate() ?? Date()
        let dateString = stringDate.toString()
        
        return dateString
    }
}

extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeZone = TimeZone.current
        let timeZoneIdentifier = timeZone.identifier
        dateFormatter.timeZone = TimeZone(identifier: timeZoneIdentifier)
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM / dd"
        let timeZone = TimeZone.current
        let timeZoneIdentifier = timeZone.identifier
        dateFormatter.timeZone = TimeZone(identifier: timeZoneIdentifier)
        return dateFormatter.string(from: self)
    }
}
