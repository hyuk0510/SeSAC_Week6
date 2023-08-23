//
//  TheaterLocationViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/23.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

class TheaterLocationViewController: UIViewController {
    
    enum Action: String, CaseIterable {
        case megabox = "메가박스"
        case lotteCinema = "롯데시네마"
        case cgv = "CGV"
        case allCinema = "전체보기"
    }
    
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    let backButton = UIButton()
    let filterButton = UIButton()
    let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        view.addSubview(mapView)
        view.addSubview(backButton)
        view.addSubview(filterButton)
        
        setBackButton()
        setFilterButton()
        setConstraints()
        
        checkDeviceLocationAuthorization()
        setRegionAndAnnotation(center: center)
    }
    
    func setBackButton() {
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle("My Media", for: .normal)
        backButton.setTitleColor(.red, for: .normal)
        backButton.tintColor = .red
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true)
    }
    
    func setFilterButton() {
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.blue, for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
    }
    
    @objc func filterButtonPressed() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let megaBox = UIAlertAction(title: "메가박스", style: .default) { _ in
            self.setAnnotation(title: "메가박스")
        }
        let lotteCinema = UIAlertAction(title: "롯데시네마", style: .default) { _ in
            self.setAnnotation(title: "롯데시네마")
        }
        let cgv = UIAlertAction(title: "CGV", style: .default) { _ in
            self.setAnnotation(title: "CGV")
        }
        let allCinema = UIAlertAction(title: "전체보기", style: .default) { _ in
            self.setAnnotation(title: "전체보기")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        let actionList = [megaBox, lotteCinema, cgv, allCinema, cancel]
        
        
        
        for action in actionList {
            alert.addAction(action)
        }
        
        present(alert, animated: true)
    }
    
    func setConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        mapView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
    }
    
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다")
            }
            
        }
        
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            showRequestLocationServiceAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            print("default")
        }
    }
    
    func showRequestLocationServiceAlert() {
        let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        
        requestLocationServiceAlert.addAction(cancel)
        requestLocationServiceAlert.addAction(goSetting)

        present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    
    func setAnnotation(title: String) {
        var annotationList: [MKPointAnnotation] = []
        
        for theater in TheaterList().mapAnnotations {
            if title == "전체보기" {
                let annotation = MKPointAnnotation()
                annotation.title = theater.location
                annotation.coordinate = CLLocationCoordinate2D(latitude: theater.latitude, longitude: theater.longitude)
                annotationList.append(annotation)
            } else if theater.type == title {
                let annotation = MKPointAnnotation()
                annotation.title = theater.location
                annotation.coordinate = CLLocationCoordinate2D(latitude: theater.latitude, longitude: theater.longitude)
                annotationList.append(annotation)
            }
        }
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotationList)
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
        
        for theater in TheaterList().mapAnnotations {
            let theaterLocation = CLLocationCoordinate2D(latitude: theater.latitude, longitude: theater.longitude)
            
            let annotation = MKPointAnnotation()
            annotation.title = theater.location
            annotation.coordinate = theaterLocation
            mapView.addAnnotation(annotation)
        }
        
    }
}

extension TheaterLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        checkDeviceLocationAuthorization()
    }
}
