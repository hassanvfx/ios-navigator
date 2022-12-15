//
//  File.swift
//  
//
//  Created by hassan uriostegui on 12/15/22.
//

import UIKit
import CoreUIKit

 extension Navigator{
     
     func stopObservingCoreUIKitNavigationEvents(){
         guard let coreUIKitObserver = coreUIKitObserver else {
             return
         }
         NotificationCenter.default.removeObserver(coreUIKitObserver)
     }
    
     func observeCoreUIKitNavigationEvents(){
         coreUIKitObserver = NotificationCenter.default.addObserver(forName: .navEvent, object: nil, queue: .main) { [weak self] notification in
             
             if let event = notification.object as? CoreUIKit.NavEventType {
                 switch event{
                 case .back:
                     self?.popController()
                 case .dismiss:
                     self?.dismissSheet()
                 }
             }
         }
     }
}
