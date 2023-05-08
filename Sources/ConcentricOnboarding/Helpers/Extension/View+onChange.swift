//
//  View+onChange.swift
//  ConcentricOnboarding
//
//  Created by 0xacdc on 8/5/23.
//  Copyright © 2023 Exyte. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public extension View {
    @ViewBuilder func onChange<T: Equatable>(value: T, onChange: @escaping (T) -> Void) -> some View {
        if #available(iOS 14.0, *) {
            self.onChange(of: value, perform: onChange)
        } else {
            self.onReceive(Just(value)) { (value) in
                onChange(value)
            }
        }
    }
}
