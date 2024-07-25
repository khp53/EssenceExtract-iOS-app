//
//  ContentView.swift
//  EssenceExtract
//
//  Created by Karimul Hasan on 2024-07-23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewmodel = HomeViewModel()
    @FocusState var isArticleField: Bool
    
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
                .focused($isArticleField)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.leading)
                .lineLimit(5...100)
                .toolbar {
                    if isArticleField {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                isArticleField = false
                            }
                        }
                    }
                    
                }
                Spacer().frame(height: 25)
                Text("Or Use The File Picker Below To Pick A PDF File...")
                    .font(.headline)
                HStack {
                    TextField("", text: $viewmodel.fileName, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .disabled(true)
                    Spacer().frame(width: 15)
                    Button(action: {
                        viewmodel.presentDocumentPicker()
                    }) {
                        Text("Select File")
                            .font(.headline)
                    }.fileImporter(isPresented: $viewmodel.showingDocPicker, allowedContentTypes: [.pdf]) { result in
                        viewmodel.handleDocPicker(result: result)
                    }
                }
                Spacer().frame(height: 25)
                Button(action: {
                    if viewmodel.selectedPDFUrl == nil && !viewmodel.summaryTextInputField.isEmpty {
                        print("sending pasted text to summarize")
                    }
                    else if viewmodel.summaryTextInputField.isEmpty && viewmodel.selectedPDFUrl != nil {
                        print("sending file to process")
                    }
                    else if !viewmodel.summaryTextInputField.isEmpty && viewmodel.selectedPDFUrl != nil {
                        print("choose only one thing")
                    }
                    else {
                        print("choose something")
                    }
                })
                {
                    Text("Generate Summary")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                    
                }.background(Color.blue)
                Spacer()
            }
            //            .sheet(isPresented: $viewmodel.showingDocPicker, content: {
            //                DocumentPicker(didPickDocument: viewmodel.handleDocPicker)
            //            })
        }
    }
}

#Preview {
    HomeView()
}
