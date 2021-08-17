//
//  UILabel+Extension.h
//  ios_tranning
//
//  Created by Vitalify on 8/17/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Utility)

- (void)boldSubstring:(NSString*)substring;
- (void)boldRange:(NSRange)range;
- (void)boldAndColorSubstring:(NSString*)substring forColor:(UIColor *)color;
- (void)boldAndColorRange:(NSRange)range forColor:(UIColor *)color;

- (void)colorSubstring:(NSString*)substring forColor:(UIColor *)color;
- (void) showhtmlText;
- (void)colorSubstring:(NSString*)substring forColor:(UIColor *)color font:(UIFont *) subfont;
- (void)strikeOutString:(NSString *) substring withStrokeColor:(UIColor *)strokeColor;
-(CGSize)sizeOfMultiLineLabel;

@end

NS_ASSUME_NONNULL_END
