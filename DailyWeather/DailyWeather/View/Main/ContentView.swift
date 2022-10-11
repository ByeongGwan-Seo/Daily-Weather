//
//  ContentView.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/09/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedMenu = 1
    
    var body: some View {
        TabView{
            VStack(spacing: 30) {
                Picker(selection: $selectedMenu, label: Text("Picker"), content: {
                    Text("Today").tag(1)
                        .font(.largeTitle)
                        .font(.largeTitle)
                    Text("Forecast").tag(2)
                })
                .pickerStyle(.segmented)
                .frame(width: 250)
                
                Spacer(minLength: 10)
                
                if selectedMenu == 1 {
                    Text("Seoul")
                        .font(.largeTitle)
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    HStack(alignment: .center, spacing: 50) {
                        Text("Max: 27")
                            .font(.title3)
                        Text("Min: 14")
                            .font(.title3)
                    }
                } else {
                    Text("Forecast Here")
                }
                Spacer()
            }
            .tabItem{
                Text("Main")
            }
            Text("Search")
                .tabItem{
                    Text("Search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
