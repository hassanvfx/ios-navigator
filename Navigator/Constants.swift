//
//  Constants.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//
import UIKit
import SwiftUI
import Resolver

enum DemoTabs: Int,NavigatorTabItem {
    
    case home,
         store,
         dubble
    
    var image: UIImage{
        UIImage(named:"circle")!
    }
    
    var imageActive: UIImage{
        UIImage(named:"circle.fill")!
    }

    var intValue: Int{
        self.rawValue
    }
    
    var tapOverride: (() -> Void)?{
        nil
    }
    
    var displayName:String{
        switch self {
        case .home:
            return "Home"
        case .store:
            return "Store"
        case .dubble:
            return "Me"
        }
    }
    
    
    func navFactory(tabController:TabBarController<DemoTabs>)->()->UINavigationController{
        
        switch self {
        case .home:
            return { tabController.linkAsNavigationController(root: AnyView(Rectangle().fill(Color.red))) }
        case .store:
            return { tabController.linkAsNavigationController(root: AnyView(Rectangle().fill(Color.green))) }
        case .dubble:
            return { tabController.linkAsNavigationController(root: AnyView(Rectangle().fill(Color.blue))) }
        }

       
    }
    
    static func item(idx:Int)->DemoTabs {
        switch idx {
        case 0:
            return .home
        case 1:
            return .store
        case 2:
            return .dubble
        default:
            fatalError()
        }
    }
    
    static var allItems: [DemoTabs]{
        [.home,.store,.dubble ]
    }
    
   
    static var defaultItem: DemoTabs{
        .home
    }
    
}

public enum Sheet: String {
    case measurementsInfo,
         dubbleEditor,
         outfitPicker,
         scenePicker,
         wallet
}
