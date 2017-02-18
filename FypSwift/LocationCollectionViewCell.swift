//
//  LocationCollectionViewCell.swift
//  FypSwift
//
//  Created by Nano Degree on 17/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit
import GoogleMaps

class LocationCollectionViewCell: BaseClassViewController, GMSMapViewDelegate,CustomHeaderdelegate {
    
    @IBOutlet weak var LocationMapView: GMSMapView!
    var lat: Float!
    var long: Float!
    var name : String!
    var Image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _topBar.lblTtitle.text = name
        delegate = self
        
        
        
        print("hello lat is \(lat!)")
        print("hello lat is \(long!)")
        
        let camera = GMSCameraPosition.camera(withLatitude: Double(lat!),  longitude: Double(long!), zoom: 10)
        
        LocationMapView.mapType = kGMSTypeNormal
        LocationMapView.camera = camera
        LocationMapView.delegate = self
        
        
        
        let marker = GMSMarker.init()
        marker.map = LocationMapView
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        marker.title = name as String?
        //marker.snippet = snippet as String?
        marker.icon = #imageLiteral(resourceName: "map_marker_blue")
        
        //marker.userData = ["ImageName" : customMarker.TapImage, "Tag" : int]
        
        marker.map = LocationMapView

        
        
        
       
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        
        let infoWindow = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first! as! CustomGMSMarker
        
        
       // let dic = marker.userData as! Dictionary<String,AnyObject>
        
        infoWindow.imgPlace.image = Image //#imageLiteral(resourceName: "Mountain-marker2")
        infoWindow.lbltitle.text = marker.title
        infoWindow.lblSnippet.text = marker.snippet
        
        return infoWindow
    }

    func headerBackBtnClick() {
        
         self.performSegue(withIdentifier: "backToCityFromLocation", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "backToCityFromLocation" {
            
            let obj : thirdViewController = segue.destination as! thirdViewController
            
            obj.hotelName = name
            obj.image = Image
            
        }
        
    }
    
    
    
    
    
}
