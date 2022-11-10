//
//  MainView2.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/10.
//

import SwiftUI

struct MainView2: View {
    
    @State private var selectedMenu: Int = 1
    
    var body: some View {
        TabView {
            ZStack {
                LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))],
                               startPoint: .top,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                ZStack {
                    Rectangle()
                }
                .foregroundColor(Color.white.opacity(0.3))
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom)
            }
            .tabItem {
                Image(systemName: "globe")
                Text("MAIN")
            }
            Text("Search")
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("SEARCH")
            }
        }
        
    }
    
//    func weatherImage(weather: String) -> Image {
//        switch weather {
//        case "Clear":
//            return Image(systemName: "sun.max.fill")
//        case "Clouds":
//            return Image(systemName: "cloud.fill")
//        case "Rain":
//            return Image(systemName: "cloud.rain.fill")
//        case "Snow":
//            return Image(systemName: "cloud.snow.fill")
//        case "Extreme":
//            return Image(systemName: "cloud.bolt.fill")
//        default:
//            return Image(systemName: "sun.max.fill")
//        }
//    }
}

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView2()
            .preferredColorScheme(.dark)
    }
}

extension MainView2 {
    private var curruentWeatherSection: some View {
        Text("Current Weather")
    }
}
