//
//  ForecastVRow.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastVRow: View {
    
    @EnvironmentObject var vm: ForeCastViewModel
    
    var index: Int

    var body: some View {
            rowSection
    }
}

struct ForecastVRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastVRow(index: 1)
        .environmentObject(dev.forecastWeatherVM)
    }
}

extension ForecastVRow {
    private var rowSection: some View {
        VStack {
            topRow
                .padding(.horizontal)
            Divider()
            bottomRow
                .padding(.horizontal, 30)
        }
        .foregroundColor(Color.black)
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(
            colors:vm.getForecastMainColor(index: index),
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .cornerRadius(30)
        .padding()
        .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
    
    private var topRow: some View {
        HStack {
            Spacer()
            Text(vm.getForecastDate(index: index))
                .fontWeight(.bold)
            Spacer()
            vm.getForecastMainDesc(index: index)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Spacer()
            Text(vm.getMinTempCelcius(index: index))
            Text("/")
            Text(vm.getMaxTempCelcius(index: index))
            Spacer()
        }
    }
    
    private var bottomRow: some View {
        HStack {
            VStack(spacing: 10) {
                Text("湿度")
                Text(vm.getForecastHumidity(index: index))
            }
            Spacer()
            VStack(spacing: 10) {
                Text("体感温度")
                Text(vm.getForecastFeelsLike(index: index))
            }
            Spacer()
            VStack(spacing: 10) {
                Text("風速")
                Text(vm.getForecastWindSpeed(index: index))
            }
        }
    }
}
