//
//  ItemViewModel.swift
//  SpaceX Launcher Explorer
//
//  Created by Asif Seraje on 7/10/25.
//

import Combine
import Foundation

class ItemViewModel: ObservableObject {
    @Published var items: [SpaceXItems] = []
    private var cancellables = Set<AnyCancellable>()

    func fetchItems() {
        guard let url = URL(string: "https://api.spacexdata.com/v3/launches") else { return }

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.timeoutIntervalForResource = 30

        let session = URLSession(configuration: config)
        
        
        session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [SpaceXItems].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Fetch failed: \(error)")
                case .finished:
                    print("Fetch finished")
                }
            }, receiveValue: { items in
                print("Received items: \(items.count)")
                self.items.removeAll()
                self.items = items
            })
            .store(in: &cancellables)
    }
}

