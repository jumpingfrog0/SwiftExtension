//
//  LogMacros.h
//  517Driver
//
//  Created by sheldon on 15/8/26.
//  Copyright (c) 2015年 517. All rights reserved.
//

#ifndef Driver_LogMacros_h
#define Driver_LogMacros_h

#ifdef DEBUG
    #define NSLog(format, ...) do { \
        NSString *filePath = [[NSString alloc] initWithBytes:__FILE__ length:strlen(__FILE__) encoding:NSUTF8StringEncoding]; \
        NSString *origin = [[NSString alloc] initWithFormat:(format), ##__VA_ARGS__ ]; \
        (NSLog)(@"%@[%d] %s %@",[filePath lastPathComponent], __LINE__, __PRETTY_FUNCTION__, origin); \
    } while(0)
#else
    #define NSLog(format, ...)
#endif

#endif
