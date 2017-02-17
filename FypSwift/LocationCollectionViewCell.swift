//
//  LocationCollectionViewCell.swift
//  FypSwift
//
//  Created by Nano Degree on 17/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit
import GoogleMaps

class LocationCollectionViewCell: BaseClassViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var LocationMapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 30.3753,  longitude: 69.3451, zoom: 12)
        
        LocationMapView.mapType = kGMSTypeNormal
        LocationMapView.camera = camera
        LocationMapView.delegate = self
    }
    
    
    
    
    
    
}
