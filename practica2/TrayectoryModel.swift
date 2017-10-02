//
//  TrayectoryModel.swift
//  practica2
//
//  Created by Alejandro Perez parra on 28/9/17.
//  Copyright © 2017 Alejandro y Gonzalo. All rights reserved.
//

import Foundation

class TrajectoryModel {
    
    let g : Double = 9.8
    
    var oringinPos = ( x:0.0 , y : 0.0){
        didSet {
            update()
        }
    }
    
    var targetPos  = ( x:0.0 , y : 0.0){
        didSet {
            update()
        }
    }
    
    var speed: Double = 0.0{
        didSet {
            update()
        }
    }
    
    private var angle: Double = 0.0
    private var speedX : Double = 0.0
    private var speedY : Double = 0.0
    
    
    private func update() {
        angle = atan((speed*speed + sqrt(pow(speed, 4) - g*g*pow(targetPos.x,2) - 2*g*targetPos.y*speed))/(g*targetPos.x))
        speedX=speed*cos(angle)
        speedY=speed*sin(angle)
    }
    

    func timeToTarget() -> Double?{
        return targetPos.x/speedX
        
    }
    func positionAt (time t : Double) -> (x : Double , y : Double){
        let a = speedX*t
        let b = speedY*t-0.5*g*t*t
        return (x: a, y: b)
    }
}
