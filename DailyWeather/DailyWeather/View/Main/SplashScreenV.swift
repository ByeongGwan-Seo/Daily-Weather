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
    
    var body: some View {
        
        if isActive {
            WelcomeV()
        } else {
            animationSection
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .foregroundColor(.white)
        }
        
        
    }
        
}

extension SplashScreenV {
    private var animationSection: some View {
        VStack{
            VStack{
                Image(systemName: L10n.Resources.Image.globe)
                    .font(.system(size: 80))
                Text(L10n.Localizable.splashTitle)
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
    }
}
struct SplashScreenV_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenV()
    }
}
