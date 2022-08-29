//
//  Navigator+Sheets.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/10/21.
//

import SwiftUI

extension Navigator {
    func titled(sheet: Sheet) -> String? {
        switch sheet {
        case .measurementsInfo:
            return "Sizing Guide"
        default:
            return nil
        }
    }
}

extension Navigator {
    @ViewBuilder
    func make(sheet _: Sheet) -> some View {
        Spacer()
//        switch sheet {
//        case .measurementsInfo:
//            return MeasurementsInfoView().edgesIgnoringSafeArea(.all).lux.view
//        case .dubbleEditor:
//            return Spacer().lux.view
//        case .outfitPicker:
//            return Spacer().lux.view
//        case .scenePicker:
//            return ScenesView().lux.view
//        case .wallet:
//            return Spacer().lux.view
//        }
    }
}
