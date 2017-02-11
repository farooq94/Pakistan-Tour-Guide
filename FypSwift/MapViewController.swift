//
//  MapViewController.swift
//  FypSwift
//
//  Created by Nano Degree on 11/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit
import GoogleMaps



class markerCustomClass
{
    
    var lat : CGFloat!
    var long : CGFloat!
    var title : NSString!
    var snippet : NSString!
    var image : UIImage!
    
    
    init(lat:CGFloat,withLong long:CGFloat,withtitle title:NSString,withsnippet snippet:NSString,withimage image:UIImage)
    {
        self.lat = lat
        self.long = long
        self.title = title
        self.snippet = snippet
        self.image = image
    }
}

class MapViewController: UIViewController ,GMSMapViewDelegate {
    
    var arrData = [markerCustomClass]()
    
    
    
    
    @IBOutlet weak var mymapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 30.3753,  longitude: 69.3451, zoom: 8)
        
        mymapView.mapType = kGMSTypeNormal
        mymapView.camera = camera
        mymapView.delegate = self
        
        
        
        arrData.append(markerCustomClass.init(lat: 30.3753, withLong: 69.3451, withtitle: "Pakistan", withsnippet: "APna Pakistan", withimage: #imageLiteral(resourceName: "map-marker")))
        
        arrData.append(markerCustomClass.init(lat: 30.3653, withLong: 69.3451, withtitle: "Pakistan 2", withsnippet: "APna Pakistan", withimage: #imageLiteral(resourceName: "map_marker_blue")))
        
        arrData.append(markerCustomClass.init(lat: 30.3553, withLong: 69.3451, withtitle: "Pakistan 3", withsnippet: "APna Pakistan", withimage: #imageLiteral(resourceName: "map-marker")))
        
        arrData.append(markerCustomClass.init(lat: 30.3453, withLong: 69.3451, withtitle: "Pakistan 4", withsnippet: "APna Pakistan", withimage: #imageLiteral(resourceName: "map_marker_blue")))

        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        for markerCustomObj in arrData {
            
            self.addMarkerWithCustomMarkerObj(customMarker: markerCustomObj)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addMarkerWithCustomMarkerObj(customMarker : markerCustomClass)
    {
        //  Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(customMarker.lat), longitude: CLLocationDegrees(customMarker.long))
        marker.title = customMarker.title as String?
        marker.snippet = customMarker.snippet as String?
        marker.icon = customMarker.image
        
        marker.map = mymapView
    }
    
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        let marker3 : GMSMarker = GMSMarker.init()
        marker3.position = coordinate
        marker3.title = "170 Asbury Anderson Rd"
        marker3.snippet = "US"
        marker3.map = mymapView;
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
             print("Segue yaha ayea ga")
            // Segue yaha ayea ga
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("yaha kuch nahi ayea ga")
             // yaha kuch nahi ayea ga
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
//    -(void) mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{
//    GMSMarker *marker3 = [[GMSMarker alloc] init];
//    marker3.position = coordinate;
//    marker3.title = @"170 Asbury Anderson Rd";
//    marker3.snippet = @"US";
//    marker3.map = mapView_;
//    }
    
    
//    - (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
//    // your code
//    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
