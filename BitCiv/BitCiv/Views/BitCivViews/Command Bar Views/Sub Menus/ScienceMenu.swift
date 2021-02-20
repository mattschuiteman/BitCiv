//
//  ScienceMenu.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 12/16/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct MenuContent: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    let menuClose: () -> Void
    
    let geometryWidth: CGFloat
    let geometryHeight: CGFloat
    
    let symbol: String
    let title: String
    let message: String
    
    var emojis: [String]
    var gains: [Int]
    
    let cost: Int
    @State var purchaseFailed = false
    
    var body: some View {
        
        VStack {
            
            Text("\(symbol)").font(.title)
            Text("\(title)").font(.title2)
            Text("\(message)").scaledToFit()
            
            Divider()
            
            VStack {
                
                ForEach(0..<emojis.count) {index in
                    
                    HStack {
                        
                        Text("+ \(gains[index])")
                        
                        displayIcon(emoji: emojis[index]).frame(width: geometryWidth / viewDivisor, height: geometryHeight / viewDivisor, alignment: .center)
                        
                        Text("per turn")
                    }
                }
                
                Button(action: {
                    
                    if viewModel.science >= cost {
                        viewModel.handleScience(title: title)
                        purchaseFailed = false
                        self.menuClose()
                    }
                    
                    else {
                        purchaseFailed = true
                    }
                    
                },
                    label: {
                        
                        ZStack {
                            
                            if !purchaseFailed {
                        
                                HStack {
                                    
                                    Text("- \(cost)")
                                    
                                    viewModel.scienceIcon.frame(width: geometryWidth / viewDivisor, height: geometryHeight / viewDivisor, alignment: .center)
                                    
                                }
                                
                            }
                            
                            else {
                                
                                VStack {
                                
                                    HStack {
                                        
                                        Text("- \(cost)")
                                        
                                        viewModel.scienceIcon.frame(width: geometryWidth / viewDivisor, height: geometryHeight / viewDivisor, alignment: .center)
                                        
                                        
                                    }
                                    
                                    Text("You do not have enough science to research this!").foregroundColor(Color.red).animation(.easeIn)
                                    
                                }
                                
                            }
                            
                        }
                })
            }
            
        }
    }
    
    func displayIcon(emoji: String) -> some View {
        
        if emoji == viewModel.cultureEmoji {
            return AnyView(viewModel.cultureIcon)
        }
        
        else if emoji == viewModel.scienceEmoji {
            return AnyView(viewModel.scienceIcon)
        }
        
        else if emoji == viewModel.productionEmoji {
            return AnyView(viewModel.productionIcon)
        }
        
        else if emoji == viewModel.faithEmoji {
            return AnyView(viewModel.faithIcon)
        }
        
        else if emoji == viewModel.currencyEmoji {
            return AnyView(viewModel.currencyIcon)
        }
        
        else {
            return AnyView(Text("ERROR!"))
        }
    }

    
    let viewDivisor: CGFloat = 8
}

struct SideMenu: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    let width: CGFloat
    let height: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    let symbol: String
    let title: String
    let message: String
    
    var emojis: [String]
    var gains: [Int]
    
    let cost: Int
    
    var body: some View {
        
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent(viewModel: viewModel, menuClose: menuClose, geometryWidth: width, geometryHeight: height, symbol: symbol, title: title, message: message, emojis: emojis, gains: gains, cost: cost)
                    .frame(width: self.width, height: self.height)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}

struct ScienceMenu: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    @State var menuOpen: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
        
            ScienceNode(menuOpen: menuOpen, viewModel: viewModel, width: geometry.size.width, height: geometry.size.height, symbol: "☸️", title: "Wheel", message: "The backbone of civilization? 'Wheel' find out!", emojis: [viewModel.productionEmoji, viewModel.scienceEmoji], gains: [2, 2], cost: 4)
            
        }
    }
    
}

struct ScienceNode: View {
    
    @State var menuOpen: Bool
    
    @ObservedObject var viewModel: BitCivTextGame
    
    let width: CGFloat
    let height: CGFloat
    
    let symbol: String
    let title: String
    let message: String
    
    var emojis: [String]
    var gains: [Int]
    
    let cost: Int
    
    var body: some View {
        
        ZStack {
            
            if !self.menuOpen {
                Button(action: {
                    self.openMenu()
                }, label: {
                    ScienceNodeContent(width: width, height: height, symbol: symbol)
                })
            }
            
            SideMenu(viewModel: viewModel,
                     width: width / 2,
                     height: height / 4,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu,
                     symbol: symbol,
                     title: title,
                     message: message,
                     emojis: emojis,
                     gains: gains,
                     cost: cost)
        }
        
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct ScienceNodeContent: View {
    
    var width: CGFloat
    var height: CGFloat
    
    let symbol: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: width / 8, height: height / 8, alignment: .center)
    }
    
    let cornerRadius: CGFloat = 20.0
}

struct ScienceMenu_Previews: PreviewProvider {
    static var previews: some View {
        ScienceMenu(viewModel: BitCivTextGame.init(civName: "Bavaria", civDenonym: "Bavarian", civCurrency: "Reich", civBackstory: "Traitors"))
    }
}
