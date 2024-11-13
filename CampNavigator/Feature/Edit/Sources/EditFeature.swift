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
    
    public enum Action {
        case alert(PresentationAction<AlertAction>)
        case alertButtonTapped
        
        
        case updateName(String)
        case updateDate(Date)
        case updatePhotos(PhotosPickerItem?)
        case updateAddress(String)
        case chipListAction(ChipListFeature.Action)
        case addPhoto(Data)
        case updateLotions(CLLocationCoordinate2D)
        case savePlace
        case saveComplete
        
        
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
            case .alert(.presented(.confirmTapped)):
                return .send(.savePlace)
            case .alert:
                return .none
                
            case .alertButtonTapped:
                state.alert = AlertState {
                    TextState("알림")
                } actions: {
                    ButtonState(role: .cancel) {
                        TextState("취소")
                    }
                    ButtonState(action: .confirmTapped) {
                        TextState("저장")
                    }
                } message: {
                    TextState("작성된 내용을 저장할까요?")
                }
                return .none
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
            case .updatePhotos(let photo):
                state.selectedPhotoItems = photo
                return .none
            case .updateAddress(let newAddress):
                state.address = newAddress
                return .none
            case .chipListAction:
                return .none
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
                state.placeCoordinate = newLocation
                
                return .run { send in
                    let placeMark = try? await CLGeocoder().reverseGeocodeLocation(location).last
                    let locality = placeMark?.locality ?? "" // 시, 구
                    let subLocality = placeMark?.subLocality ?? "" // 동, 읍, 면
                    let address = "\(locality) \(subLocality)"
                    await send(.updateAddress(address))
                }
            }
            
        }.ifLet(\.$alert, action: \.alert)
    }
}



