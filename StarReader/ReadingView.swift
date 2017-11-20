//
//  ReadingView.swift
//  StarReader
//
//  Created by Xing Hu on 20/11/17.
//  Copyright © 2017 Xing Hu. All rights reserved.
//

import UIKit

class ReadingView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        //this context is Y-flipped and X-flipped initially
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Flip the coordinate system
        context.textMatrix = .identity
        context.translateBy(x: 0, y: bounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        
        let path = CGMutablePath()
        path.addRect(bounds)
      
        let attrString = NSAttributedString(string: "Hello World")
        
        let framesetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length), path, nil)
        
        CTFrameDraw(frame, context)
    }
}
