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
    var pipeRadio : Double = 0.1
    let g = 9.8
    var initiakWater = 15.0{
        didSet {
            update()
        }
    }
    
    
    private let areaTank : Double
    private let areaPipe : Double
    private let ap2ap2m1 :Double
    var timeToEmpty : Double
    
    
    init(){
        let pi: Double = 3.14159265358979
        areaPipe = pi * (pipeRadio*pipeRadio)
        areaTank = pi * (tankRadio*tankRadio)
        ap2ap2m1 = (areaTank*areaTank)/(areaPipe*areaPipe)
        timeToEmpty = sqrt((2*initiakWater*(ap2ap2m1-1))/g)
    }
    private func update(){
       timeToEmpty = sqrt((2*initiakWater*(ap2ap2m1-1))/g)
    }
   
    func waterHeightSpeed (waterHeight h: Double) ->Double {
        
        let a = 2*g*h
        let b = ap2ap2m1-1
        return sqrt(a/b)
    }
    func waterOutputSpeed (waterHeight h: Double) -> Double {
        let a = 2*g*h
        let b = 1 + ((areaPipe*areaPipe)/(areaTank*areaTank))
        return sqrt((a)/(b))
    }
    func waterHeightAt ( time t : Double) -> Double {
        let a = 2*g*initiakWater
        let b = ap2ap2m1-1
        let c = sqrt(a/b)
        let d = 0.5*g
        return  initiakWater-c*t+(d/b)*t*t
    }
    
    
}
