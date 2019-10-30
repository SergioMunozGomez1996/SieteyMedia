//
//  Mano.swift
//  SieteyMedia
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import Foundation

class Mano {
    var cartas : [Carta]
    var tamaño : Int {
      get {
        return cartas.count
      }
    }
    
    init(){
        self.cartas = [Carta]()
    }
    
    func addCarta(carta: Carta){
        cartas.append(carta)
    }
    
    func getCarta(posicion: Int) -> Carta? {
        if(posicion >= 0 && posicion <= tamaño){
            return cartas[posicion]
        }else{
            return nil
        }
    }
}
