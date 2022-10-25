//
//  WelcomeV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/25.
//

import SwiftUI

struct WelcomeV: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack {
                Text("Daily Weatherへようこそ")
                    .bold().font(.title)
                
                Text("顧客様の現在位置を表示できるよう、現在位置共有をお願い致します。")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeV_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeV()
    }
}
