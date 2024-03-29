//
//  Juego.swift
//  SieteyMedia
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import Foundation

enum estadoJuego {
    case ganas, pierdes
}
class Juego{
    var manoJugador:Mano
    var baraja:Baraja
    var total:Float=0
    var estado : estadoJuego!
    var manoCasa:Float=0
    
    init() {
        self.manoJugador = Mano()
        self.baraja = Baraja()
    }
    func notificarFin() {
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name(rawValue:"fin_juego"),
                object: nil, userInfo: ["resultado":self.estado!, "maquina":String(self.manoCasa)])
    }
    func sumarPuntosMano(){
        self.total = 0
        for i in 0...manoJugador.tamaño-1{
            var carta = manoJugador.getCarta(posicion: i)
            if(carta!.valor>=10 && carta!.valor<=12){
                self.total += 0.5
            }else{
                self.total += Float(carta!.valor)
            }
        }
        print("Tienes una puntuación total de " + String(self.total))
        
    }
    
    func sacarCarta(){
        self.manoJugador.addCarta(carta: self.baraja.repartirCarta())
        print("Has sacado un " + String(self.manoJugador.getCarta(posicion: manoJugador.cartas.count-1)!.valor) )
        sumarPuntosMano()
        if(total>7.5){
            plantarse()
        }
    }
    
    func plantarse(){
        var media:Int
        manoCasa = Float(Int.random(in: 1...7))
        media = Int.random(in: 0...1)
        if(media==1){
            manoCasa += 0.5
        }
        print("La máquina ha sacado " + String(manoCasa))
        if(self.total<=7.5 && self.total>manoCasa){
            print("Has ganado")
            self.estado = .ganas
            notificarFin()
        }else{
            print("Has perdido")
            self.estado = .pierdes
            notificarFin()
        }
    }
}
