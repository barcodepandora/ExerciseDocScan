//
//  ContentView.swift
//  AppDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cameraView = CameraView()
    @State private var corners: [CGPoint] = []
    
    var body: some View {
        VStack {
            cameraView.edgesIgnoringSafeArea(.all)
            PolygonView(corners: cameraView.points!)
                .frame(width: 200, height: 200)
        }
    }
}

struct PolygonView: View {
    let corners: [CGPoint]

    init(corners: [CGPoint]) {
        self.corners = corners
    }

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: corners[0])
                for corner in corners {
                    path.addLine(to: corner)
                }
                path.closeSubpath()
            }
            .stroke(Color.green, lineWidth: 2)
        }
    }
}

#Preview {
    ContentView()
}
