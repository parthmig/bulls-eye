//
//  ContentView.swift
//  Bullseye
//
//  Created by Parth Miglani on 2019-12-18.
//  Copyright © 2019 Parth Miglani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in:1...100)
    @State var score = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeStyle: ViewModifier {
           func body(content: Content) -> some View {
               return content
               .foregroundColor(Color.black)
               .font(Font.custom("Arial Rounded MT Bold", size: 18))
           }
    }
    
    struct ButtonSmallStyle: ViewModifier {
              func body(content: Content) -> some View {
                  return content
                  .foregroundColor(Color.black)
                  .font(Font.custom("Arial Rounded MT Bold", size: 12))
              }
    }
    
    var body: some View {
        VStack {
            Spacer()
            // target row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                    .fontWeight(.bold)
                    .modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            
            // slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            // hit me button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!").modifier(ButtonLargeStyle())
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("\(alertTitle())"), message: Text(
                    "The slider's value is \(sliderValueRounded())!\n" +
                    "You scored \(pointsForHit()) points this round!"), dismissButton: .default(Text("Aight!")) {
                        self.score = self.score + self.pointsForHit()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            .background(Image("Button"), alignment: .center).modifier(Shadow())
            Spacer()
            
            // score row
            HStack {
                Button(action: {
                    self.startOver()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image("Button"), alignment: .center).modifier(Shadow())
                Spacer()
                Text("Score: ").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round: ").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image("Button"), alignment: .center).modifier(Shadow())
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForHit() -> Int {
        100 - amountOff()
    }
    
    func alertTitle() -> String {
        let diff = amountOff()
        let title: String
        if diff == 0 {
            title = "HOLY! perfecto my man!"
        } else if diff < 5 {
            title = "Almost had it bruv!"
        } else if diff <= 10 {
            title = "not bad!"
        } else {
            title = "Are u dumb fam?"
        }
        return title
    }
    
    func startOver() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
