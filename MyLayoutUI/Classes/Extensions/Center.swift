//
//  TangramKit+Center.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK:  ------- Center  -------
public extension MyLayoutDSL {
    
    ///【TangramKit: 以传入视图的中心点设置当前对象的中心点偏移】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func center(offsetX: CombinedLiteral = .zero,
                offsetY: CombinedLiteral = .zero) -> Self {
        return self.centerX(offset: offsetX)
            .centerY(offset: offsetY)
    }
    
    ///【TangramKit: 以传入的数值设置当前对象的中心点x偏移】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func centerX(offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(offset, for:.centerX)
    }
    
    ///【TangramKit: 以传入的数值设置当前对象的中心点y偏移】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func centerY(offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(offset, for:.centerY)
    }
    
    ///【TangramKit: 以传入视图的中心点设置当前对象的中心点】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func center(by sizeClass: TGViewSizeClass,
                offsetX: CombinedLiteral = .zero,
                offsetY: CombinedLiteral = .zero) -> Self {
        return offsetBy(sizeClass.lyt.centerX, for:.centerX, extra:offsetX)
            .offsetBy(sizeClass.lyt.centerY, for:.centerY, extra:offsetY)
    }
    
    ///【TangramKit: 以传入视图的水平边界设置当前对象的中心点x】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func centerX(by anchor: ViewXaxisAnchor?, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(anchor, for:.centerX, extra:offset)
    }
    
    ///【TangramKit: 以传入视图的水平边界设置当前对象的中心点x】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func centerX(by sizeClass: TGViewSizeClass, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(sizeClass.lyt.centerX, for:.centerX, extra:offset)
    }
    
    ///【TangramKit: 以传入视图的垂直边界设置当前对象的中心点y】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func centerY(by anchor: ViewYaxisAnchor?, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(anchor, for:.centerX, extra:offset)
    }
    
    ///【TangramKit: 以传入视图的垂直边界设置当前对象的中心点y】
    /// 若需要 offset 动态变化，可设置 offset 为 .max/.min/.in
    @discardableResult
    func centerY(by sizeClass: TGViewSizeClass, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(sizeClass.lyt.centerX, for:.centerX, extra:offset)
    }
}

#endif
