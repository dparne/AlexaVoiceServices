//
//  AlexaVoiceServicesProtocol.swift
//  AlexaVoiceServices
//
//  Created by Dinesh Reddy Parne on 8/9/16.
//  Copyright © 2016 Dinesh Parne. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Result

public protocol AlexaVoiceServicesProtocol {
    
    var eventListener: Observer<AlexaVoiceServicesEvent, NoError> { get }
    
    var directiveProvider: Signal<AlexaVoiceServicesDirective, NoError> { get }
}
