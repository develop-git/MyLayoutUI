//
//  TangramLayoutStacks.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/1/16.
//

#if canImport(TangramKit)
import TangramKit


public typealias ViewBuilder<T> = (_ layout: T)->Void

/// 垂直布局（子视图以垂直方向列表展示）
/// - Parameters:
open class VStack : TGLinearLayout {
    
    public struct Alignment : OptionSet {
        public let rawValue : Int
        public init(rawValue: Int) {self.rawValue = rawValue}
        
        /// 左边停靠或者左对齐
        public static let left = Alignment(rawValue:1)
        /// 水平中心停靠或者水平居中对齐
        public static let center = Alignment(rawValue:2)
        /// 右边停靠或者右对齐
        public static let right = Alignment(rawValue:4)
        /// 窗口水平中心停靠，表示在屏幕窗口的水平中心停靠
        public static let windowCenter = Alignment(rawValue: 8)
        /// 水平间距拉伸，并且头尾部分的间距是0, 如果只有一个子视图则变为左边停靠
        public static let between = Alignment(rawValue: 16)
        /// 头部对齐,对于阿拉伯国家来说是和Right等价的,对于非阿拉伯国家则是和Left等价的
        public static let leading = Alignment(rawValue: 32)
        /// 尾部对齐,对于阿拉伯国家来说是和Left等价的,对于非阿拉伯国家则是和Right等价的
        public static let trailing = Alignment(rawValue:64)
        /// 水平间距环绕拉伸，并且头尾部分为其他部分间距的一半, 如果只有一个子视图则变为水平居中停靠
        public static let around = Alignment(rawValue: 128)
        /// 水平间距等分拉伸，并且头尾部分和其他部分间距的一样, 如果只有一个子视图则变为水平居中停靠
        public static let among:Alignment = [Alignment.between, Alignment.around]
        /// 水平宽度填充
        public static let fill:Alignment = [Alignment.left, Alignment.center, Alignment.right]
    }
    
    /// 垂直布局初始化
    /// - Parameters:
    ///   - alignment:   子视图对齐方式 默认 左对齐
    ///   - space:       子视图间距
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(align alignment: Alignment = .left, space: CGFloat? = nil, _ viewBuilder: ViewBuilder<VStack>) {
        
        super.init(frame: .zero, orientation: .vert)
        self.backgroundColor = UIColor.white
        self.tg_gravity = TGGravity(rawValue: alignment.rawValue)
        self.tg_space = space ?? 0
        
        viewBuilder(self)
    }
    
    @discardableResult
    public init(align alignment: Alignment = .left, space: CGFloat? = nil) {
        super.init(frame: .zero, orientation: .vert)
        self.backgroundColor = UIColor.white
        self.tg_space = space ?? 10
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}

/// 水平布局 子视图在水平方向上按添加顺序展示
/// - Parameters:
open class HStack : TGLinearLayout {
    
    public struct Alignment : OptionSet {
        public let rawValue :Int
        public init(rawValue: Int) {self.rawValue = rawValue}
        
        /// 上边停靠或者上对齐
        public static let top = Alignment(rawValue:1 << 8)
        /// 垂直中心停靠或者垂直居中对齐
        public static let center = Alignment(rawValue:2 << 8)
        /// 下边停靠或者下边对齐
        public static let bottom = Alignment(rawValue:4 << 8)
        /// 窗口垂直中心停靠，表示在屏幕窗口的垂直中心停靠
        public static let windowCenter = Alignment(rawValue:8 << 8)
        /// 垂直间距拉伸，并且头尾部分的间距是0, 如果只有一个子视图则变为上边停靠
        public static let between = Alignment(rawValue: 16 << 8)
        /// 垂直高度填充
        public static let fill:Alignment = [Alignment.top, Alignment.center, Alignment.bottom]
        /// 基线对齐,只支持水平线性布局，指定基线对齐必须要指定出一个基线标准的子视图
        public static let baseline = Alignment(rawValue: 32 << 8)
        /// 垂直间距环绕拉伸，并且头尾部分为其他部分间距的一半, 如果只有一个子视图则变为垂直居中停靠
        public static let around = Alignment(rawValue: 64 << 8)
        /// 垂直间距等分拉伸，并且头尾部分和其他部分间距的一样, 如果只有一个子视图则变为垂直居中停靠
        public static let among:Alignment = [Alignment.between, Alignment.around]
    }
    
    /// 水平布局初始化
    /// - Parameters:
    ///   - alignment:   子视图对齐方式 默认 顶部对齐
    ///   - space:       子视图间距
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(alignment: Alignment = .top, space: CGFloat? = nil, _ viewBuilder: ViewBuilder<HStack>) {
        
        super.init(frame: .zero, orientation: .horz)
        self.backgroundColor = UIColor.white
        
        self.tg_gravity = TGGravity(rawValue: alignment.rawValue)
        self.tg_space = space ?? 10
        
        viewBuilder(self)
    }
    
    @discardableResult
    public init(alignment: Alignment = .center, space: CGFloat? = nil) {
        super.init(frame: .zero, orientation: .horz)
        self.backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// 重叠布局 子视图尺寸及位置依赖布局视图
/// 各个子视图之间互不影响
/// - Parameters:
open class ZStack : TGFrameLayout {
    
    /// 重叠布局初始化
    /// - Parameters:
    ///   - alignment:   子视图对齐方式 默认 无对齐
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(alignment: TGGravity = .none, _ viewBuilder: ViewBuilder<ZStack>) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        self.tg_gravity = alignment
        viewBuilder(self)
    }
    
    @discardableResult
    public init(alignment: TGGravity = .none) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        self.tg_gravity = alignment
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// 相对布局 子视图之间可相互参照布局位置等
/// - Parameters:
open class RStack : TGRelativeLayout {
    
    /// 相对布局初始化
    /// - Parameters:
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(_ viewBuilder: ViewBuilder<RStack>) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        viewBuilder(self)
    }
    
    @discardableResult
    public init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// 浮动布局 子视图 从左到右 从上到下 顺序进行布局
/// - Parameters:
open class FloatStack : TGFloatLayout {
    
    /// 浮动布局初始化
    /// - Parameters:
    ///   - space:       子视图间距
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(space: CGFloat = 0, _ viewBuilder: ViewBuilder<FloatStack>) {
        super.init(frame: .zero, orientation: .vert)
        self.backgroundColor = UIColor.white
        self.tg_space = space
        viewBuilder(self)
    }
    
    @discardableResult
    public init(space: CGFloat = 0) {
        super.init(frame: .zero, orientation: .vert)
        self.backgroundColor = UIColor.white
        self.tg_space = space
    }
    
    /// 浮动布局初始化
    /// - Parameters:
    ///   - space:       子视图间距
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(vspace: CGFloat, hspace: CGFloat, _ viewBuilder: ViewBuilder<FloatStack>) {
        super.init(frame: .zero, orientation: .vert)
        self.backgroundColor = UIColor.white
        self.tg_vspace = vspace
        self.tg_hspace = hspace
        viewBuilder(self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// 流式布局 子视图 从左到右 从上到下 顺序进行布局
/// - Parameters:
open class FlowStack : TGFlowLayout {
    
    /// 浮动布局初始化
    /// - Parameters:
    ///   - space:       子视图间距
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(columns: Int, _ viewBuilder: ViewBuilder<FlowStack>) {
        super.init(frame: .zero, arrangedCount: columns)
        self.backgroundColor = UIColor.white
        viewBuilder(self)
    }
    
    @discardableResult
    public init(columns: Int = 0) {
        super.init(frame: .zero, arrangedCount: columns)
        self.backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// 填充布局 可向子视图提供具体的尺寸，以便于子视图布局，子视图布局依赖frame设置
/// - Parameters:
open class GeometryReader : TGFrameLayout {
    
    /// 填充布局初始化
    /// - Parameters:
    ///   - alignment:   子视图对齐方式 默认 左对齐
    ///   - viewBuilder: 视图布局设置回调
    @discardableResult
    public init(_ alignment: TGGravity = .none, _ viewBuilder: @escaping ViewBuilder<GeometryReader>) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        self.lyt.size(.fill)
        self.tg_gravity = alignment
        self.lyt.completedLayout { layout, view in
            viewBuilder(view as! GeometryReader)
        }
    }
    
    @discardableResult
    public init(_ alignment: TGGravity = .none) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        self.lyt.size(.fill)
        self.tg_gravity = alignment
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

#endif
