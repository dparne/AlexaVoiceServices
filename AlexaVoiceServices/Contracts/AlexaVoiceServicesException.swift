//
//  AlexaVoiceServicesException.swift
//  AlexaVoiceServices
//
//  Created by Dinesh Reddy Parne on 8/10/16.
//  Copyright © 2016 Dinesh Parne. All rights reserved.
//

import Foundation

/**
 Exceptions
 
 Code                           HTTP Status Code	Description
 INVALID_REQUEST_EXCEPTION      400                 The request was malformed.
 UNAUTHORIZED_REQUEST_EXCEPTION	403                 The request was not authorized.
 THROTTLING_EXCEPTION           429                 Too many requests to the Alexa Voice Service.
 INTERNAL_SERVICE_EXCEPTION     500                 Internal service exception.
 N/A                            503                 The Alexa Voice Service is unavailable.
 */

public protocol AlexaVoiceServicesExceptionProtocol {
    
    var code: String? { get }
    var description: String? { get }
    
}

public class AlexaVoiceServicesException: ErrorType, AlexaVoiceServicesExceptionProtocol {
    public var code: String?
    public var description: String?
}