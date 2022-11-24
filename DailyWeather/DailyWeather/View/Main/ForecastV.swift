//
//  ForecastV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastV: View {
    
    @EnvironmentObject var vm: ForeCastViewModel
    
    var body: some View {
        ScrollView {
            ForecastVRow(index: 7)
            ForecastVRow(index: 15)
            ForecastVRow(index: 23)
            ForecastVRow(index: 31)
            ForecastVRow(index: 39)
        }
    }
}

struct ForecastV_Previews: PreviewProvider {
    static var previews: some View {
        ForecastV()
            .environmentObject(dev.currentWeatherVM)
            .environmentObject(ForeCastViewModel())
    }
}
