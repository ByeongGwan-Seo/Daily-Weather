//
//  ForecastVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import Foundation
import Combine

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
    
    func getMinTempCelcius() -> String{
        let minTempK: Double = forecastService.forecastInfo?.list?.first?.main?.tempMin ?? 0
        let minTemp: String = String(format: "%.1f", minTempK - 273.15)
        return minTemp
    }
    
    func getMaxTempCelcius() -> String {
        let maxTempK: Double = forecastService.forecastInfo?.list?.first?.main?.tempMax ?? 0
        let maxTemp: String = String(format: "%.1f", maxTempK - 273.15)
        return maxTemp
    }
}
