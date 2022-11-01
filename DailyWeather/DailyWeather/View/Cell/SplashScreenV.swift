//
//  SplashScreenV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/01.
//

import SwiftUI

struct SplashScreenV: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @StateObject var vm = CurrentWeatherViewModel(cityName: "tokyo")
    
    var body: some View {
        
        if isActive {
            WelcomeV(vm: vm)
        } else {
            VStack{
                VStack{
                    Image(systemName: "globe")
                        .font(.system(size: 80))
                    Text("Daily Weather")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
        }
        
        
    }
        
}

struct SplashScreenV_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenV()
    }
}
