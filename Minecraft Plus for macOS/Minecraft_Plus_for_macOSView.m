//
//  Minecraft_Plus_for_macOSView.m
//  Minecraft Plus for macOS
//
//  Created by Anthony Li on 4/1/21.
//

#import "Minecraft_Plus_for_macOSView.h"

@implementation Minecraft_Plus_for_macOSView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1];
        
        WKWebView *webView = [[WKWebView alloc] initWithFrame:frame];
        
        // In an actual production scenario this URL would not be hardcoded. This is just a small thing though
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://plus.minecraft.net/?autorun=window"]]];
        
        webView.navigationDelegate = self;
        [self addSubview:webView];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    [webView 
     evaluateJavaScript:@"window.addEventListener('load', _ => {document.children[0].style.overflow = 'hidden';document.body.style.overflow = 'hidden';});" completionHandler:nil];
}

@end
