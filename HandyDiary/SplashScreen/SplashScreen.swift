//
//  SplashScreen.swift
//  HandyDiary
//
//  Created by Aditi Pancholi on 07/04/20.
//  Copyright © 2020 Aditi Mehta. All rights reserved.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var animateText : Bool = false
    @State var animatePencil : Bool = false

    
    var body: some View {
        
       ZStack() {
           
            HStack{
        
            Text("Handy Diary")
                .fontWeight(.bold)
                .font(.largeTitle)
                .opacity(self.animateText ? 1 : 0)
                .foregroundColor(self.animateText ? .white : .clear)
               .transition(.opacity)
                .animation(.easeIn(duration: 1))
                .onAppear() {
                    print("On appeared called")
                    self.animateText.toggle()
            }
            
            Image("pencil")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .offset(x: !animatePencil ? 1200 : 0 , y: !animatePencil ? 0 : 0)
                    .animation(.interpolatingSpring(mass: 1, stiffness: 70, damping: 10, initialVelocity: 3))
                    .opacity(animatePencil ? 1 : 0)
                    .onAppear(){
                        self.animatePencil.toggle()
                       
            }
                
            
        }
        
            DrawLine(lineLength: 150)
                .stroke(Color.white.opacity(0.9), lineWidth: 3)
                .animation(.easeOut(duration: 3))
            
          
        }
        
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity)
        .background(Color("HandyDiary Sub Color"))
        .edgesIgnoringSafeArea(.all)
    
}

}



struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

struct DrawLine : Shape {
    
    var lineLength : CGFloat
    
    func path(in rect: CGRect) -> Path {
         var path = Path()
               
        let centerPoint = CGPoint(x: (rect.size.width / 2.0) - 60, y: (rect.size.height / 2.0) + 25)
        
               let endPoint = CGPoint(x: centerPoint.x  + lineLength, y: centerPoint.y)
       
            path.move(to: centerPoint)
                
            path.addLine(to: endPoint)
       
               path.closeSubpath()
                      
               return path
    }
       
}


