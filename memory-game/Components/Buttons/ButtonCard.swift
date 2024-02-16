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
        }, label: {
            
            ZStack {
                if cardProps.showContent {
                    
                }
                Image(cardProps.image)
                    .resizable()
                    .frame(width:140, height: 251.17)
                    .animation(.easeInOut(duration: 1).delay(0)){ content in
                        content.opacity(cardProps.showContent ? 1 : 0)
                    }
                    .animation(.easeInOut(duration:1)){ content in
                        content.rotation3DEffect(Angle(degrees: cardProps.showContent ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                    }
                Image("cover")
                    .resizable()
                    .frame(width:140, height: 251.17)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .animation(.easeInOut(duration:1)){ content in
                        content.rotation3DEffect(Angle(degrees: cardProps.showContent ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                    }
                    .animation(.easeInOut(duration: 1).delay(0)){ content in
                        content.opacity(cardProps.showContent ? 0 : 1)
                    }
            }
            .onTapGesture {
                cardViewModel.cardClick(card: cardProps)
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
