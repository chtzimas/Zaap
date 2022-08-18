//
//  DependencyInjector.swift
//  Zaap
//
//  Created by Christos Tzimas on 19/7/22.
//

protocol DependencyInjectorProtocol {
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Component>(type: Component.Type) -> Component?
}

final class DependencyInjector: DependencyInjectorProtocol {
    static let shared = DependencyInjector()
    
    var container: [String: Any] = [:]
    
    private init() {}
    
    func register<Component>(type: Component.Type, component: Any) {
        container["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return container["\(type)"] as? Component
    }
}
