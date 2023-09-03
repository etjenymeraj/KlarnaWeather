
public final class ComponentsFactory {
    public init() {}

    public var image: ImageFactory {
        ImageFactory()
    }

    public var viewBuilder: ViewBuilderFactory {
        ViewBuilderFactory()
    }

    public var button: ButtonFactory {
        ButtonFactory()
    }

    public var state: StateFactory {
        StateFactory()
    }

    public var viewModifier: ViewModifierFactory {
        ViewModifierFactory()
    }
}
