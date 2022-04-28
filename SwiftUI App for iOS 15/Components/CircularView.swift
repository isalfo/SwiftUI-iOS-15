//
//  CircularView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 28/04/2022.
//

import SwiftUI

struct CircularView: View {
  var value: CGFloat = 0.2
  @State var appear: Bool = false
  
    var body: some View {
        Circle()
        .trim(from: 0, to: appear ? value : 0)
        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
        .fill(.angularGradient(colors: [.purple, .pink, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
        .rotationEffect(.degrees(270))
        .onAppear {
          withAnimation(.spring().delay(0.5)) {
            appear = true
          }
        }
        .onDisappear {
          appear = false
        }
    }
    
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView()
    }
}
