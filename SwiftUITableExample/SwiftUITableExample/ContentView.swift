//
//  ContentView.swift
//  SwiftUITableExample
//
//  Created by irna fitriani on 18/12/23.
//

import SwiftUI

struct Quote: Codable, Identifiable {
    let id: UUID = UUID()
    let q: String
}

struct ContentView: View {
  @State private var quotes: [Quote] = []
   
  var body: some View {
    List {
      ForEach(quotes) { quote in
        Text(quote.q)
      }
    }
    .onAppear {
      Task {
        do {
          quotes = try await NetworkManager.shared.getQuote()
        } catch {
          print("Error fetching quotes: \(error)")
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
