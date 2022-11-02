//
//  ForecastVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import Foundation

final class ForeCastViewModel: ObservableObject {
    @Published var models: [ForecastModel] = ForecastModel.foreList
}
