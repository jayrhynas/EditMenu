@_functionBuilder
public struct ArrayBuilder<T> {
    public static func buildBlock() -> [T] { [] }
    public static func buildBlock(_ expression: T) -> [T] { [expression] }
    public static func buildBlock(_ elements: T...) -> [T] { elements }
    public static func buildBlock(_ elementGroups: [T]...) -> [T] { elementGroups.flatMap { $0 } }
    public static func buildBlock(_ elements: [T]) -> [T] { elements }
    public static func buildEither(first: [T]) -> [T] { first }
    public static func buildEither(second: [T]) -> [T] { second }
    public static func buildIf(_ element: [T]?) -> [T] { element ?? [] }
    public static func buildBlock(_ element: Never) -> [T] {}
}
