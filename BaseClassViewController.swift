//
//  BaseClassViewController.swift
//  FypSwift
//
//  Created by MBP on 17/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit


protocol CustomHeaderdelegate{
    func headerBackBtnClick()
}


class BaseClassViewController: UIViewController {

    let bgImage : UIImageView! = UIImageView.init()

    var _topBar = HeaderView.init()
    
    
    var delegate : CustomHeaderdelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        bgImage.frame = self.view.frame
        bgImage.image = #imageLiteral(resourceName: "bg (11)")
        self.view.insertSubview(bgImage, at: 0)
        
        _topBar = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first! as! HeaderView
        
        _topBar.btnBack.addTarget(self, action: #selector(btnBack(sender:)), for: .touchUpInside)
        _topBar.btnLogOut.addTarget(self, action: #selector(btnBack(sender:)), for: .touchUpInside)
        
         _topBar.btnLogOut.isHidden = true

        
        
        self.view.addSubview(_topBar)
        _topBar.bringSubview(toFront: self.view)
    
////////////
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnBack(sender: AnyObject)  {
        
        delegate!.headerBackBtnClick()
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
}
