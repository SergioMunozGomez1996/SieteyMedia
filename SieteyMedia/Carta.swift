//
//  Carta.swift
//  SieteyMedia
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import Foundation

enum Palo: String,CaseIterable {
    case oros, copas, espadas, bastos
}

class Carta {
    var valor : Int
    var palo : Palo
    init?(valor:Int, palo:Palo) {
        if (valor==8||valor==9||valor<1||valor>12){
           return nil
        }
        self.valor = valor
        self.palo = palo
    }
    func descripcion() -> String {
        return "El \(valor) de \(palo)"
    }
}
