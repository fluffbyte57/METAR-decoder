//
//  ContentView.swift
//  Metar decoder
//
//  Created by Yacov Daki on 8/6/26.
//

import SwiftUI

enum Area{
    case main, subplans, settings
}

struct ContentView: View {
    @State private var currentArea: Area = .main
    @State private var metarText: String = ""
    @AppStorage("randomCounter") private var counter: Int = 0
    @State private var testVal: [String] = []
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            switch currentArea{
            case .main:
                Text("Metar Decoder").font(.largeTitle).bold()
                Spacer()
                TextField("Insert METAR", text: $metarText)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled(true)
                    .padding(.horizontal)
                //testVal.append(metarText)
                Button("Clear METAR"){
                    metarText = ""
                }.buttonStyle(.glassProminent)
                Spacer()
                Button("Save METAR") {
                    guard !metarText.isEmpty else {return}
                        testVal.append(metarText)
                        metarText = ""
                }
                
                List(testVal, id: \.self) { entry in
                    Text(entry)}.backgroundStyle(.cyan)
                
            case .subplans:
                Text("Subscription Plans").font(.largeTitle).bold()
                Spacer()
                
                Button("Increase counter"){
                    counter += 1
                }.buttonStyle(.glassProminent)
                Button("Reset counter"){
                    counter = 0
                }
                .buttonStyle(.glass)
                .tint(.red)
                Text("Counter value: \(counter)")
            //text
            case.settings:
                Text("Settings").font(.largeTitle).bold()
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .padding()
                    .bold()
                    //.preferredColorScheme(isDarkMode ? .dark : .light)
            //text
            }
            Spacer()
            Spacer()
            Spacer()
                HStack{
                    Button("Menu"){
                        print("menu button")
                        currentArea = .main
                    }
                    .buttonStyle(.glass)
                    Button("Subscription plans"){
                        print("subscription button")
                        currentArea = .subplans
                    }
                    .buttonStyle(.glass)
                    Button("Settings"){
                        print("settings button")
                        currentArea = .settings
                    }
                    .buttonStyle(.glass)
                    
                }
                .padding(5)
                .background(.ultraThinMaterial)
                .cornerRadius(30)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
