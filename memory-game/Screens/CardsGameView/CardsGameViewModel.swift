//
//  CardsGameViewModel.swift
//  memory-game
//
//  Created by Denis Coder on 2/5/24.
//

import SwiftUI

final class CardViewModel: ObservableObject {
    
    @Published var arrayCards: [Card] = [
        Card(name: "monkey", image: "monkey", showContent: false),
        Card(name: "monkey", image: "monkey", showContent: false),
        Card(name: "lion", image: "lion", showContent: false),
        Card(name: "lion", image: "lion", showContent: false),
        Card(name: "panda", image: "panda", showContent: false),
        Card(name: "panda", image: "panda", showContent: false)
    ]
    
    @Published var revealedCards: [Card] = [];
    @Published var foundParnersCards: [String] = [];
    @Published var isAfterMatch: Bool = false;
    
    init(){
        self.arrayCards.shuffle();
    }
    
    private func revealCard(card: inout Card) -> Void{
        card.showContent = true;
    }
    
    private func unrevealCard(card: inout Card) -> Void{
        card.showContent = false;
    }
    
    
    public func cardClick(card:Card) -> Void {
        
        //Veryfing if the card who was clicked is already revelead
        //If it is not, then reveal it
        if let index = self.arrayCards.firstIndex(where: {$0.id == card.id}){
            if(!self.arrayCards[index].showContent){
                revealCard(card: &self.arrayCards[index]);
                self.verifyCard(card: self.arrayCards[index]);
            }
        }
    }
    
    private func verifyCard(card:Card) -> Void{
        
        //If my current card is diferent from the found partners i proceed
//        if let index = (self.foundParnersCards.firstIndex(where: {$0 != card.name})){
//            isAfterMatch = true;
//        }
        
        //veryfing if there is no cards on my revealedCards
        //and if not just add a card
        if(self.revealedCards.isEmpty){
            self.revealedCards.append(card);
            return;
        }
        
        
        //Adding a card after Match
        if(self.revealedCards.last!.name != card.name && isAfterMatch){
            self.revealedCards.append(card);
            self.isAfterMatch = false;
            print("adding after a match")
            return
        }
        
        
        //MATCHED
        //if we have something in the array and the previous item
        //is the same of my current item we should add it
        if(self.revealedCards.last!.name == card.name){
            self.revealedCards.append(card);
            //adding partner card
            self.foundParnersCards.append(card.name)
            
            self.isAfterMatch=true;
            print("adding matched")
            return
        }
        
        //WRONG MATCH
        if(self.revealedCards.last!.name != card.name && !isAfterMatch){
            //unrevealing cards that was not found match
            
            //veryfing if current card is already a match
            //if it is just get out of function
            if foundParnersCards.contains(self.revealedCards.last!.name){
                self.isAfterMatch = true;
                return;
            }
            
            
            let lastCardIdRevealedCards = self.revealedCards.last!.id
            
            if let index = self.arrayCards.firstIndex(where: {$0.id == lastCardIdRevealedCards}){
                self.unrevealCard(card: &self.arrayCards[index])
            }
            
            if let index = self.arrayCards.firstIndex(where: {$0.id == card.id}){
                self.unrevealCard(card: &self.arrayCards[index])
            }
            
            
            print("removing \(self.revealedCards.last?.name) card from array")
            self.revealedCards.removeLast()
            
            //veryfing if play is after a match of cards
            if(self.revealedCards.count % 2 == 0 && self.revealedCards.count != 0){
                self.isAfterMatch = true
            }else {
                self.isAfterMatch = false
            }
            
          
            return
            
            
        }
    }
    
}
