//
//  HexagonView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 19/04/2022.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
      
      Image(systemName: "hexagon")
        .symbolVariant(.fill)
        .foregroundColor(.blue)
        .font(.system(size: 200))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
