//
//  HomeViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit
import GoogleMaps
class HomeViewController: BaseClassViewController, GMSMapViewDelegate,CustomHeaderdelegate{
    
    @IBOutlet weak var UserMapView: GMSMapView!
    @IBOutlet var SegmentedControl: UIView!
    
    var pre = UserDefaults.standard
    
    var selectedMarker = GMSMarker.init()

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
        
        _topBar.lblTtitle.text = "Home"
        delegate = self
        _topBar.btnBack.isHidden = true
        _topBar.btnLogOut.isHidden = false
        
        
        let camera = GMSCameraPosition.camera(withLatitude: Double(30.3753),  longitude: Double(69.3451), zoom: 5)
        
        UserMapView.mapType = kGMSTypeNormal
        UserMapView.camera = camera
        UserMapView.delegate = self
        
        
        let userSpecificKey = "selectedArray" + "_\(pre.object(forKey: "userID") as! Int)"
        
        if (pre.object(forKey: userSpecificKey) != nil)
        {
            if let data = pre.object(forKey: userSpecificKey) as? NSData
            {
                // Get Array from Data
                let _mySavedList = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [markerCC]
                showCustomMarkerOnMap(array: _mySavedList)
                
            }
        }
        
        
        // Do any additional setup after loading the view.
    }

    
    func showCustomMarkerOnMap(array : [markerCC])
    {
        for markerObj in array {
            
            //  Creates a marker in the center of the map.
            let marker = GMSMarker.init()
            
            marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(markerObj.lat), longitude: CLLocationDegrees(markerObj.long))
            marker.title = markerObj.name as String?
            marker.snippet = markerObj.snippit as String?
            
            marker.icon = #imageLiteral(resourceName: "visited")
            
            marker.userData = markerObj.userInfo
            
            marker.map = UserMapView
        }
    }
    
    
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        
        let infoWindow = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first! as! CustomGMSMarker
        
        
        let dic = marker.userData as! Dictionary<String,AnyObject>
        
        infoWindow.imgPlace.image = UIImage.init(named: dic["ImageName"] as! String) //#imageLiteral(resourceName: "Mountain-marker2")
        infoWindow.lbltitle.text = marker.title
        infoWindow.lblSnippet.text = marker.snippet
        
        
        return infoWindow
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func headerBackBtnClick() {
        
         self.performSegue(withIdentifier: "Logout", sender: self)
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
