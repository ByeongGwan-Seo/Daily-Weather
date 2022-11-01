//
//  DailyWeatherApp.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/09/28.
//

import SwiftUI

//기동시에 가장 먼저 표시되는 화면
@main
struct DailyWeatherApp: App {
    
    @StateObject var vm = CurrentWeatherViewModel(cityName: "tokyo")

    var body: some Scene {
        WindowGroup {
            SplashScreenV()
        }
    }
}
