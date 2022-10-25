//
//  WelcomeV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/25.
//

import SwiftUI

struct WelcomeV: View {
    
    var body: some View {
        VStack {
            VStack {
                Text("Daily Weatherへようこそ")
                    .bold().font(.title)
                
                Text("確認したい地域の地名をご記入ください")
                    .bold()
                    .padding()
                
                Text("※ 都市名は英語でご記入お願い致します")
                    .font(.caption)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WelcomeV_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeV()
    }
}
