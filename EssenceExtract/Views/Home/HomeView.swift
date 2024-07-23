//
//  ContentView.swift
//  EssenceExtract
//
//  Created by Karimul Hasan on 2024-07-23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        CustomNavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
    }
}

#Preview {
    HomeView()
}
