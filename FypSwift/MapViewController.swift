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
    var imageForMarkerIcon : UIImage!
    var imageForMarker : UIImage!
    
    
    init(lat:CGFloat,withLong long:CGFloat,withtitle title:NSString,withsnippet snippet:NSString,withMarkerIconImage Iconimage:UIImage , withIMarkermage image:UIImage)
    {
        self.lat = lat
        self.long = long
        self.title = title
        self.snippet = snippet
        self.imageForMarkerIcon = Iconimage
        self.imageForMarker = image
    }
}

class MapViewController: UIViewController ,GMSMapViewDelegate {
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        mapView.selectedMarker = marker
        return true;
        
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        
        
        let alert = UIAlertController(title: "Alert", message: "Do you want to add photos/videos?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            
            marker.icon = #imageLiteral(resourceName: "Map-Marker-Flag")
            
            self.performSegue(withIdentifier: "uploading", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("yaha kuch nahi ayea ga")
            // yaha kuch nahi ayea ga
            
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        

        let infoWindow = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first! as! CustomGMSMarker
        
        infoWindow.imgPlace.image = #imageLiteral(resourceName: "Mountain-marker2")
        infoWindow.lbltitle.text = marker.title
        infoWindow.lblSnippet.text = marker.snippet
        
        return infoWindow
    }
    
    var arrData = [markerCustomClass]()
    

    @IBOutlet weak var mymapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //zooooooom
//        
//        @IBOutlet weak var zoomin: UIButton!
//        
//        
//        @IBOutlet weak var zoomout: UIButton!
//        
//        var currentZoom:Float = 10
//        currentZoom =
//        
//        
//        
//        @IBAction func zoominn(_ sender: AnyObject) {
//            currentZoom = currentZoom + 1;
//            print("Plus")
//            
//            self.mymapView.animate(toZoom: currentZoom)
//        }
//        
//        func zoomoutt(_ sender: AnyObject) {
//            currentZoom = currentZoom - 1;
//            print("Minus")
//            
//            self.mymapView.animateToZoom(currentZoom)
//        }
        
        

        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 30.3753,  longitude: 69.3451, zoom: 4)
        
        mymapView.mapType = kGMSTypeNormal
        mymapView.camera = camera
        mymapView.delegate = self
        
        
        
        
        
        arrData.append(markerCustomClass.init(lat: 30.3753, withLong: 69.3451, withtitle: "Pakistan", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        
        arrData.append(markerCustomClass.init(lat: 33.727896,  withLong: 73.098950, withtitle: "Islamabad", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 33.737778,  withLong: 72.799479, withtitle: "Taxila", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 33.908747,  withLong: 73.389677, withtitle: "Murree", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 24.978759,  withLong: 67.031698, withtitle: "Karachi", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 25.393082, withLong: 68.356673,  withtitle: "Hyderabad", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 24.749967,  withLong: 67.925091, withtitle: "Thatta", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 26.861977,  withLong:  67.151956, withtitle: "GORAK HILLS", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 31.592568,   withLong: 74.309509, withtitle: "MINAR-E-PAKISTAN", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 31.587985,  withLong: 74.310681,  withtitle: "BADSHAHI MOSQUE", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 31.604629,  withLong: 74.572999,  withtitle: "WAGAH BORDER", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.854768,  withLong:  71.786720, withtitle: "CHITRAL", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.799317,   withLong: 72.571388, withtitle: "MALAM JABBA", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.876468,   withLong: 73.692661, withtitle: "LAKE SAIF-UL-MALOOK", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 33.739916,  withLong: 73.055695, withtitle: "DAMAN-E-KOH", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 25.198557,   withLong: 62.319803, withtitle: "GAWADER", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 30.256238,   withLong: 67.098704, withtitle: "HANNA LAKE", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 30.210478,   withLong: 67.032704, withtitle: "QUETTA", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 30.378909,  withLong: 67.726035,  withtitle: "ZIARAT", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.042034,   withLong: 75.454603, withtitle: "DEOSAI NATIONAL PARK", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.387691,   withLong: 74.578048, withtitle: "FAIRY MEADOWS", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.317043,  withLong: 74.649956,  withtitle: "HUNZA VALLEY", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.880166,  withLong:  76.515076, withtitle: "K2 PEAK", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.822898,   withLong: 74.346848, withtitle: "KEL", withsnippet: "Kashmir,Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.358921,   withLong: 73.469373, withtitle: "MUZAFARABAD", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.794554,  withLong:  74.188163, withtitle: "SHARDAH", withsnippet: "Kashmir,Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.727726,   withLong: 74.710861, withtitle: "TAOBAT", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.371571,   withLong: 73.463161, withtitle: "NEELUM VALLEY", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.920737,   withLong: 74.521210, withtitle: "Chitta Katha Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.813085,   withLong: 74.339912, withtitle: "Arang Kel", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.521391, withLong: 73.838339, withtitle: "Jagran", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        /////////////////////////
        arrData.append(markerCustomClass.init(lat: 34.630383,   withLong: 73.443794, withtitle: "Kiwai", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.640005,  withLong:  73.465984, withtitle: "Shogran", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.614474,   withLong: 73.487450, withtitle: "Siri Paye Meadows", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.574727,   withLong: 73.496357, withtitle: "Makra Peak", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.780249,   withLong: 73.527285, withtitle: "Kaghan", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.907718,   withLong: 73.648524, withtitle: "Naran", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.814284,    withLong: 73.676347, withtitle: "Ansu lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.018917,   withLong: 74.090134, withtitle: "Dudi Patsar Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.830009,  withLong: 74.060855,  withtitle: "Ratti Gali Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.960599,   withLong: 74.057147, withtitle: "Noori Top", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.829035,   withLong: 73.727296, withtitle: "Malka Parbat", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.923151,  withLong: 73.756554, withtitle: "Lalazar", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        
        arrData.append(markerCustomClass.init(lat: 34.963412,   withLong: 74.099748, withtitle: "Siral Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.074917,   withLong: 73.937116, withtitle: "Lulusar Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.146082,   withLong: 74.046746, withtitle: "Babusar Top", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.237705,  withLong: 74.589177,  withtitle: "Nanga Parbat", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.388224,   withLong: 74.866295, withtitle: "Astore", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.330558,   withLong: 74.785652, withtitle: "Rama Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.995392,   withLong: 75.238237, withtitle: "Sheosar Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.226419,   withLong: 75.633654, withtitle: "Satparah Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.308108,   withLong: 75.645162, withtitle: "Skardu", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.426585,  withLong:  75.455312, withtitle: "Shangrilla Lake/Resort", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.446499,   withLong: 75.446721, withtitle: "Upper Kachura Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.427337,   withLong: 75.730572, withtitle: "Shigar Valley", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.429260,   withLong: 75.743557,  withtitle: "Shigar Fort", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.066243,   withLong: 75.994817, withtitle: "Manthola Waterfall", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.151474,   withLong: 76.335239, withtitle: "Khaplu Fort", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.143336,  withLong:  74.489900, withtitle: "Raka Poshi", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
       
        
        arrData.append(markerCustomClass.init(lat: 36.174655,   withLong: 74.882558, withtitle: "Rush Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.306672,   withLong: 74.810229, withtitle: "Attabad Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.240105,   withLong: 74.082095, withtitle: "Naltar Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.160610,   withLong: 74.195197, withtitle: "Naltar Valley", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.302080,   withLong: 74.841557, withtitle: "Hunza Tunnels", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.388995,   withLong: 74.865305, withtitle: "Gulmit Valley", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.460222,   withLong: 74.894837, withtitle: "Passu Cones", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.691472,   withLong: 74.825436, withtitle: "Sost Dry Port", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.849991,   withLong: 75.431913, withtitle: "Khunjerab Pass/Pak-China Border", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.316102,   withLong:74.681856, withtitle: "Altit Fort", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.325635,   withLong: 74.669771, withtitle: "Baltit Fort", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.435844,   withLong: 75.326387, withtitle: "Shimshal Valley", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.173314,   withLong: 72.946869, withtitle: "Phandar Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.879311,   withLong: 73.703759, withtitle: "Karomber Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.852263,  withLong: 71.791183,  withtitle: "Chitral", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.046494,  withLong: 72.484140,  withtitle: "Sawat", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.211419,   withLong: 72.550740, withtitle: "Bahrain", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.485289,  withLong: 72.591159,  withtitle: "Kalam Valley", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 35.714289,   withLong: 72.650945, withtitle: "Mahudand Lake", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.662319,   withLong: 72.344447, withtitle: "White Palace Murghzar", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.085945,  withLong:  72.544834, withtitle: "Shandoor polo ground", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 36.255000,  withLong: 71.840608,  withtitle: "Tirch Mir", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.072923,   withLong: 73.380282, withtitle: "Nathiya Gali", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.028791,   withLong: 73.404153, withtitle: "Ayubia", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        

        
        arrData.append(markerCustomClass.init(lat: 33.857103,  withLong: 73.482628,  withtitle: "Patriyata", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.000943,   withLong: 73.278176, withtitle: "Sajiikot Waterfall", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.249005,   withLong: 73.472686, withtitle: "Kashmir Aabshar", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 34.054322,   withLong: 73.482883, withtitle: "Neelum Point", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 25.391645,   withLong: 65.462153, withtitle: "Kund Malir", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 25.123789,   withLong: 63.849192, withtitle: "Astola Island", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 25.514756,   withLong: 65.520171, withtitle: "Hingol Nationsl Park", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 25.433212,   withLong: 65.299776,  withtitle: "Princess of Hope", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
        arrData.append(markerCustomClass.init(lat: 28.155431,   withLong: 67.127505, withtitle: "Mola Chatook", withsnippet: "Pakistan", withMarkerIconImage: #imageLiteral(resourceName: "map_marker_blue"), withIMarkermage: #imageLiteral(resourceName: "Mountain-marker2")))
        
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
        let marker = GMSMarker.init()
        
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(customMarker.lat), longitude: CLLocationDegrees(customMarker.long))
        marker.title = customMarker.title as String?
        marker.snippet = customMarker.snippet as String?
        marker.icon = customMarker.imageForMarkerIcon

        marker.map = mymapView
    }
    
//    - (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
//    // your code
//    }
    
    
 
    
    
    
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        

    
        let alert = UIAlertController(title: "Alert", message: "Do you want to add photos/videos?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            
            
            
            self.performSegue(withIdentifier: "uploading", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("yaha kuch nahi ayea ga")
             // yaha kuch nahi ayea ga
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    //zoominout
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

class CustomGMSMarkerClass : GMSMarker {
    
//    public var customImage: UIImage! {
//        
////        set {
////             self.customImage = newValue!
////        }
////        
////        get {
////            return self.customImage
////        }
//    }
    
    init(marker : GMSMarker)
    {
        super.init()
        self.title = marker.title
        self.snippet = marker.snippet
        self.icon = marker.icon
    }
    
    override init() {
        super.init()
    }
    
    // new functionality to add to SomeType goes here
}


