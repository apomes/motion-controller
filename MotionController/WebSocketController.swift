//
//  WebSocketController.swift
//  MotionController
//
//  Created by Ausias on 03/11/2017.
//  Copyright © 2017 kobiuter. All rights reserved.
//

import Foundation
import Starscream



class WebSocketController: WebSocketDelegate {
    
    // MARK: - WebSocket Delegate Methods
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        if let e = error {
            print("websocket is disconnected: \(e.localizedDescription)")
        } else {
            print("websocket disconnected")
        }
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("Received text: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data.count)")
    }
    
}
