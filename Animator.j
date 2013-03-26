/*
 * Animator.j
 * Pixity
 *
 * Created by Nicholas Small on April 1, 2010.
 * Copyright Perfect Studios, 2010. All rights reserved.
 */

@import <AppKit/CPView.j>


CPAnimationEase = 4;

var CurveFunctionMap = [];
CurveFunctionMap[CPAnimationEaseInOut] = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
CurveFunctionMap[CPAnimationEaseIn] = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
CurveFunctionMap[CPAnimationEaseOut] = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
CurveFunctionMap[CPAnimationLinear] = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
CurveFunctionMap[CPAnimationEase] = [CAMediaTimingFunction functionWithControlPoints:0.25 :0.1 :0.25 :1.0];

var optional = function(options, key, defaultValue) {
    if (typeof(options[key]) == 'undefined')
        options[key] = defaultValue;
    
    return options[key];
}

@implementation CPView (AnimatorHelpers)

- (void)fadeIn
{
    [self fade:{
        from: 0,
        to: 1
    }];
}

- (void)fadeOut
{
    [self fade:{
        from: [self alphaValue],
        to: 0
    }];
}

@end

@implementation CPView (Animators)

- (void)fade:(JSObject)options
{
    var alpha = [self alphaValue],
        from = optional(options, 'from', alpha > 0 ? alpha : 0),
        to = optional(options, 'to', alpha > 0 ? 0 : 1),
        duration = optional(options, 'duration', 1),
        curve = optional(options, 'curve', CPAnimationEase),
        delay = optional(options, 'delay', NO),
        privateDelay = optional(options, '_delay', NO);
    
    [self removeTransitionForProperty:@"opacity"];
    
    if (duration > 0)
    {
        [self setAlphaValue:from];
        
        [self addTransitionForProperty:@"opacity" duration:duration animationCurve:curve];
        [self _applyTransitions];
        
        setTimeout(function(){
            [self removeTransitionForProperty:@"opacity"];
            [self _applyTransitions];
        }, duration * 1000);
    }
    
    [self setAlphaValue:to];
}

- (void)flip:(JSObject)options
{
    var modalView = options.modalView;
    if (![modalView isKindOfClass:CPView])
        return;
    
    var lightboxWindow = [[CPWindow alloc] initWithContentRect:[[self window] frame] styleMask:CPBorderlessWindowMask];
    [lightboxWindow setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [[lightboxWindow contentView] setBackgroundColor:[CPColor colorWithCalibratedWhite:0.1 alpha:0.6]];
    [[lightboxWindow contentView] setAlphaValue:0.0];
    [lightboxWindow contentView]._DOMElement.style['-webkit-perspective'] = @"1200px";
    [lightboxWindow orderFront:self];
    setTimeout(function(){[[lightboxWindow contentView] fadeIn];},0);
    
    var oldSize = [modalView frame].size;
    [modalView setFrame:[self frame]];
    [modalView setAffineTransform:@"rotateY(-170deg)"];
    [[lightboxWindow contentView] addSubview:modalView];
    
    var currentAlpha = [self alphaValue],
        currentTransform = [self affineTransform],
        
        duration = optional(options, 'duration', 1),
        curve = optional(options, 'curve', CPAnimationEaseInOut);
    
    options._currentAlpha = currentAlpha;
    options._currentTransform = currentTransform;
    options._lightboxWindow = lightboxWindow;
    self._flipOptions = options;
    
    if (duration > 0)
    {
        [self superview]._DOMElement.style['-webkit-perspective'] = @"1200px";
        
        [self addTransitionForProperty:@"-webkit-transform" duration:duration animationCurve:curve];
        _DOMElement.style['-webkit-transform-style'] = @"preserve-3d";
        _DOMElement.style['-webkit-backface-visibility'] = @"hidden";
        
        [self _applyTransitions];
        
        [modalView addTransitionForProperty:@"left" duration:duration * 0.4 animationCurve:curve];
        [modalView addTransitionForProperty:@"top" duration:duration * 0.4 animationCurve:curve];
        [modalView addTransitionForProperty:@"width" duration:duration * 0.4 animationCurve:curve];
        [modalView addTransitionForProperty:@"height" duration:duration * 0.4 animationCurve:curve];
        [modalView addTransitionForProperty:@"-webkit-transform" duration:duration animationCurve:curve];
        modalView._DOMElement.style['-webkit-transform-style'] = @"preserve-3d";
        modalView._DOMElement.style['-webkit-backface-visibility'] = @"hidden";
        
        [modalView _applyTransitions];
    }
    
    // var transform = CGAffineTransformScale(currentTransform, 1.5, 1.5);
    // CGAffineTransform3DRotateY(transform, 170 * PI / 180);
    // var transform = CGAffineTransformMake([-1.47721, 0, 0, 0], [0, 1.5, 0, 0], [0.260472, 0, 0, 0], [0, 0], [0], [1]);
    
    var transform = @"rotateY(170deg)";
    [self setAffineTransform:transform];
    
    setTimeout(function(){
        [modalView setAffineTransform:CGAffineTransformMakeIdentity()];
    }, 0);
    
    setTimeout(function(){
        var contentView = [[self window] contentView],
            bounds = [contentView bounds];
        
        [modalView setFrame:CGRectMake(CGRectGetMidX(bounds) - oldSize.width * 0.5, CGRectGetMidY(bounds) - oldSize.height * 0.5, oldSize.width, oldSize.height)];
    }, duration * 0.5 * 1000);
}

- (void)unflip
{
    var options = self._flipOptions;
    if (!options)
        return;
    
    delete self._flipOptions;
    
    var currentAlpha = options._currentAlpha,
        currentTransform = options._currentTransform,
        lightboxWindow = options._lightboxWindow,
        modalView = options.modalView,
        
        duration = options.duration;
    
    if (duration > 0)
    {
        setTimeout(function(){
            [self removeTransitionForProperty:@"-webkit-transform"];
            
            [self superview]._DOMElement.style['-webkit-perspective'] = null;
            _DOMElement.style['-webkit-transform-style'] = null;
            
            [self _applyTransitions];
            
            [modalView removeTransitionForProperty:@"-webkit-transform"];
            [modalView removeTransitionForProperty:@"left"];
            [modalView removeTransitionForProperty:@"top"];
            [modalView removeTransitionForProperty:@"width"];
            [modalView removeTransitionForProperty:@"height"];
            [modalView _applyTransitions];
        }, duration * 1000);
    }
    
    [self setAffineTransform:currentTransform];
    [modalView setAffineTransform:@"rotateY(-170deg)"];
    [modalView setFrame:[self frame]];
    
    setTimeout(function(){
        [[lightboxWindow contentView] fadeOut];
    },duration * 0.5 * 1000);
    
    setTimeout(function(){
        [lightboxWindow orderOut:self];
    },duration * 1000);
}

@end

@implementation CPView (AnimatorProperties)

- (void)addTransitionForProperty:(CPString)property duration:(float)duration animationCurve:(CAMediaTimingFunction)curve
{
    var properties = self._transitionProperties;
    if (!properties)
    {
        properties = {};
        self._transitionProperties = properties;
    }
    
    var thisProperty = properties[property];
    if (!thisProperty)
    {
        thisProperty = {};
        properties[property] = thisProperty;
    }
    
    thisProperty.duration = duration + @"s";
    
    if (![curve isKindOfClass:CAMediaTimingFunction])
        curve = CurveFunctionMap[curve] || [CurveFunctionMap lastObject];
        
    thisProperty.curve = @"cubic-bezier(" + [curve._c1x, curve._c1y, curve._c2x, curve._c2y].join(@", ") + @")";
}

- (void)removeTransitionForProperty:(CPString)property
{
    var properties = self._transitionProperties;
    if (!properties)
        return;
    
    delete properties[property];
}

- (void)_applyTransitions
{
    var properties = self._transitionProperties;
    if (!properties)
        properties = {};
    
    var propStyle = [],
        durationStyle = [],
        curveStyle = [];
    
    for (property in properties)
    {
        var options = properties[property];
        
        propStyle.push(property);
        durationStyle.push(options.duration);
        curveStyle.push(options.curve);
    }
    
    var style = _DOMElement.style,
        prefixes = [@"webkit", @"moz", @"o"];
    
    for (var i = 0, count = prefixes.length; i < count; i++)
    {
        var prefix = prefixes[i];
        style[prefix + @"TransitionProperty"] = propStyle.join(@", ");
        style[prefix + @"TransitionDuration"] = durationStyle.join(@", ");
        style[prefix + @"TransitionTimingFunction"] = curveStyle.join(@", ");
    }
    
    [[CPRunLoop currentRunLoop] performSelectors];
}

- (void)setAffineTransform:(CGAffineTransform)anAffineTransform
{
    if (!anAffineTransform)
        anAffineTransform = CGAffineTransformMakeIdentity();
    
    if (!anAffineTransform.isa)
    {
        if (_transform && !_transform.isa && CGAffineTransformEqualToTransform(_transform, anAffineTransform))
            return;
        
        _transform = CGAffineTransformMakeCopy(anAffineTransform);
        
        if (CGAffineTransformIsIdentity(_transform))
            _DOMElement.style["-webkit-transform"] = null;
        else
            _DOMElement.style["-webkit-transform"] = "matrix(" +
                _transform.a + ", " +
                _transform.b + ", " +
                _transform.c + ", " +
                _transform.d + ", " +
                _transform.tx + ", " +
                _transform.ty + ")";
    }
    else
    {
        _transform = anAffineTransform;
        
        if ([_transform isKindOfClass:CPString])
            _DOMElement.style["-webkit-transform"] = _transform;
    }
}

@end

function CGAffineTransform3DFrom2D(aTransform) {
    return CGAffineTransformMake(
        [aTransform.a, aTransform.b, 0, 0],
        [aTransform.c, aTransform.d, 0, 0],
        [0, 0, 1, 0],
        [aTransform.e, aTransform.f], [0], [1]
    );
}

function CGAffineTransform3DConcat(lhs, rhs) {
    
}

function CGAffineTransform3DMakeRotationY(angle) {
    var sin = SIN(angle),
        cos = COS(angle);
    
    return CGAffineTransformMake(
        [cos, 0, -sin, 0],
        [0, 1, 0, 0],
        [sin, 0, cos, 0],
        [0, 0], [0], [1]
    );
}

function CGAffineTransform3DRotateY(aTransform, angle) {
    
}