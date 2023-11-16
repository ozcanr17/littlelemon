//
//  Welcoming.swift
//  littlelemon
//
//  Created by Rıdvan on 15.11.2023.
//

import SwiftUI

struct Welcoming: View {
    var body: some View {
        TabView {
            VStack {
                Spacer(minLength: 100)
                Image("Logo")
                    .scaleEffect(1)
                Spacer(minLength: 30)
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 400)
                    .foregroundColor(.yellow)
                    .overlay(
                        Text("A Slice of Sunshine in Every Bite – Little Lemon, Chicago's Mediterranean Masterpiece!")
                            .padding()
                            .fontDesign(.monospaced)
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.black))
                Spacer(minLength: 200)
            }
            VStack {
                Spacer(minLength: 100)
                Image("Logo")
                        .scaleEffect(1)
                Spacer(minLength: 30)
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 400)
                    .foregroundColor(.yellow)
                    .overlay(
                        Text("A Tapestry of Tastes: Mediterranean Marvels from Grilled Fish to Divine Lemon Desserts!")
                            .padding()
                            .fontDesign(.monospaced)
                            .font(.title)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.black))
                Spacer(minLength: 200)
            }
                VStack {
                    Spacer(minLength: 100)
                    Image("Logo")
                            .scaleEffect(1)
                    Spacer(minLength: 30)
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 250, height: 400)
                        .foregroundColor(.yellow)
                        .overlay(
                            Text("Bruschetta Bliss in the Blink of an Eye! Savory Mediterranean Delights, with Lightning-Fast Delivery – Because Hunger Can't Wait!")
                                .padding()
                                .fontDesign(.monospaced)
                                .font(.title2)
                                .fontWeight(.ultraLight)
                                .foregroundColor(.black))
                    Spacer(minLength: 200)
                }
            }
            .tabViewStyle(.page)
            .background(Color.mint)
    }
}

#Preview {
    Welcoming()
}
