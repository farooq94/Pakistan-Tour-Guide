//
//  testExpericeViewController.swift
//  FypSwift
//
//  Created by MBP on 15/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit

class testExpericeViewController: UIViewController,OpalImagePickerControllerDelegate {
    @IBAction func btnClick(_ sender: Any) {
        
        
        
        let imagePicker = OpalImagePickerController()
        
        
        //Change color of selection overlay to white
        imagePicker.selectionTintColor = UIColor.white.withAlphaComponent(0.7)
        
        //Change color of image tint to black
        imagePicker.selectionImageTintColor = UIColor.black
        
        //Change image to X rather than checkmark
        imagePicker.selectionImage = #imageLiteral(resourceName: "map-marker")
        
        imagePicker.imagePickerDelegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage])
    {
        
        let arr = images
        
    }
    
    func imagePickerDidCancel(_ picker: OpalImagePickerController)
    {
        
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
