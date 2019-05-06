//
//  MapViewController.swift
//  MyFavoritePlaceInTokyoMap
//
//  Created by 宏輝 on 01/05/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var latiArray = [35.657174,35.637058,35.700694,35.667354]
    var lonArray = [139.703802,139.724699,139.408444,139.708936]
    
    var placeArray = ["キングダムシーカーズ","加藤プラチナクリニック","ひるまOP歯科","リュネットジュラ表参道店"]
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mapTableView.delegate = self
        mapTableView.dataSource = self
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latiArray[0], lonArray[0])
        
        var region:MKCoordinateRegion = mapView.region
        
        region.center = location
        region.span.latitudeDelta = 0.01
        region.span.longitudeDelta = 0.01
        mapView.setRegion(region, animated: true)
        mapView.setCenter(location, animated: true)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return placeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = placeArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latiArray[indexPath.row], lonArray[indexPath.row])
        
        var region:MKCoordinateRegion = mapView.region
        
        region.center = location
        region.span.latitudeDelta = 0.01
        region.span.longitudeDelta = 0.01
        mapView.setRegion(region, animated: true)
        mapView.setCenter(location, animated: true)
        
    }
    
    

}
