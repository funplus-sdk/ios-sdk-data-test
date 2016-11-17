//
//  ConfigFactory.swift
//  DataTestApp
//
//  Created by Yuankun Zhang on 23/10/2016.
//  Copyright © 2016 funplus. All rights reserved.
//

import Foundation
@testable import FunPlusSDK

class ConfigFactory {
    
    static let APP_ID = "test"
    static let APP_KEY = "funplus"
    static let CONFIG_ETAG = ""
    static let ENV = SDKEnvironment.sandbox
    
    class func getConfig() -> FunPlusConfig {
        return try! FunPlusConfig(
            appId: APP_ID,
            appKey: APP_KEY,
            environment: ENV,
            configEtag: CONFIG_ETAG,
            configDict: [
                "logger_endpoint":              "http://logagent.infra.funplus.net/log",
                "logger_tag":                   "test",
                "logger_key":                   "funplus",
                "logger_level":                 "info",
                "rum_endpoint":                 "https://logagent.infra.funplus.net/log",
                "rum_tag":                      "test",
                "rum_key":                      "funplus",
                "data_endpoint":                "http://logagent.infra.funplus.net/log",
                "data_tag":                     "sdk.global.prod",
                "data_key":                     "e0dd4a696b20cce9cbe1891376d21928",
                "data_upload_interval":         3,
                "adjust_app_token":             "cchqrhzyr4zu",
                "adjust_app_open_event_token":  "st1hu7"
            ]
        )
    }
}
