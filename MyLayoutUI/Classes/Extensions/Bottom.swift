//
//  TangramKit+Bottom.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: bottom
public extension MyLayoutDSL {
    
    ///【Tangram: 以传入的 数值 设置当前对象的边距值 下边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func bottom(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.bottom)
    }
    
    ///【Tangram: 以传入的 数值 设置当前对象的边距值 下安全边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func bottomSafe(_ offset: CombinedLiteral = .default) -> Self {
        return offsetBy(offset, for:.bottom, inSafe: true)
    }
    
    ///【Tangram: 以传入 视图的边界 为起始点设置当前对象的边距值 下边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min/.in
    @discardableResult
    func bottom(by anchor: ViewYaxisAnchor, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(anchor, for:.bottom, extra: offset)
    }
    
    ///【Tangram: 以传入 视图的边界 为起始点设置当前对象的边距值 下边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func bottom(by sizeClass: TGViewSizeClass, offset: CombinedLiteral = .zero) -> Self {
        return offsetBy(sizeClass.lyt.bottom, for:.bottom, extra:offset)
    }
}

#endif
