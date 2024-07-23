//
//  HomeViewModel.swift
//  EssenceExtract
//
//  Created by Karimul Hasan on 2024-07-23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var summaryTextInputField: String = ""
    
    @Published var selectedPDFUrl: URL?
}
