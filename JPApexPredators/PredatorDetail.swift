//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Kaiser Hussain on 7/4/25.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
        
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops:
                                            [Gradient.Stop(color: .clear,
                                                           location: 0.8),
                                             Gradient.Stop(color: .black,
                                                           location: 1)
                                            
                                            ], startPoint:
                                    .top, endPoint: .bottom)
                        }
                    
                    // Dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
//                Text("Width: \(geo.size.width)")
//                Text("Height: \(geo.size.height)")
                VStack(alignment: .leading) {
                    // Dino name
                    Text(predator.name)
                        .font(.largeTitle)
                    // Current location
                    
                    // Appears in
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self) {
                        movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    // Movie moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // Link to webpage
                    Text("Read More:")
                        .font(.caption)
                    
                    // Link ! Lesson 10 11:58 unwrap URL discussion
                    Link(predator.link, destination:
                            URL(string: predator.link)!)
                    .font(.caption)
                    .foregroundStyle(.blue)
                    
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[10])
        .preferredColorScheme(.dark)
}
