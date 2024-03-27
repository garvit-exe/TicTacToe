//
//  ContentView.swift
//  TicTacToe
//
//  Created by Garvit Budhiraja on 26/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    
    var body: some View {
        
        let borderSize = CGFloat(5)
        
        Text(gameState.turnText())
            .font(.title)
            .bold()
            .padding()
        Spacer()
        
        
        VStack(spacing: borderSize) {
            
            Text("Scores:")
                .font(.title)
                .bold()
                .padding()

            HStack(spacing: borderSize) {
                            
                Text(String(format: "Player O: %d", gameState.oScore))
                    .font(.title)
                    .bold()
                    .padding()
                
                Text(String(format: "Player X: %d", gameState.xScore))
                    .font(.title)
                    .bold()
                    .padding()
            }
        }
        Spacer()
        
        VStack(spacing: borderSize) {
            ForEach(0...2, id: \.self) {
                row in
                HStack(spacing: borderSize) {
                    ForEach(0...2, id: \.self) {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.largeTitle)
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $gameState.showAlert) {
            Alert(
                title: Text(gameState.alertMessage),
                dismissButton: .default(Text("Okay"))
                {
                    gameState.resetBoard()
                }
            )
        }
        Spacer()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
