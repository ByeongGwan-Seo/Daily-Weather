//
//  MainView2.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/10.
//

import SwiftUI

struct MainView2: View {
    
    private var twoRowGrid = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
    ]
    
    @State private var selectedMenu: Int = 1
    
    var body: some View {
        TabView {
            ZStack {
                LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))],
                               startPoint: .top,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .padding(.bottom)
                    .edgesIgnoringSafeArea(.top)
                ZStack {
                    VStack(spacing: 40) {
                        Picker(selection: $selectedMenu) {
                            Text("Today").tag(1)
                                .font(.largeTitle)
                            Text("Forecast").tag(2)
                        } label: {
                            Text("oiu")
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 300)
                        ScrollView() {
                            VStack(spacing: 80) {
                                HStack {
                                    Spacer()
                                    Text("Tokyo")
                                        .fontWeight(.heavy)
                                    Spacer()
                                    Text("Min")
                                    Text("/")
                                        .fontWeight(.bold)
                                    Text("Max")
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.primary)
                                .font(.title)
                                
                                Image(systemName: "sun.max.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                
                                VStack(spacing: 20) {
                                    HStack(alignment: .center, spacing: 30) {
                                        HStack {
                                            Image(systemName: "figure.stand")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                            VStack {
                                                Text("Feels like")
                                                Text("134")
                                            }
                                        }
                                        .padding()
                                        .background()
                                        .cornerRadius(20)
                                        .frame(width: 160)
                                        
                                        HStack {
                                            Image(systemName: "eye.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                            VStack {
                                                Text("Visibility")
                                                Text("134")
                                            }
                                        }
                                        .padding()
                                        .background()
                                        .cornerRadius(20)
                                        .frame(width: 160)
                                    }
                                    
                                    HStack(alignment: .center, spacing: 30) {
                                        HStack {
                                            Image(systemName: "figure.stand")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                            VStack {
                                                Text("Feels like")
                                                Text("134")
                                            }
                                        }
                                        .padding()
                                        .background()
                                        .cornerRadius(20)
                                        .frame(width: 160)
                           
                                        HStack {
                                            Image(systemName: "eye.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                            VStack {
                                                Text("Visibility")
                                                Text("134")
                                            }
                                        }
                                        .padding()
                                        .background()
                                        .cornerRadius(20)
                                        .frame(width: 160)
                                    }
                                    HStack(alignment: .center, spacing: 30) {
                                        HStack {
                                            Image(systemName: "figure.stand")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                            VStack {
                                                Text("Feels like")
                                                Text("134")
                                            }
                                        }
                                        .padding()
                                        .background()
                                        .cornerRadius(20)
                                        .frame(width: 160)
                                        
                                        HStack {
                                            Image(systemName: "eye.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                            VStack {
                                                Text("Visibility")
                                                Text("134")
                                            }
                                        }
                                        .padding()
                                        .background()
                                        .cornerRadius(20)
                                        .frame(width: 160)
                                    }
                                }
                            }
                        }
                    }
                }
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
        Group {
            MainView2()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
            MainView2()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

extension MainView2 {
    private var curruentWeatherSection: some View {
        Text("Current Weather")
    }
}
