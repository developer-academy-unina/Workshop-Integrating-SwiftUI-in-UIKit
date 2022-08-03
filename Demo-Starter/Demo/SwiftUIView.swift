//
//  SwiftUIView.swift
//  Demo
//
//  Created by Giovanni Monaco on 10/02/22.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .blue.opacity(0.2),
                    .blue.opacity(0.9)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            Text("SwiftUI View")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(
                    Color(UIColor.systemBackground)
                )
        }
        .ignoresSafeArea(.all)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
