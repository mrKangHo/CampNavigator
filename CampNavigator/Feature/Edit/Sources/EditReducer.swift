//
//  EditReducer.swift
//  Edit
//
//  Created by LEE on 8/11/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Domain
import MapKit
@Reducer
public struct EditReducer {
    
    public init() {}
    
    @ObservableState
    public struct State {
        public init(editInfo: CampPlace = CampPlace(name: "", visitDates: Date())) {
            self.editInfo = editInfo
            if let location = editInfo.location {
                
                self.mapCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
            else {
                self.mapCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5783, longitude: 126.9770), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
        }
        public var editInfo:CampPlace
        public var address:String = ""
        public var mapCoordinateRegion:MKCoordinateRegion
        public var selectedIndex: Int? = nil // 선택된 인덱스
        @Presents var alert:AlertState<Action.AlertAction>?
        
    }
    
    public enum Action {
        case removePhotoSelected(Int)
        case removePhoto
        case updateName(String)
        case updateVisitDate(Date)
        case updateLocation(MKCoordinateRegion)
        case convertAddress(CLPlacemark?)
        case savePlace
        case showAlert
        case alert(PresentationAction<AlertAction>)
        
        @CasePathable
        public enum AlertAction {
            case cancelTapped
            case confirmTapped
        }
        
    }
    
    public var body: some Reducer<State, Action> {
        
        Reduce { state, action in
            switch action {
            case .removePhotoSelected(let index):
                state.selectedIndex = index
                return .send(.showAlert)
            case .removePhoto:
                guard let removeIndex = state.selectedIndex else { return .none}
                state.editInfo.photos?.remove(at: removeIndex)
                state.selectedIndex = nil
                return .none
            case .updateName(let newName):
                state.editInfo.name = newName
                return .none
            case .updateVisitDate(let visitDate):
                state.editInfo.visitDates = visitDate
                return .none
            case .updateLocation(let newLocation):
                let coordinate = newLocation.center
                let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                                
                state.mapCoordinateRegion = newLocation
                return .run { send in
                    
                    let addressInfo = try? await CLGeocoder().reverseGeocodeLocation(location)
                    await send(.convertAddress(addressInfo?.last))
                }
            case .convertAddress(let placeMark):
                
                let locality = placeMark?.locality ?? "" // 시, 구
                let subLocality = placeMark?.subLocality ?? "" // 동, 읍, 면
                let address = "\(locality) \(subLocality)"
                print(address)
                state.address = address
                return .none
            case .savePlace:
                return .none
            case .showAlert:
                state.alert = AlertState(title: {
                    TextState("사진 삭제")
                }, actions: {
                    ButtonState(role: .destructive, action: .confirmTapped) {
                        TextState("삭제")
                    }
                    ButtonState(role: .cancel, action: .cancelTapped) {
                        TextState("취소")
                    }
                }, message: {
                    TextState("선택한 사진을 삭제 할까요?")
                })
                return .none
            case .alert(.presented(let alertAction)):
                switch alertAction {
                case .cancelTapped:
                    break
                case .confirmTapped:
                    return .send(.removePhoto)
                }
                return .none
            case .alert(.dismiss):
                return .none
            }

        }.ifLet(\.alert, action: \.alert)
    }
}

