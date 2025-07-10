//
//  ContentView.swift
//  SpaceX Launcher Explorer
//
//  Created by Asif Seraje on 7/10/25.
//

import SwiftUI

struct ItemListView: View {
    @StateObject private var viewModel = ItemViewModel()

    // Track selected item and alert state
    @State private var selectedItem: SpaceXItems?
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            List(viewModel.items) { item in
                ItemCell(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedItem = item
                        showAlert = true
                    }
            }
            .navigationTitle("Launches")
            .onAppear {
                viewModel.fetchItems()
            }
            .alert("Launch Details", isPresented: $showAlert, presenting: selectedItem) { _ in
                Button("OK", role: .cancel) { }
            } message: { item in
                Text("""
                
                Details: \(item.details ?? "N/A")
                """)
            }
        }
    }
}


struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}

