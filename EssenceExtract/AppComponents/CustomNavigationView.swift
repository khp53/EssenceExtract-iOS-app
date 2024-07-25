//
//  ToolBar.swift
//  EssenceExtract
//
//  Created by Karimul Hasan on 2024-07-23.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content
            .padding()
            .navigationTitle("EssenceExtract")
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.headline)
                }
            }
        }
    }
}
