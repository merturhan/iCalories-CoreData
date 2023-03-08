//
//  ContentView.swift
//  iCalories-CoreData
//
//  Created by Mert Urhan on 9.03.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
