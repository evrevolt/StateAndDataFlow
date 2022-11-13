//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(timer: timer)
            
            Spacer()
            
            Button(action: {
                
                UserDefaults.standard.set(false, forKey: "isRegister")
                
                /*
                 Я понимаю, что сделал много что не так.
                 Поэтому вот вам котик =)) 
                 
                  ..........／＞　 フ.................
                 　　　　　| 　_　 _|
                 　 　　　／`ミ _x 彡
                 　　 　 /　　　 　 |
                 　　　 /　 ヽ　　 ﾉ
                 　／￣|　　 |　|　|
                 　| (￣ヽ＿_ヽ_)_)
                 　＼二つ
                 
                 */
                
            }){
                Text("Log Out")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
    }
}
