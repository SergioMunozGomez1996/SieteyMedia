//
//  Baraja.swift
//  SieteyMedia
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import Foundation
class Baraja {
    var cartas = [Carta]()
    init() {
        for p in Palo.allCases {
            for n in 1...12{
                if n != 8 && n != 9 {
                    self.cartas.append(Carta(valor: n, palo: p)!)
                }
            }
        }
    }
    
    func repartirCarta()->Carta{
        self.cartas.popLast()!
    }
    
    func barajar(){
        self.cartas.shuffle()
    }
}
