//
//  PresentMeView.swift
//  Classroom_UIKit
//
//  Created by Giovanni Monaco on 31/01/22.
//

import SwiftUI

struct PresentMeView: View {
    
    var passedInLearner: Learner?
    
    private let animation = Animation.easeInOut(duration: 2.5).repeatForever()
    private let angles = Array(stride(from: 1.0, through: 360.0, by: 36.0*2))
    private let opacity = 0.15
    
    @State private var progress = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(
                    Color(uiColor: passedInLearner?.favouriteColor ?? .gray)
                )
                .opacity(opacity)
            ForEach(angles, id: \.self) { i in
                Circle()
                    .trim(from: 0.0, to: progress)
                    .foregroundColor(
                        Color(uiColor: passedInLearner?.favouriteColor ?? .gray)
                    )
                    .rotationEffect(Angle(degrees: Double(i)))
                    .opacity(opacity)
            }
            Image("\(passedInLearner?.imageName ?? "")_clear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .opacity(progress)
        }
        .onAppear {
            withAnimation(animation) {
                progress = 1.0
            }
        }
    }
}

struct PresentMeView_Previews: PreviewProvider {
    static var previews: some View {
        let learnerPreview = learners[0]
        PresentMeView(passedInLearner: learnerPreview)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}



