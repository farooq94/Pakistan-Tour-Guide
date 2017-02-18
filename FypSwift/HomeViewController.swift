//
//  HomeViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit
import GoogleMaps
class HomeViewController: BaseClassViewController, GMSMapViewDelegate{
    
    @IBOutlet weak var UserMapView: GMSMapView!
    @IBOutlet var SegmentedControl: UIView!

    @IBAction func SegmentChanged(_ sender: AnyObject) {
        
        let segment = sender as! UISegmentedControl
        
        switch segment.selectedSegmentIndex {
        case 0:
            self.performSegue(withIdentifier: "Gotoprofile", sender: self)
            break
        case 1:
            self.performSegue(withIdentifier: "gotomap", sender: self)
            break
        case 2:
            self.performSegue(withIdentifier: "gotogallery", sender: self)
            break
        case 3:
            self.performSegue(withIdentifier: "gotobudgeting", sender: self)
            break
        
        default:
            break
        }

    }
    override func viewDidLoad() {
    
        super.viewDidLoad()

        
      
        
        let camera = GMSCameraPosition.camera(withLatitude: Double(30.3753),  longitude: Double(69.3451), zoom: 6)
        
        UserMapView.mapType = kGMSTypeNormal
        UserMapView.camera = camera
        UserMapView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
