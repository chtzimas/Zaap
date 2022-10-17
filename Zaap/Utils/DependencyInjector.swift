//
//  DependencyInjector.swift
//  Zaap
//
//  Created by Christos Tzimas on 19/7/22.
//

final class DependencyInjector {
    static let shared = DependencyInjector()
    
    private var container: [String: Any] = [:]
    
    private init() {}
    
    func buildDependencies() {
        let userWebRepository = UserWebRepository(urlSession: .shared)
        let userService = UserService(userWebRepository: userWebRepository)
        DependencyInjector.shared.register(type: UserWebRepository.self, component: userWebRepository)
        DependencyInjector.shared.register(type: UserService.self, component: userService)
        DependencyInjector.shared.register(type: SignInViewModel.self, component: SignInViewModel())
        DependencyInjector.shared.register(type: SignUpViewModel.self, component: SignUpViewModel(userService: userService))
        DependencyInjector.shared.register(type: MainViewModel.self, component: MainViewModel())
    }
    
    private func register<Component>(type: Component.Type, component: Any) {
        container["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return container["\(type)"] as? Component
    }
}
