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
    
    @StateObject var vm = CurrentWeatherViewModel()
    @StateObject var listVm: SearchListVM = SearchListVM()
    @StateObject var foreVm: ForeCastViewModel = ForeCastViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenV()
                .environmentObject(vm)
                .environmentObject(listVm)
                .environmentObject(foreVm)
        }
    }
}
