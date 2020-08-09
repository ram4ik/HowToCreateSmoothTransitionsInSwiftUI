//
//  ContentView.swift
//  HowToCreateSmoothTransitionsInSwiftUI
//
//  Created by Ramill Ibragimov on 09.08.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var zoom = true
    @Namespace private var morph
    
    var body: some View {
        ZStack {
            if zoom {
                VStack {
                    HStack {
                        Image("user")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .scaleEffect(2)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .padding()
                            .matchedGeometryEffect(id: "morph", in: morph)
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(zoom ? 0 : 1.2, anchor: .center)
                    .matchedGeometryEffect(id: "morph", in: morph)
                    .offset(x: zoom ? -150 : 0, y: zoom ? -300 : 0)
            }
        }.onTapGesture(count: 1, perform: {
            withAnimation (
                Animation.interpolatingSpring(stiffness: 150, damping: 20)
            ) {
                zoom.toggle()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
