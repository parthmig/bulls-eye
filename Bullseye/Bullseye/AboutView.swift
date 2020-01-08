//
//  AboutView.swift
//  Bullseye
//
//  Created by Parth Miglani on 2019-12-22.
//  Copyright © 2019 Parth Miglani. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .padding(.top, 20)
            .padding(.bottom, 20)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
        }
    }
    
    struct AboutBodyStyle: ViewModifier {
           func body(content: Content) -> some View {
               return content
                .foregroundColor(Color.black)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 20)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
           }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
                Text("Welcome to Bullseye! Here you can win points").modifier(AboutBodyStyle())
                Text("and gain bragging rights by dragging a slider!").modifier(AboutBodyStyle())
                Text("Your goal is to place the slider as close as ").modifier(AboutBodyStyle())
                Text("possible to the target value.").modifier(AboutBodyStyle())
                Text("The closer you are, the more points you score!").modifier(AboutBodyStyle())
                Text("May the force be with you!").modifier(AboutBodyStyle())
            }
            .navigationBarTitle("About Bullseye")
            .background(beige)
        }
    .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
