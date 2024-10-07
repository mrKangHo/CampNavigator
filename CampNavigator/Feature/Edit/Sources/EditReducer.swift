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
import Data
import MapKit
import Resources

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
        
        public var saveResult:Bool = false
        
        @Presents var alert:AlertState<Action.AlertAction>?
        
    }
    
    public enum Action:ViewAction {
        
        
        case view(View)
        case saveComplete
        
        public enum View {
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
        
        Reduce { state, action in
            switch action {
            case .view(let viewAction):
                return viewActions(viewAction)
            case .saveComplete:
                state.saveResult = true
                print("저장완료")
                return .none
            }

        }
    }
}

extension EditReducer {
    
    private func viewActions(_ action:Action.View) -> Effect<Action> {
        switch action {
            
        case .savePlace:
            
            
            
            let facility = ["샤워실", "개인화장실"].map {CampFacility(name: $0)}
            
            let photos = [ResourcesAsset.panda.image.pngData()].compactMap{$0}
            
            let location = CampLocation(address: "강원도 속초시", latitude: 37.5783, longitude: 126.9770)
            
            let newCamp = CampPlace(name: "강호캠핑장2", visitDates: Date(), facility: facility, photos: photos, location: location)
            
            return .run { send in
                
                try? campPlace.add(newCamp)
                
                await send(.saveComplete)
            }
        }
    }
}

