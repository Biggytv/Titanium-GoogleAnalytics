/**
 * This file was auto-generated by the Titanium Module SDK helper for Android
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2010 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 *
 */
package com.proximate.google.analytics;

import android.app.Activity;

import com.google.analytics.tracking.android.GAServiceManager;
import com.google.analytics.tracking.android.GoogleAnalytics;

import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.kroll.common.TiConfig;
import org.appcelerator.titanium.TiApplication;
import org.appcelerator.titanium.util.TiConvert;

import java.util.HashMap;

@Kroll.module(name="GoogleAnalytics", id="com.proximate.google.analytics")
public class GoogleAnalyticsModule extends KrollModule
{

	// Standard Debugging variables
	private static final String LCAT = "GoogleAnalyticsModule";
	private static final boolean DBG = TiConfig.LOGD;

	private GoogleAnalytics mInstance;

	public GoogleAnalyticsModule()
	{
		super();
		TiApplication appContext = TiApplication.getInstance();
		Activity activity = appContext.getCurrentActivity();
		mInstance = GoogleAnalytics.getInstance(activity);
	}

	@Kroll.onAppCreate
	public static void onAppCreate(TiApplication app)
	{

	}

	// Methods
	@Kroll.method
	public TrackerProxy getTracker(String trackingID)
	{
		return new TrackerProxy(mInstance.getTracker(trackingID));
	}

	@Kroll.getProperty
	public TrackerProxy getDefaultTracker()
	{
		return new TrackerProxy(mInstance.getDefaultTracker());
	}

	@Kroll.setProperty
	public void setOptOut(boolean optOut)
	{
		mInstance.setAppOptOut(optOut);
	}
}

