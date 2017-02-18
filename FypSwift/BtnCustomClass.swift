//
//  BtnCustomClass.swift
//  FypSwift
//
//  Created by Nano Degree on 11/01/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class BtnCustomClass: UIButton {
    
    
    @IBOutlet weak var lblHeader: UILabel!
    
    override func awakeFromNib() {
    //    self.titleLabel.textColor = UIColor.()
        
        self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
        self.titleLabel?.font = UIFont.init(name:"Roboto-BlackItalic", size: 18.0)
        
        self.setTitleColor(UIColor .white, for: UIControlState.normal)
        self.setTitleColor(UIColor .black, for: UIControlState.highlighted)
        

        
        
        
        
        
        
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform.identity
            },
                       completion: { Void in()  }
        )
    }
    
    
    
    
        
        
        
        
//        
//        
//        extension UIView {
//            
//            /**
//             Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.
//             
//             - parameter duration: animation duration
//             */
//            func zoomIn(duration duration: NSTimeInterval = 0.2) {
//                self.transform = CGAffineTransformMakeScale(0.0, 0.0)
//                UIView.animateWithDuration(duration, delay: 0.0, options: [.CurveLinear], animations: { () -> Void in
//                    self.transform = CGAffineTransformIdentity
//                }) { (animationCompleted: Bool) -> Void in
//                }
//            }
//            
//            /**
//             Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
            
//             - parameter duration: animation duration
//             */
//           
//        
//
//        UIView.animate(withDuration: 0.6,
//                       animations: {
//                        self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//            },
//                       completion: { _ in
//                        UIView.animate(withDuration: 0.6) {
//                            self.transform = CGAffineTransform.identity
//                        }
//        })
//        
        
        //self.backgroundColor = UIColor.gray
    }
        
        
        
        
//        func zoomOut(duration duration: NSTimeInterval = 0.2) {
//            self.transform = CGAffineTransformIdentity
//            UIView.animateWithDuration(duration, delay: 0.0, options: [.CurveLinear], animations: { () -> Void in
//                self.transform = CGAffineTransformMakeScale(0.0, 0.0)
//            }) { (animationCompleted: Bool) -> Void in
//            }
//        }
//        
//        /**
//         Zoom in any view with specified offset magnification.
//         
//         - parameter duration:     animation duration.
//         - parameter easingOffset: easing offset.
//         */
//        func zoomInWithEasing(duration duration: NSTimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
//            let easeScale = 1.0 + easingOffset
//            let easingDuration = TimeInterval(easingOffset) * duration / NSTimeInterval(easeScale)
//            let scalingDuration = duration - easingDuration
//            UIView.animateWithDuration(scalingDuration, delay: 0.0, options: .CurveEaseIn, animations: { () -> Void in
//                self.transform = CGAffineTransformMakeScale(easeScale, easeScale)
//                }, completion: { (completed: Bool) -> Void in
//                    UIView.animateWithDuration(easingDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
//                        self.transform = CGAffineTransformIdentity
//                        }, completion: { (completed: Bool) -> Void in
//                    })
//            })

    
    
    

