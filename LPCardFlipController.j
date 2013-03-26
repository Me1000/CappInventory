/*
 * LPCardFlipController.j
 *
 * Created by Ludwig Pettersson on June 29, 2010.
 * 
 * The MIT License
 * 
 * Copyright (c) 2010 Ludwig Pettersson
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 */
@import <Foundation/CPObject.j>
@import "LPViewAnimation.j"

var sharedCardFlipController = nil,
    ShouldUseFlipAnimation = NO;


@implementation LPCardFlipController : CPObject
{
    id _delegate @accessors(property=delegate);
    
    CPWindow containerWindow;
    CPWindow mainWindow;
    
    float animationDuration;
    
    CGPoint startCenter;
    CGPoint endCenter;
    
    id frontView @accessors;
    id backView @accessors;
}

+ (id)sharedController
{
    if (!sharedCardFlipController)
        sharedCardFlipController = [[self alloc] init];
        
    return sharedCardFlipController;
}

- (void)init
{
    if (self = [super init])
    {
        ShouldUseFlipAnimation = LPTestCSSFeature("BackfaceVisibility");
        
        containerWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessWindowMask];
        //containerWindow._DOMElement.style["overflow"] = "visible";
        
        var contentView = [containerWindow contentView];
        //contentView._DOMElement.style["overflow"] = "visible";
        //[contentView setClipsToBounds:NO];
        
        var DOMElement = contentView._DOMElement;
        DOMElement.style["-webkit-transform-style"] = @"preserve-3d";
        DOMElement.style["-webkit-perspective"] = @"600";
        
        animationDuration = 0.65;
    }
    return self;
}

- (void)setStartCenter:(CGPoint)aStartCenter endCenter:(CGPoint)anEndCenter
{
    startCenter = aStartCenter;
    endCenter = anEndCenter;
}

- (void)reverseFlipCurrentView
{
    [self flipWithView:frontView backView:backView reverse:YES];
}

- (void)flipWithView:(id)aFrontView backView:(id)aBackView
{
    [self flipWithView:aFrontView backView:aBackView reverse:NO];
}

- (void)flipWithView:(id)aFrontView backView:(id)aBackView reverse:(BOOL)isReverse
{
    mainWindow = [aFrontView window];

    var superView = [aFrontView superview];

    if (ShouldUseFlipAnimation)
    {
        if (aBackView !== backView)
            aBackView._DOMElement.style["-webkit-transform"] = @"rotateY(180deg)";
    
        frontView = aFrontView;
        backView = aBackView;
    
        // Show the window
        [containerWindow makeKeyAndOrderFront:nil];
    
        var contentView = [containerWindow contentView];

        // Prepeare each view
        // no need to do this if we are just reversing it, since it has then already been done.
        //if (!isReverse)
        //{
            // The window should be as big as the largest view
            // plus some extra so we dont get the clipping
            var containerWindowSize = [aBackView frame].size;
            containerWindowSize.height += 200;
            [containerWindow setFrameSize:containerWindowSize];
        
            [self prepareViewWithCSS:frontView];
            [frontView setCenter:[contentView center]];
    
            [self prepareViewWithCSS:backView];
            [backView setCenter:[contentView center]];
    
            [contentView setSubviews:[frontView, backView]];
        //}

        var bounds = [[containerWindow contentView] bounds];

        // Get the origins
        var startOrigin = CGPointMakeCopy(isReverse ? endCenter : startCenter);
        startOrigin.x -= CGRectGetMidX(bounds);
        startOrigin.y -= CGRectGetMidY(bounds);
    
        var endOrigin = CGPointMakeCopy(isReverse ? startCenter : endCenter);
        endOrigin.x -= CGRectGetMidX(bounds);
        endOrigin.y -= CGRectGetMidY(bounds);

        [containerWindow setFrameOrigin:startOrigin];

        // The moving animation
        var animation = [[LPViewAnimation alloc] initWithViewAnimations:[
             {
                 @"target": containerWindow,
                 @"animations": [
                     [LPOriginAnimationKey, [containerWindow frame].origin, endOrigin]
                 ]
             }
         ]];
        [animation setShouldUseCSSAnimations:YES];
        [animation setAnimationCurve:CPAnimationEaseInOut];
        [animation setDuration:animationDuration];

        var frontWidth = CGRectGetWidth([frontView bounds]),
            backWidth = CGRectGetWidth([backView bounds]);
    
        // Set an initial scale for the backview
        backView._DOMElement.style["-webkit-transform"] += @" scale(" + (frontWidth / backWidth) + ")";

        // Hide backView,
        // because chrome does not support backface-visibility
        backView._DOMElement.style["opacity"] = isReverse ? 1 : 0;

        // Start the flip animation
        // it's wrapped in a timeout so that the browser does not
        // collapse all the style calls and doesnt run any of them.
        setTimeout(function() {

            // Start the moving
            [animation startAnimation];
        
            // Flip each view
            var rotate = "rotateY(" + (isReverse ? 0 : -180) + "deg) ",
                scale  = "scale(" + (isReverse ? 1.0 : backWidth / frontWidth) + ")";
            frontView._DOMElement.style["-webkit-transform"] = rotate + scale;
        
            var rotate = "rotateY(" + (isReverse ? 180 : 0) + "deg) ",
                scale  = "scale(" + (isReverse ? frontWidth / backWidth : 1.0) + ")";
            backView._DOMElement.style["-webkit-transform"] = rotate + scale;

            
        
            // Show & Hide elements manually, because chrome does not support backface-visibility
            setTimeout(function(){
                frontView._DOMElement.style["opacity"] = isReverse ? 1 : 0;
                backView._DOMElement.style["opacity"] = isReverse ? 0 : 1;
            }, (1000 * animationDuration) / 2);
        
            // Send delegate call when we have finished a reverse animation
            setTimeout(function() {

                if (_delegate && [_delegate respondsToSelector:@selector(cardFlipDidFinish:)])
                        [_delegate cardFlipDidFinish:self];
                [self removeTransformFromView:backView];
                [containerWindow orderOut:nil];

                /*if (isReverse)
                {
                    

                    
                }
                else
                {
                    //console.log([superView window]);
                    //var superView = [aFrontView superview];
                    [aBackView removeFromSuperview];
                    //[superView replaceSubview:aFrontView with:aBackView];
                    //[aBackView setFrameOrigin:CGPointMakeZero()];
                    [superView addSubview:aBackView];
                    console.log(superView);
                    [containerWindow orderOut:nil];
                }*/
            }, 1000 * animationDuration);
        
        }, 0);
    }

    // Boring, non animation version for non webkit browsers
    else
    {
        if (isReverse)
        {
            [containerWindow orderOut:nil];
            
            if (_delegate && [_delegate respondsToSelector:@selector(cardFlipDidFinish:)])
                [_delegate cardFlipDidFinish:self];
        }
        else
        {
            backView = aBackView;
        
            [backView setFrameOrigin:CGPointMakeZero()];
        
            // Just show the window
            var containerWindowSize = [backView frame].size;
            [containerWindow setFrameSize:containerWindowSize];
        
            // Replace the content
            [[containerWindow contentView] setSubviews:[backView]];
        
            // Get the end origin
            var endOrigin = CGPointMakeCopy(endCenter);
            endOrigin.x -= CGRectGetMidX([[containerWindow contentView] bounds]);
            endOrigin.y -= CGRectGetMidY([[containerWindow contentView] bounds]);
        
            [containerWindow setFrameOrigin:endOrigin];
            [containerWindow orderFront:nil];
        }
    }
}

- (void)prepareViewWithCSS:(id)aView
{
    var DOMElement = aView._DOMElement;
    DOMElement.style["-webkit-transition-timing-function"] = @"ease-in-out";
    DOMElement.style["-webkit-transition-property"] = @"-webkit-transform";
    DOMElement.style["-webkit-transition-duration"] = animationDuration + @"s";
    DOMElement.style["-webkit-backface-visibility"] = @"hidden";
    //[aView setAlphaValue:0.5];
}

- (void)removeTransformFromView:(id)aView
{
    var DOMElement = aView._DOMElement;
    DOMElement.style["-webkit-transition-timing-function"] = "";//@"ease-in-out";
    DOMElement.style["-webkit-transition-property"] = "";//@"-webkit-transform";
    DOMElement.style["-webkit-transition-duration"] = "";//animationDuration + @"s";
    DOMElement.style["-webkit-backface-visibility"] = "";//@"hidden";
    DOMElement.style["-webkit-transform"] = "";
}
@end