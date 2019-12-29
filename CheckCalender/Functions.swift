//
//  Functions.swift
//  CheckCalender
//
//  Created by Tan Yee Gene on 29/12/2019.
//  Copyright © 2019 Tan Yee Gene. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
