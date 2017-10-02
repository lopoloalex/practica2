//
//  ParFunView.swift
//  practica2
//
//  Created by Alejandro Perez parra on 21/9/17.
//  Copyright © 2017 Alejandro y Gonzalo. All rights reserved.
//

import UIKit
struct FunctionPoint {
    
    var x = 0.0
    var y = 0.0
    
}


protocol ParFunViewDataSource {
    func startFor(_ pfgv: ParFunView) -> Double
    func endFor(_ pfgv: ParFunView) -> Double
    func paramtricFucGrView (_ pfgv : ParFunView, pointAt index : Double)->FunctionPoint
    //puntos de interes  devuelve [fuctionPoint]
    
  
    
}

class ParFunView: UIView {
    var dataSource : ParFunViewDataSource!
    var scaleX = 1.0
    var scaleY = 1.0
    
    override func draw(_ rect: CGRect) {
        drawAxis()
        drawTrajectory()
    }
    
    private func drawAxis(){
        let w = bounds.width
        let h = bounds.height
        
        let pathY = UIBezierPath()
        pathY.move(to: CGPoint(x: w/2, y: 0))
        pathY.addLine(to: CGPoint( x: w/2, y: h))
        
        pathY.lineWidth = 2
        UIColor.black.setStroke()
        pathY.stroke()
        
        
        let pathX = UIBezierPath()
        pathX.move(to: CGPoint(x: 0, y: h/2))
        pathX.addLine(to: CGPoint( x: w, y: h/2))
        
        pathX.lineWidth = 2
        UIColor.black.setStroke()
        pathX.stroke()
        
        
        
    }
    private func drawTrajectory() {
        let path = UIBezierPath()
        let p0 = dataSource.startFor(self)
        let pf = dataSource.endFor(self)
        let dp = (pf-p0) / 100
        let v0 =  dataSource.paramtricFucGrView(self, pointAt: p0)
        let ptX0 = pointForX (v0.x)
        let ptY0 = pointForY(v0.y)
        path.move(to: CGPoint(x:ptX0, y:ptY0))
        
        
        for  p in stride(from: p0, to: pf, by: dp){
            let v =  dataSource.paramtricFucGrView(self, pointAt: p)
            let ptX = pointForX(v.x)
            let ptY = pointForY(v.y)
            
            
            path.addLine(to: CGPoint(x: ptX, y: ptY))
        }
        path.lineWidth = 4
        UIColor.red.setStroke()
        path.stroke()
        
    }
    private func pointForX (_ x: Double)->CGFloat{
        let width = bounds.size.width
        return width/2 + CGFloat(x*scaleX)
    
    }
    private func pointForY (_ y: Double)->CGFloat{
        let height = bounds.size.height
        return height/2 + CGFloat(y*scaleY)
        
    }
        
    }
  
    

