//
//  CurrentDetailV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/24.
//

import SwiftUI

struct CurrentDetailV: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel

    var cityName: String
    
    var body: some View {
            detailArea
    }
}

struct CurrentDetailV_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDetailV(cityName: "Tokyo")
            .preferredColorScheme(.dark)
            .environmentObject(CurrentWeatherViewModel())
    }
}

extension CurrentDetailV {
    private var detailArea: some View {
        VStack(spacing: 25) {
            detailRowTop
            detailRowMid
            detailRowBot
        }
    }
    
    private var detailRowTop: some View {
        HStack(spacing: 25) {
            CurrenDetailCell(systemName: L10n.Resources.Image.person, description: L10n.Localizable.weatherFeelsLike, function: vm.getCurrentFeelTemp(cityName: cityName))
            CurrenDetailCell(systemName: L10n.Resources.Image.humidity, description: L10n.Localizable.weatherHumidity, function: vm.getCurrentHumidity(cityName: cityName))
        } 
    }
    
    private var detailRowMid: some View {
        HStack(spacing: 25) {
            CurrenDetailCell(systemName: L10n.Resources.Image.pressure, description: L10n.Localizable.weatherAtmoPress, function: vm.getCurrentPressure(cityName: cityName))
            CurrenDetailCell(systemName: L10n.Resources.Image.windSpeed, description: L10n.Localizable.weatherWindSpeed, function: vm.getCurrentWindSpeed(cityName: cityName))
        }
    }
    
    private var detailRowBot: some View {
        HStack(spacing: 25) {
            CurrenDetailCell(systemName: L10n.Resources.Image.sunrise, description: L10n.Localizable.weatherSunRise, function: vm.getCurrentSunrise(cityName: cityName))
            CurrenDetailCell(systemName: L10n.Resources.Image.sunset, description: L10n.Localizable.weatherSunSet, function: vm.getCurrentSunset(cityName: cityName))
        }
    }
}
