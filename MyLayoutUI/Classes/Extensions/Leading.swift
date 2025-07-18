//
//  TangramKit+Leading.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: leading
public extension MyLayoutDSL {
    
    ///【Tangram: 左边距，默认 10 】
    /// 默认不支持动态修改 --
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func leading(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.leading)
    }
    
    ///【Tangram: 左安全边距，默认 10 】
    /// 默认不支持动态修改 --
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func leadingSafe(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.leading, inSafe: true)
    }
    
    ///【Tangram: 左边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func leading(by anchor: ViewXaxisAnchor, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(anchor, for:.leading, extra:offset)
    }
    
    ///【Tangram: 左边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func leading(by sizeClass: TGViewSizeClass, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(sizeClass.lyt.leading, for:.leading, extra:offset)
    }
}

// MARK: 左上 左下(done)
public extension MyLayoutDSL {
    ///【Tangram: 以传入值为起始点设置当前对象的边距值 左上边距，默认 10 】
    @discardableResult
    func leadingTop(_ offset: CombinedLiteral = .default) -> Self {
        return self.leading(offset)
            .topSafe(offset)
    }
    
    ///【Tangram: 左上边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func leadingTop(_ leading: CombinedLiteral,
                    _ top: CombinedLiteral) -> Self {
        return self.leading(leading)
            .top(top)
    }
    
    ///【Tangram: 以传入值为起始点设置当前对象的边距值 左下边距，默认 10 】
    @discardableResult
    func leadingBottom(_ offset: CombinedLiteral = .default) -> Self {
        return self.leading(offset)
            .bottom(offset)
    }
    
    ///【Tangram: 左下边距，默认 10 】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func leadingBottom(_ leading: CombinedLiteral,
                       _ bottom: CombinedLiteral) -> Self {
        return self.leading(leading)
            .bottom(bottom)
    }
}

#endif
