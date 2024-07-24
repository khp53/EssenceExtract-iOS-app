//
//  ContentView.swift
//  EssenceExtract
//
//  Created by Karimul Hasan on 2024-07-23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewmodel = HomeViewModel()
    
    var body: some View {
        CustomNavigationView {
            VStack (alignment: .leading) {
                Text("To Summarize a Long Article Please Paste Your Text On The Text Field Below...")
                    .font(.headline)
                TextField (
                    "Paste or enter your text here...",
                    text: $viewmodel.summaryTextInputField,
                    axis: .vertical
                )
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.leading)
                .lineLimit(5...100)
                Spacer().frame(height: 25)
                Text("Or Use The File Picker Below To Pick A PDF File...")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    HomeView()
}
