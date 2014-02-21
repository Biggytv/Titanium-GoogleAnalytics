/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComProximateGoogleAnalyticsModule.h"
#import "AnalyticsGoogleTransactionProxy.h"
#import "AnalyticsGoogleTrackerProxy.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComProximateGoogleAnalyticsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"82aebee1-bd00-4c99-8192-8a2c8d9e08fc";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.proximate.google.analytics";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma mark Public APIs

-(id)getTracker:(id)args
{
    NSString *trackingId;
    ENSURE_ARG_AT_INDEX(trackingId, args, 0, NSString);
    
	return [[[AnalyticsGoogleTrackerProxy alloc] initWithTrackingId:trackingId] autorelease];
}

-(id)makeTransaction:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    return [[[AnalyticsGoogleTransactionProxy alloc] initWithArgs:args] autorelease];
}

-(id)optOut
{
    return [NSNumber numberWithBool:optOut];
}

-(void)setOptOut:(id)value
{
    ENSURE_UI_THREAD_1_ARG(value);
    ENSURE_TYPE(value, NSNumber);
    [GAI sharedInstance].optOut = optOut = [TiUtils boolValue:value];
}

-(id)defaultTracker
{
    return [[AnalyticsGoogleTrackerProxy alloc] initWithDefault];
}

-(id)debug
{
    return [NSNumber numberWithBool:debug];
}

-(void)setDebug:(id)value
{
    ENSURE_UI_THREAD_1_ARG(value);
    ENSURE_TYPE(value, NSNumber);
    [GAI sharedInstance].debug = debug = [TiUtils boolValue:value];
}

-(id)dispatchInterval
{
    return [NSNumber numberWithDouble:dispatchInterval];
}

-(void)setDispatchInterval:(id)value
{
    ENSURE_UI_THREAD_1_ARG(value);
    ENSURE_TYPE(value, NSNumber);
    [GAI sharedInstance].dispatchInterval = dispatchInterval = [value doubleValue];
}

-(void)setTrackUncaughtExceptions:(id)value
{
    ENSURE_UI_THREAD_1_ARG(value);
    ENSURE_TYPE(value, NSNumber);
    [GAI sharedInstance].trackUncaughtExceptions = [value boolValue];
}

@end
