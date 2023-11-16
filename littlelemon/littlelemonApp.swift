//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Rıdvan on 8.11.2023.
//

import SwiftUI

@main

struct littlelemonApp: App {
    
    @AppStorage("firstLaunch") private var firstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch {
                VStack {
                    Welcoming()
                    Button("READY TO EAT") {
                        firstLaunch = false
                    }
                    .fontDesign(.monospaced)
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.yellow)
                        .frame(width: 180, height: 40)
                    )
                    
                }
                .background(Color.mint)
            } else {
                Onboarding()
                    .preferredColorScheme(.light)
            }
        }
    }
}

