//
//  ForecastVRow.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastVRow: View {
    
    @EnvironmentObject var vm: ForeCastViewModel
    
    
    var body: some View {
        ScrollView {
            rowSection
            rowSection
            rowSection
            rowSection
            rowSection
        }
    }
}

struct ForecastVRow_Previews: PreviewProvider {
    
    static var previews: some View {
        ForecastVRow()
            .environmentObject(dev.forecastWeatherVM)
    }
}

extension ForecastVRow {
    private var rowSection: some View {
        VStack {
            HStack {
                Spacer()
                Text("대충날짜")
                    .font(.headline)
                Spacer()
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                Spacer()
                Text(vm.getMinTempCelcius() + "°")
                Text("/")
                Text(vm.getMaxTempCelcius() + "°")
                Spacer()
            }
            .padding(.horizontal)
            Divider()
            HStack {
                VStack(spacing: 10) {
                    Text("湿度")
                    Text("sidou")
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("体感温度")
                    Text("몇도")
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("風速")
                    Text("10.2m/s")
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors:[ Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(30)
        .padding()
        .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
}
