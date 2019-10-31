//
//  ViewController.swift
//  SieteyMedia
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var juego:Juego!
    var vistasCartas = [UIImageView]()
    var cartasCount = 0
    @IBOutlet weak var pedirButton: UIButton!
    @IBOutlet weak var plantarseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.juegoTerminado),
        name: NSNotification.Name(rawValue: "fin_juego"), object: nil)
    }
    
    @objc func juegoTerminado(notificacion : Notification) {
        if let userInfo = notificacion.userInfo {
            var mensaje : String
            let maquinaResultado : String = userInfo["maquina"] as! String
            switch userInfo["resultado"] as! estadoJuego {
                case .ganas: mensaje = "¡Has ganado!" + "La máquina ha sacado un " + maquinaResultado
                case .pierdes : mensaje = "¡Has perdido!" + "La máquina ha sacado un " + maquinaResultado
            }
            let alert = UIAlertController(
                title: "Fin del juego",
                message: mensaje,
                preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func pedirCartaButton(_ sender: Any) {
        juego.sacarCarta()
        let carta = juego.manoJugador.getCarta(posicion: self.cartasCount)!
        dibujarCarta(carta: carta, enPosicion: cartasCount)
        self.cartasCount+=1
    }
    @IBAction func plantarseButton(_ sender: Any) {
        juego.plantarse()
        pedirButton.isEnabled = false
        plantarseButton.isEnabled = false
    }
    
    @IBAction func nuevaPartidaButton(_ sender: Any) {
        self.juego = Juego()
        self.juego.baraja.barajar()
        self.cartasCount = 0
        borrarCartas()
        pedirButton.isEnabled = true
        plantarseButton.isEnabled = true
    }
    
    func dibujarCarta(carta: Carta, enPosicion : Int) {
        let limitesPantalla = UIScreen.main.bounds
        let anchoPantalla = limitesPantalla.width
        let altoPantalla = limitesPantalla.height
        
        let nombreImagen = String(carta.valor)+String(carta.palo.rawValue)
        //creamos un objeto imagen
        let imagenCarta = UIImage(named: nombreImagen)
        //para que la imagen sea un componente más del UI,
        //la encapsulamos en un UIImageView
        let cartaView = UIImageView(image: imagenCarta)
        //Inicialmente la colocamos fuera de la pantalla y más grande
        //para que parezca más cercana
        //"frame" son los límites de la vista, definen pos y tamaño
        cartaView.frame = CGRect(x: -200, y: -200, width: 200, height: 300)
        //La rotamos, para que al "repartirla" haga un efecto de giro
        cartaView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
        //La añadimos a la vista principal, si no no sería visible
        self.view.addSubview(cartaView)
        //guardamos la vista en el array, para luego poder eliminarla
        self.vistasCartas.append(cartaView)
        //Animación de repartir carta
        UIView.animate(withDuration: 0.5){
            //"efecto caida": la llevamos a la posición final
            cartaView.frame = CGRect(x:50+Int((altoPantalla/10)*0.5)*(enPosicion-1), y:Int(anchoPantalla/10), width:Int((altoPantalla/10)*0.5), height:Int(altoPantalla/10));
            //0 como ángulo "destino", para que rote mientras "cae"
            cartaView.transform = CGAffineTransform(rotationAngle:0);
        }
    }
    
    func borrarCartas(){
        //Quitamos las cartas de la pantalla
        for vistaCarta in self.vistasCartas {
            vistaCarta.removeFromSuperview()
        }
        //ya no tenemos imágenes de cartas en pantalla, ponemos el array a vacío
        self.vistasCartas=[]
    }
}

