//
//  CardsGameView.swift
//  memory-game
//
//  Created by Denis Coder on 2/5/24.
//

import SwiftUI

struct CardsGameView: View {
    
    @ObservedObject var viewModel = CardViewModel();
    
    let columns: [GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
    
    
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns:columns){
                    
                    ForEach($viewModel.arrayCards, id: \.self.id) { item in
                        ButtonCard(cardProps:item, cardViewModel: viewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    CardsGameView()
}
