//
//  ContentView.swift
//  RoundandRound
//
//  Created by Joker on 2020/4/25.
//  Copyright © 2020 ntoucs. All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation
struct ContentView: View {
    @State private var rotateDegree: Double = 0
    @State private var playorpause = true
    @State private var ButtonIcon = "play.circle"
    @State var looper: AVPlayerLooper?
    @State var player = AVQueuePlayer()
    var timeObserverToken: Any?
    
    var body: some View {
        VStack{
            ZStack{
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .frame(width:300, height: 300)
                    .cornerRadius(.infinity)
                    .shadow(radius: 30)
                Image(systemName: "play")
                    .resizable()
                    .frame(width:30, height: 30)
                    .offset(y: -180)
                    .foregroundColor(Color(red: 208/255, green: 166/255, blue: 12/255))
                    .rotationEffect(.degrees(rotateDegree))
                    .onAppear {
                        let fileUrl = Bundle.main.url(forResource: "Crispy_In_Circles", withExtension: "mp3")!
                        let item = AVPlayerItem(url: fileUrl)
                        self.looper = AVPlayerLooper(player: self.player, templateItem: item)
                        self.player.volume = 0.3
                }
            }
            HStack{
            Button(action:{
                if self.playorpause == true{
                    self.player.play()
                    self.playorpause = false
                    self.ButtonIcon = "pause.circle"
                }
                else{
                    self.player.pause()
                    self.playorpause = true
                    self.ButtonIcon = "play.circle"
                }
            }){
                Image(systemName: self.ButtonIcon)
                .resizable()
                .frame(width:40, height: 40)
                .foregroundColor(Color.orange)
            }
            .buttonStyle(PlainButtonStyle())
                Slider(value: self.$rotateDegree, in: 0...360)
            .accentColor(Color.orange)
            Text("\(Int(self.rotateDegree))")
            .font(.system(size: 30))
            .foregroundColor(.orange)
            }.offset(y: 50)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


