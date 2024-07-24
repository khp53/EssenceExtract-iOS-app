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
    
    @Published var showingDocPicker: Bool = false
    
    @Published var fileName: String = "Please Select a PDF"
    
    // this function handels the pdf file picking
    func handleDocPicker(result: Result<[URL], Error>){
        switch result {
        case .success(let urls):
            if let url = urls.first {
                selectedPDFUrl = url
                fileName = selectedPDFUrl?.lastPathComponent ?? "Error"
            }
        case .failure(let error):
            print("Failed to pick document: \(error.localizedDescription)")
        }
    }
    
    func presentDocumentPicker () {
        self.showingDocPicker = true
    }
}
