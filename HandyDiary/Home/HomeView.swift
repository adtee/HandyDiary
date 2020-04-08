//
//  HomeView.swift
//  HandyDiary
//
//  Created by Aditi Pancholi on 08/04/20.
//  Copyright © 2020 Aditi Mehta. All rights reserved.
//

import SwiftUI

struct HomeView: View {
        @State var showSplash = true
        
        var body: some View {
            ZStack{
            SplashScreen()
            .opacity(showSplash ? 1 : 0)
            .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(Animation.easeInOut) {
                  self.showSplash = false
                }
              }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
