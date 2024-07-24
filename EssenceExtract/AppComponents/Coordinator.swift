//
//  Coordinator.swift
//  EssenceExtract
//
//  Created by Karimul Hasan on 2024-07-23.
//
import SwiftUI

class Coordinator: NSObject, UIDocumentPickerDelegate {
    var didPickDocument: (Result<[URL], Error>) -> Void
    
    init(didPickDocument: @escaping (Result<[URL], Error>) -> Void) {
        self.didPickDocument = didPickDocument
    }
    
    private func documentPicker(_ controller: UIDocumentViewController, didPickDocumentsAt urls: [URL]){
        didPickDocument(.success(urls))
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        didPickDocument(.failure(URLError(.cancelled)))
    }
}
