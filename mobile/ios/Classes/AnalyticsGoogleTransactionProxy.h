/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiProxy.h"

#import "GAI.h"

@interface AnalyticsGoogleTransactionProxy : TiProxy{
	GAITransaction *_transaction;
}

-(GAITransaction*)transaction;
-(id)initWithArgs:(NSDictionary*)args;

@end
