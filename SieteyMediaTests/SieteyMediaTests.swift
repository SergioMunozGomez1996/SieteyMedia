//
//  SieteyMediaTests.swift
//  SieteyMediaTests
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import XCTest
@testable import SieteyMedia

class SieteyMediaTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCartaValido() {
        let carta = Carta(valor: 3, palo: Palo.copas)
        XCTAssert(carta?.valor==3 && carta?.palo==Palo.copas)
    }
    
    func testCartaValida(){
        let carta = Carta(valor: 8, palo: Palo.copas)
        XCTAssertNil(carta)
    }
    
    func testRepartoValido(){
        let baraja = Baraja()
        let cartaRepartida = baraja.repartirCarta()
        let presente = baraja.cartas.contains() {
                elemento in
            if (elemento===cartaRepartida){
                  return true
                }
                else {
                  return false;
                }
        }
        XCTAssert(presente==false)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
