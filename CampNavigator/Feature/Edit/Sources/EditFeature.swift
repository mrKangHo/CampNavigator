//
//  EditFeature.swift
//  Edit
//
//  Created by LEE on 8/11/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Domain
import Data
import MapKit
import Resources
import SwiftUI
import PhotosUI
import Facilities

@Reducer
public struct EditFeature {
    
    public init() {}
    
    @ObservableState
    public struct State {
        public init() {
//        public init(editInfo: CampPlace = CampPlace(name: "", visitDates: Date())) {
//            self.editInfo = editInfo
//            if let location = editInfo.location {
//                
//                self.mapCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//            }
//            else {
//                self.mapCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5783, longitude: 126.9770), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//            }
        }
        
        public var saveResult:Bool = false
        public var placeName:String = ""
        public var placeVisitDate:Date = Date()
        public var placeCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.5783, longitude: 126.9770)
        public var placeLocation:MapCameraPosition = {
            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.5783, longitude: 126.9770)
            let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            return MapCameraPosition.region(MKCoordinateRegion(center: coordinate,
                                                               span: span))
            
            
        }()
 
        public var selectedPhotoItems: PhotosPickerItem?
        public var photos:[Data] = []
        public var address:String = ""
        public var facilities:[String] = ["개인 화장실", "오션뷰"]
        public var chipListState:ChipListFeature.State = ChipListFeature.State(["개인 화장실", "오션뷰"])
        
        public var isShowFacilitiesView:Bool = false
        
        @Presents var alert:AlertState<Action.AlertAction>?
        
    }
    
    public enum Action:ViewAction {
        
        case view(View)
        case saveComplete
        case updateName(String)
        case updateDate(Date)
        case updateLocation(MapCameraPosition)
        case updatePhotos(PhotosPickerItem?)
        case updateAddress(String)
        case updateFacilities([String])
        case chipListAction(ChipListFeature.Action)
        public enum View {
            case addPhoto(Data)
            case updateLotions(CLLocationCoordinate2D)
            case savePlace
        }
        
        @CasePathable
        public enum AlertAction {
            case cancelTapped
            case confirmTapped
        }
        
    }
    
    @Dependency(\.campPlace) var campPlace
    
    public var body: some Reducer<State, Action> {
        
        Scope(state: \.chipListState, action: \.chipListAction) {
            ChipListFeature()
        }
        Reduce { state, action in
            switch action {
            case .view(let viewAction):
                return viewActions(&state, viewAction)
            case .saveComplete:
                state.saveResult = true
                print("저장완료")
                return .none
            case .updateDate(let visitDate):
                print(visitDate)
                state.placeVisitDate = visitDate
                return .none
            case .updateName(let name):
                print(name)
                state.placeName = name
                return .none
            case .updateLocation(let newLocation):
                state.placeLocation = newLocation
                return .none
            case .updatePhotos(let photo):
                state.selectedPhotoItems = photo
                return .none
            case .updateAddress(let newAddress):
                state.address = newAddress
                return .none
            case .updateFacilities(let newFacilities):
                state.facilities = newFacilities
                return .none
            case .chipListAction:
                return .none
            }

        }
    }
}

extension EditFeature {
    
    private func viewActions(_ state:inout State, _ action:Action.View) -> Effect<Action> {
        switch action {
            
        case .savePlace:
            
            let facility = state.facilities.map {CampFacility(name: $0)}
            
            let photos = state.photos
            
            
            let location = CampLocation(address: state.address,
                                        latitude: state.placeCoordinate.latitude,
                                        longitude: state.placeCoordinate.longitude)
            
            let newCamp = CampPlace(name: state.placeName,
                                    visitDates: state.placeVisitDate,
                                    facility: facility,
                                    photos: photos,
                                    location: location)
            
            return .run { send in
                
                try? campPlace.add(newCamp)
                
                await send(.saveComplete)
            }
        case .addPhoto(let newPhoto):
            state.photos.append(newPhoto)
            return .none
        case .updateLotions(let newLocation):
            let location = CLLocation(latitude: newLocation.latitude, longitude: newLocation.longitude)
            
            
            return .run { send in
                let placeMark = try? await CLGeocoder().reverseGeocodeLocation(location).last
                let locality = placeMark?.locality ?? "" // 시, 구
                let subLocality = placeMark?.subLocality ?? "" // 동, 읍, 면
                let address = "\(locality) \(subLocality)"
                await send(.updateAddress(address))
            }
        }
    }
}

