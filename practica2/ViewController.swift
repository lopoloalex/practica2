//
//  ViewController.swift
//  practica2
//
//  Created by Alejandro Perez parra on 21/9/17.
//  Copyright © 2017 Alejandro y Gonzalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ParFunViewDataSource {
    

    //Velocidad de bajada vs tiempo
    @IBOutlet weak var pfv1: ParFunView!
    //Velocidad de salida vs altura
    @IBOutlet weak var pfv2: ParFunView!
    //Altura vs tiempo
    @IBOutlet weak var pfv3: ParFunView!
    //Posicion
    @IBOutlet weak var pfv4: ParFunView!
    
   
    
    @IBOutlet weak var SliderTiempo: UISlider!
    @IBOutlet weak var SliderAltura: UISlider!
    
    
    let tankModel = TankModel()
    let trajectoryModel = TrajectoryModel()
    var tiempo: Double = 10.0
    
    
    // movimientos de la vista 1
    @IBAction func deslizarDerecha1(_ sender: UISwipeGestureRecognizer) {
        pfv1.scaleX = pfv1.scaleX*1.2
    }
    @IBAction func desIzq1(_ sender: UISwipeGestureRecognizer) {
        pfv1.scaleX=pfv1.scaleX*0.8
    }
    @IBAction func desUp1(_ sender: UISwipeGestureRecognizer) {
        pfv1.scaleY = pfv1.scaleY*1.2
    }
    @IBAction func desDo1(_ sender: UISwipeGestureRecognizer) {
        pfv1.scaleY = pfv1.scaleY*0.8
    }
    @IBAction func zoom1(_ sender: UIPinchGestureRecognizer) {
        let f = sender.scale
        pfv1.scaleX *= Double(f)
        pfv1.scaleY*=Double(f)
        sender.scale=1
        pfv1.setNeedsDisplay()
    }
    @IBAction func tap1(_ sender: UITapGestureRecognizer) {
        pfv1.scaleX = 1
        pfv1.scaleY = 4
        pfv1.setNeedsDisplay()
    }
    
    //movimientos de la vista 2
    @IBAction func deslizarDerecha2(_ sender: UISwipeGestureRecognizer) {
        pfv2.scaleX = pfv2.scaleX*1.2
    }
    @IBAction func desIzq2(_ sender: UISwipeGestureRecognizer) {
        pfv2.scaleX=pfv2.scaleX*0.8
    }
    @IBAction func desUp2(_ sender: UISwipeGestureRecognizer) {
        pfv2.scaleY = pfv2.scaleY*1.2
    }
    @IBAction func desDo2(_ sender: UISwipeGestureRecognizer) {
        pfv2.scaleY = pfv2.scaleY*0.8
    }
    @IBAction func zoom2(_ sender: UIPinchGestureRecognizer) {
        let f = sender.scale
        pfv2.scaleX *= Double(f)
        pfv2.scaleY*=Double(f)
        sender.scale=1
        pfv2.setNeedsDisplay()
    }
    @IBAction func tap2(_ sender: UITapGestureRecognizer) {
        pfv2.scaleX = 8
        pfv2.scaleY = 4
        pfv2.setNeedsDisplay()
    }
    
    //movimientos de la vista 3
    @IBAction func deslizarDerecha3(_ sender: UISwipeGestureRecognizer) {
        pfv3.scaleX = pfv3.scaleX*1.2
    }
    @IBAction func desIzq3(_ sender: UISwipeGestureRecognizer) {
        pfv3.scaleX=pfv3.scaleX*0.8
    }
    @IBAction func desUp3(_ sender: UISwipeGestureRecognizer) {
        pfv3.scaleY = pfv3.scaleY*1.2
    }
    @IBAction func desDo3(_ sender: UISwipeGestureRecognizer) {
        pfv3.scaleY = pfv3.scaleY*0.8
    }
    @IBAction func zoom3(_ sender: UIPinchGestureRecognizer) {
        let f = sender.scale
        pfv3.scaleX *= Double(f)
        pfv3.scaleY*=Double(f)
        sender.scale=1
        pfv3.setNeedsDisplay()
    }
    @IBAction func tap3(_ sender: UITapGestureRecognizer) {
        pfv3.scaleX = 1
        pfv3.scaleY = 5
        pfv3.setNeedsDisplay()
    }
    
    //movimientos de la vista 4
    @IBAction func deslizarDerecha4(_ sender: UISwipeGestureRecognizer) {
        pfv4.scaleX = pfv4.scaleX*1.2
    }
    @IBAction func desIzq4(_ sender: UISwipeGestureRecognizer) {
        pfv4.scaleX=pfv4.scaleX*0.8
    }
    @IBAction func desUp4(_ sender: UISwipeGestureRecognizer) {
        pfv4.scaleY = pfv4.scaleY*1.2
    }
    @IBAction func desDo4(_ sender: UISwipeGestureRecognizer) {
        pfv4.scaleY = pfv4.scaleY*0.8
    }
    @IBAction func zoom4(_ sender: UIPinchGestureRecognizer) {
        let f = sender.scale
        pfv4.scaleX *= Double(f)
        pfv4.scaleY*=Double(f)
        sender.scale=1
        pfv4.setNeedsDisplay()
    }
    @IBAction func tap4(_ sender: UITapGestureRecognizer) {
        pfv4.scaleX = 15
        pfv4.scaleY = 9
        pfv4.setNeedsDisplay()
    }
    
    
  // viewDidLoad y didreceiveMemoryWarning
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        pfv1.dataSource = self
        pfv2.dataSource = self
        pfv3.dataSource = self
        pfv4.dataSource = self
        
        
        pfv1.scaleX = 1.0
        pfv1.scaleY = 4.0
        
        pfv2.scaleX = 8.0
        pfv2.scaleY = 4.0
        
        pfv3.scaleX = 1.0
        pfv3.scaleY = 5.0
        
        pfv4.scaleX = 15.0
        pfv4.scaleY = 9.0
        
      
        
        SliderAltura.sendActions(for: .valueChanged)
        SliderTiempo.sendActions(for: .valueChanged)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // funciones que actualizan el valor de los sliders
    
    @IBAction func updateH(_ sender: UISlider) {
        
        tankModel.initiakWater = Double(sender.value)
        pfv1.setNeedsDisplay()
        pfv2.setNeedsDisplay()
        pfv3.setNeedsDisplay()
        pfv4.setNeedsDisplay()
        
        
    }
    
    
    @IBAction func updateTiempo(_ sender: UISlider) {
        
        tiempo = Double(sender.value)
        
        pfv1.setNeedsDisplay()
        pfv2.setNeedsDisplay()
        pfv3.setNeedsDisplay()
        pfv4.setNeedsDisplay()
    }
    
    
    //Protocolo ParFunViewDataSource
    
    func startFor(_ pfgv: ParFunView) -> Double {
     return 0.0
    }
    
    func endFor(_ pfgv: ParFunView) -> Double {
        switch pfgv{
        case pfv1 :
            return tankModel.timeToEmpty
        case pfv2:
            return tankModel.timeToEmpty
        case pfv3 :
            return tankModel.timeToEmpty
        case pfv4 :
            if tankModel.initiakWater == 0 {
                return 0
            }
            
            trajectoryModel.speed=tankModel.waterOutputSpeed(waterHeight:tankModel.waterHeightAt(time: tiempo))
            return trajectoryModel.timeToTarget()!
            
        default:
            return 0
        }
    }
    
    func paramtricFucGrView(_ pfgv: ParFunView, pointAt index: Double) -> FunctionPoint {
        
        switch pfgv {
            
        case pfv1:
            
            let x = index
            let z = tankModel.waterHeightAt(time: x)
            let y = tankModel.waterOutputSpeed(waterHeight: z)
            return FunctionPoint(x: x, y: y)
            
        case pfv2:
            
            let x = tankModel.waterHeightAt(time: index)
            let y = tankModel.waterOutputSpeed(waterHeight: x)
            return FunctionPoint(x: x, y: y)
            
        case pfv3:
            
            let x = index
            let y = tankModel.waterHeightAt(time: x)
            return FunctionPoint(x: x, y: y)
            
        case pfv4:
            
            trajectoryModel.speed=tankModel.waterOutputSpeed(waterHeight:tankModel.waterHeightAt(time: tiempo))
            let x = trajectoryModel.oringinPos.x + trajectoryModel.positionAt(time: index).x
            let y = trajectoryModel.positionAt(time: index).y
            
            return FunctionPoint(x: x, y: y)
            
        default:
            
            return FunctionPoint(x: 0, y: 0)
            
        }
        
    }
    
}

