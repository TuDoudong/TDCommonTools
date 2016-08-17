//
//  UIImageView+TDCommonTool.m
//  TDCommonTools
//
//  Created by TudouDong on 16/7/24.
//  Copyright © 2016年 TudouDong. All rights reserved.
//

#import "UIImageView+TDCommonTool.h"
#import <objc/runtime.h>


@implementation UIImageView (TDCommonTool)

#pragma mark - properties

- (CGContextRef)context{
   
    return (CGContextRef)CFBridgingRetain(objc_getAssociatedObject(self, _cmd));
}

- (void)setContext:(CGContextRef)context{
    objc_setAssociatedObject(self, @selector(context), (__bridge id)(context), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)imageWidth{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setImageWidth:(CGFloat)imageWidth{
    objc_setAssociatedObject(self, @selector(imageWidth), @(imageWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (CGFloat)imageHeight{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
-(void)setImageHeight:(CGFloat)imageHeight{
    objc_setAssociatedObject(self, @selector(imageHeight), @(imageHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - func

- (UIImage *)compressOriginalToSize:(CGSize)size{
    
    UIImage *resultImage = self.image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return resultImage;
    
}

- (UIColor *)getPixelColorAtLocation:(CGPoint)point{
    UIColor* color = nil;
    CGImageRef inImage = self.image.CGImage;
    
    
    
    CGFloat w = (CGFloat)CGImageGetWidth(inImage);
    CGFloat h = (CGFloat)CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    CGContextRef cgctx = nil;
    
    
    if (!(self.imageHeight == h && self.imageWidth == w && self.context)) {
        self.imageWidth = w;
        self.imageHeight = h;
        cgctx = [self createARGBBitmapContextFromImage:inImage];
        self.context = cgctx;
    }else{
        cgctx = self.context;
    }
    
    
    
    // Create off screen bitmap context to draw the image into. Format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
    
    if (cgctx == NULL) { return nil;  }
    
    // Draw the image to the bitmap context. Once we draw, the memory
    // allocated for the context for rendering will then contain the
    // raw image data in the specified color space.
    CGContextDrawImage(cgctx, rect, inImage);
    
    // Now we can get a pointer to the image data associated with the bitmap
    // context.
    unsigned char* data = CGBitmapContextGetData (cgctx);
    if (data != NULL) {
        //offset locates the pixel in the data from x,y.
        //4 for 4 bytes of data per pixel, w is width of one row of data.
        @try {
            int offset = 4*((w*round(point.y))+round(point.x));
            //NSLog(@"offset: %d", offset);
            int alpha =  data[offset];
            int red = data[offset+1];
            int green = data[offset+2];
            int blue = data[offset+3];
            //NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
            color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
        }
        @catch (NSException * e) {
            NSLog(@"%@",[e reason]);
        }
        @finally {
        }
        
    }
    // When finished, release the context
    CGContextRelease(cgctx);
    // Free image data memory for the context
    //if (data) { free(data); }
    
    return color;
}

- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage {
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    size_t             bitmapByteCount;
    size_t             bitmapBytesPerRow;
    
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    
    // Use the generic RGB color space.
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}

@end
