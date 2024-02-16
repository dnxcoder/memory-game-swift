//
//  ButtonCard.swift
//  memory-game
//
//  Created by Denis Coder on 2/5/24.
//

import SwiftUI

struct ButtonCard: View {
    
    @Binding var cardProps: Card;
    @ObservedObject var cardViewModel: CardViewModel
    
    var body: some View {
        Button(action: {
           
            //cardProps.showContent.toggle()
            //print("Valor de showContent:", cardProps.showContent)
            cardViewModel.cardClick(card: cardProps);
            for card in cardViewModel.revealedCards {
                print(card.name)
                
            }
            print("-----")
           
           
        }, label: {
            if cardProps.showContent {
                VStack{
                    Image(cardProps.image)
                        .resizable()
                        .frame(width:140, height: 251.17)
                }
            }else {
                VStack{
                    Image("cover")
                        .resizable()
                        .frame(width:140, height: 251.17)
                }
            }
            
        })
    }
}

//#Preview {
//    
//    
//    @State var lionCard = Card(name: "lion", image: "lion", showContent: false) // Criando uma variável de estado
//    
//    ButtonCard(cardProps: lionCard(name: "lion", image: "lion", showContent: false))
//}
