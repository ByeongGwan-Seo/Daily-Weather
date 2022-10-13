//
//  DailyWeatherApp.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/09/28.
//

import SwiftUI

@main
struct DailyWeatherApp: App {
    
    @StateObject var vm = CurrentWeatherViewModel(cityName: "seoul")

    var body: some Scene {
        WindowGroup {
            ContentView(vm: vm)
        }
    }
}
