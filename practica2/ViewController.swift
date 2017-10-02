//
//  ViewController.swift
//  practica2
//
//  Created by Alejandro Perez parra on 21/9/17.
//  Copyright © 2017 Alejandro y Gonzalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ParFunViewDataSource {
    //Velocidad de bajada vs altura
    @IBOutlet weak var pfv1: ParFunView!
    //Velocidad de salida vs altura
    @IBOutlet weak var pfv2: ParFunView!
    //Altura vs tiempo
    @IBOutlet weak var pfv3: ParFunView!
    //Posicion vs tiempo
    @IBOutlet weak var pfv4: ParFunView!
    @IBOutlet weak var SliderTiempo: UISlider!
    @IBOutlet weak var SliderAltura: UISlider!
    
    let tankModel = TankModel()
    let trayectoryModel = TrajectoryModel()
    
    // var tiempo que cambia con el potenciometro un didSet para redibujar todo
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pfv1.dataSource = self
        pfv2.dataSource = self
        pfv3.dataSource = self
        pfv3.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func startFor(_ pfgv: ParFunView) -> Double {
        if pfgv == pfv1{
            return 0
        } else if
            pfgv == pfv2 {
            return 50
        } else {
            return 500
        }
    }
    
    func endFor(_ pfgv: ParFunView) -> Double {
        if pfgv == pfv1{
            return 100
        } else if
            pfgv == pfv2 {
            return 200
        } else {
            return 500
        }
    }
    
    
    func paramtricFucGrView (_ pfgv : ParFunView, pointAt index : Double)->FunctionPoint {
        switch pfgv {
            
        case pfv1:
            let x = Double(index)
            let y = 200*sin(0.08*Double(index))
            return FunctionPoint(x : x , y : y)
            
        case pfv2:
            let x = Double(index)
            let y = 200*cos(0.08*Double(index))
            return FunctionPoint(x : x , y : y)
            
        default:
            return FunctionPoint(x : 0 , y : 0)
            
        }
        
    }
    
}
