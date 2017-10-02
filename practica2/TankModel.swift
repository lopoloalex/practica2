//
//  TankModel.swift
//  practica2
//
//  Created by Alejandro Perez parra on 28/9/17.
//  Copyright © 2017 Alejandro y Gonzalo. All rights reserved.
//

import Foundation


class TankModel {
    
    var tankRadio : Double = 1.0
    var pipeRadio : Double = 0.005
    let g = 9.8
    let initiakWaterH = 0.5
    
    private let areaTank : Double
    private let areaPipe : Double
    private let ap2ap2m1 :Double
    let timeToEmpty : Double
    
    init(){
        let pi: Double = 3.14159265358979
        areaPipe = pi * (pipeRadio*pipeRadio)
        areaTank = pi * (tankRadio*tankRadio)
        ap2ap2m1 = (areaTank*areaTank)/(areaPipe*areaPipe)
        timeToEmpty = sqrt((2*initiakWaterH*(ap2ap2m1-1))/g)
    }
    
   
    func waterHeightSpeed ( waterH h: Double) ->Double {
        return sqrt((2*g*h)/(ap2ap2m1-1))
    }
    func waterOutputSpeed (waterHeigth h : Double) -> Double {
        return sqrt((2*h*g)/(1-(1/ap2ap2m1)))
    }
    func waterHeigthAt ( time t : Double) -> Double {
        return  initiakWaterH-sqrt((2*g*initiakWaterH)/(ap2ap2m1-1))*t+((g/2)/(ap2ap2m1-1))*t*t
    }
    
    
}
