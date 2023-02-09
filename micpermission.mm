/*
	Copyright (C) 2019-2021 Doug McLain

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

#include "micpermission.h"
//#import <Foundation/NSUserNotification.h>
//#import <Foundation/NSString.h>
#ifdef Q_OS_IOS
#import <UIKit/UIKit.h>
#endif
#import <AVFoundation/AVCaptureDevice.h>
int MicPermission::check_permission()
{
#ifdef Q_OS_IOS
	[UIApplication sharedApplication].idleTimerDisabled = YES;
#endif
	[UIApplication sharedApplication].idleTimerDisabled = YES;
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if(status != AVAuthorizationStatusAuthorized){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {

        }];
    }
    return status;
}
