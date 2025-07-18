//
//  TangramKit+Border.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: 边线
public extension MyLayoutDSL {
    
    /// 【TangramKit】布局试图智能添加边线（顺序布局视图）
    /// - Parameters:
    ///   - line: 边线
    @discardableResult
    func smartBorders(_ line: TGBorderline) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_intelligentBorderline = line
        return self
    }
    
    /// 【TangramKit】布局试图添加边线
    /// - Parameters:
    ///   - edges: 边（上、下、左、右）
    ///   - line: 边线
    @discardableResult
    func borders(_ line: TGBorderline, for edges: UIRectEdge = .all) -> Self {
        guard let view = sizeClass as? TGBaseLayout else { return self }
        /// top
        if edges.contains(.top) {
            view.tg_topBorderline = line
        }
        /// left
        if edges.contains(.left) {
            view.tg_leftBorderline = line
        }
        /// right
        if edges.contains(.right) {
            view.tg_rightBorderline = line
        }
        /// bottom
        if edges.contains(.bottom) {
            view.tg_bottomBorderline = line
        }
        return self
    }
    
    /// 【TangramKit】布局试图添加顶部边线
    /// - Parameters:
    ///   - line: 边线
    @discardableResult
    func topBorder(_ line: TGBorderline) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_topBorderline = line
        return self
    }
    
    /// 【TangramKit】布局试图添加左侧边线
    /// - Parameters:
    ///   - line: 边线
    @discardableResult
    func leftBorder(_ line: TGBorderline) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_leftBorderline = line
        return self
    }
    
    /// 【TangramKit】布局试图添加右侧边线
    /// - Parameters:
    ///   - line: 边线
    @discardableResult
    func rightBorder(_ line: TGBorderline) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_rightBorderline = line
        return self
    }
    
    /// 【TangramKit】布局试图添加底部边线
    /// - Parameters:
    ///   - line: 边线
    @discardableResult
    func bottomBorder(_ line: TGBorderline) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_bottomBorderline = line
        return self
    }
}
#endif
