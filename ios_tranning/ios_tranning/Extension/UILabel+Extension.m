//
//  UILabel+Extension.m
//  ios_tranning
//
//  Created by Vitalify on 8/17/21.
//

#import "UILabel+Extension.h"

@implementation UILabel (Utility)

- (void)boldRange:(NSRange)range
{
    if (![self respondsToSelector:@selector(setAttributedText:)])
    {
        return;
    }
    NSMutableAttributedString *attributedText;
    if (!self.attributedText)
    {
        attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    else
    {
        attributedText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    }
    [attributedText setAttributes:@{NSFontAttributeName:self.font} range:range]; self.attributedText = attributedText;
}

- (void)boldSubstring:(NSString*)substring
{
    NSRange range = [self.text rangeOfString:substring]; [self boldRange:range];
}

- (void)boldAndColorRange:(NSRange)range forColor:(UIColor *)color
{
    if (![self respondsToSelector:@selector(setAttributedText:)])
    {
        return;
    }
    NSMutableAttributedString *attributedText;
    
    if (!self.attributedText)
    {
        attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    else
    {
        attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    [attributedText setAttributes:@{NSFontAttributeName:self.font, NSForegroundColorAttributeName:color} range:range];
    self.attributedText = attributedText;
}

- (void)boldAndColorSubstring:(NSString*)substring forColor:(UIColor *)color
{
    NSRange range = [self.text rangeOfString:substring];
    [self boldAndColorRange:range forColor:color];
}

- (void)colorSubstring:(NSString*)substring forColor:(UIColor *)color
{
    NSRange range = [self.text rangeOfString:substring];
    if (![self respondsToSelector:@selector(setAttributedText:)])
    {
        return;
    }
    NSMutableAttributedString *attributedText;
    
    if (!self.attributedText)
    {
        attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    else
    {
        attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    [attributedText setAttributes:@{ NSForegroundColorAttributeName:color} range:range];
    self.attributedText = attributedText;
}

- (void)colorSubstring:(NSString*)substring forColor:(UIColor *)color font:(UIFont *) subfont
{
    NSRange range = [self.text rangeOfString:substring];
    if (![self respondsToSelector:@selector(setAttributedText:)])
    {
        return;
    }
    NSMutableAttributedString *attributedText;
    
    if (!self.attributedText)
    {
        attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    else
    {
        attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    [attributedText setAttributes:@{ NSForegroundColorAttributeName:color,NSFontAttributeName:subfont } range:range];
    self.attributedText = attributedText;
}


- (void) showhtmlText {
   
    NSError *err = nil;
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]
     initWithData: [self.text dataUsingEncoding:NSUTF8StringEncoding]
     options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSFontAttributeName:self.font }
     documentAttributes: nil
                                                 error: &err];
    
    self.attributedText = attributedText;
    if(err)
        NSLog(@"Unable to parse label text: %@", err);
}



- (void)strikeOutString:(NSString *) substring withStrokeColor:(UIColor *)strokeColor
{
    NSRange range = [self.text rangeOfString:substring];
    if (range.location == -1)
    {
        return;
    }
    if (![self respondsToSelector:@selector(setAttributedText:)])
    {
        return;
    }
    NSMutableAttributedString *atrText;
    
    if (!self.attributedText)
    {
        atrText = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    else
    {
        atrText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
 
    [atrText addAttributes:@{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)
                             , NSStrikethroughColorAttributeName: strokeColor
                             , NSBackgroundColorAttributeName: [UIColor clearColor]} range:range];
    
    
    self.attributedText = atrText;
}

-(CGSize)sizeOfMultiLineLabel{
    //Label text
    NSString *aLabelTextString = [self text];
    
    //Label font
    UIFont *aLabelFont = [self font];
    
    //Width of the Label
    CGFloat aLabelSizeWidth = self.frame.size.width;
    
    //Return the calculated size of the Label
    return [aLabelTextString boundingRectWithSize:CGSizeMake(aLabelSizeWidth, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{
                                           NSFontAttributeName : aLabelFont
                                       }
                                          context:nil].size;
    
    return [self bounds].size;
    
}

@end
