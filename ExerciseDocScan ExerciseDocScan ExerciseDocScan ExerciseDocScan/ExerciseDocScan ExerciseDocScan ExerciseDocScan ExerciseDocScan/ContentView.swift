//
//  ContentView.swift
//  ExerciseDocScan ExerciseDocScan ExerciseDocScan ExerciseDocScan
//
//  Created by Juan Manuel Moreno on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func doLa() {
        myCFunction()
    }
}

#Preview {
    ContentView()
}
