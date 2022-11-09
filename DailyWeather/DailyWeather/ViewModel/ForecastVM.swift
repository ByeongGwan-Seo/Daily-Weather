//
//  ForecastVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import Foundation
import Combine

final class ForeCastViewModel: ObservableObject {
    @Published var forecasts: [Forecast]?

    private let forecastService: ForecastService
    private var cancellables = Set<AnyCancellable>()
    
    init(cityName: String = "tokyo") {
        self.forecastService = ForecastService(cityName: cityName)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        forecastService.$forecastInfos
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] returnedForecasts in
                self?.forecasts = returnedForecasts
            })
            .store(in: &cancellables)
    }
}
