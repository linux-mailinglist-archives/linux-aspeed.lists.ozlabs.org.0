Return-Path: <linux-aspeed+bounces-3693-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP2IBjcTuGk7YwEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3693-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 15:27:03 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C929B53D
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 15:27:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZHTv5fjrz2xlm;
	Tue, 17 Mar 2026 01:26:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773671219;
	cv=none; b=cB45J/MbbP3qNSj/rP34v3n/UAAxUyjU7FauYuZNUH4IZtMHFAVYGylzGsNJYC3MZogjCoyaBvTt7VqvP6Fns4ONoZRgPfAej2MVdY6F7V8YiZDxn+fPTRJfePojOYCGUomYCYgiHYLzL01SDc+0PQyfj5QwE3xi+mo2A38O987tPdVkRPiY2gFvYEiQY0xcp9DhoKRjgpXAptb6eQAnJI3RG0Vmc6JTY2SRMtui0NI0L9Sqosrss3Z3PhMH9ZRbh8kTMHxyRWsLHEU/bQvJe7cCFV+Rx3BZxV1UsjY/q3aE0Nh2clFMOMbAh9Gq0btnDdNEwI12s8sB2UENPvm/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773671219; c=relaxed/relaxed;
	bh=lxJ4lZ8qpN0azXDhDuYNMBFlk26kc4wHsRqoUGPLHbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9DlHfK/L31KYk5ICSqwZC1CYvYal5DYa2m8ITdoyVYKafjVbdj01SRfYJIZnWxZUDOK7Io7gGE8jYJbzRDLAtnouyYMh/GlRgb9EaxP8Tuk42JDinWtQKozez46tNS2MgSq31nZGwfYNu8EfYY3429FCuopfajfOdrI1Rpy4KuU6EVdc4lSG+EiGaBg91kPIkNtpqGMfc39N4RE9e4zwR2n+3qvg+wp918E20Kuff8ufywKmMkbIEzW2VJW82el3KT7WkI7FnRABjrN0KaPyJHTTbfcf8ekNvXGoov5QP3UOjmQXfE+uJ0NwoXgVAtSvIN5joWiA2iYqg3gEYIsLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nRZ0irxM; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nRZ0irxM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZHTt6RWkz2xS3
	for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Mar 2026 01:26:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773671219; x=1805207219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FHZKMW2URFGAFnuWPY2dSlQRkpSj1pWYiDSSZoc4g/A=;
  b=nRZ0irxML49znrLNSTo7ZcIm8x+TWu2STyJdkBV2ctJVq9O2qFdGEFje
   pudazJH7d8gG1/IZcEki8mgymZg2VQPZt3i58fNYs6I9TsYuZkT9OHlRv
   33i1udPKmWRdvuY5jhpIQ3IlDCgeasUf87eNXsyDRrMIjQU3opciK2U5i
   LYtkN6aYOlLoNzZCmdeAh7+U78TWzbk0+BfA5FDJrPBVtqpFH0G0J59ZK
   B+qyTKHHRhes7dTN9rK8QP25iYsXJ6hgEgYPReXfSF92hZHUxT1ERmkxV
   tkeADxl6a/k1QT+2Rcl+z/HCuYjVfv8VxyPh7II6wL2BeZsJ8zueV/QJI
   w==;
X-CSE-ConnectionGUID: AxB0btK/QbaXhRPzZZUzTQ==
X-CSE-MsgGUID: xT/VVPa5QGanLJHFO9JVxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86039939"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86039939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:26:57 -0700
X-CSE-ConnectionGUID: tsI2Z1KxQnWT9RmUCOp0KA==
X-CSE-MsgGUID: F04AREtNTA2z0GTK803eTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="216439404"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:26:54 -0700
Date: Mon, 16 Mar 2026 16:26:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	morris_mao@aspeedtech.com
Subject: Re: [PATCH v2 3/3] iio: adc: aspeed: Reserve battery sensing channel
 for on-demand use
Message-ID: <abgTKzfiDPFQJPVo@ashevche-desk.local>
References: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
 <20260316-adc-v2-3-21475a217b09@aspeedtech.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-adc-v2-3-21475a217b09@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:morris_mao@aspeedtech.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-aspeed@lists.ozlabs.org];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-3693-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 303C929B53D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:00:48AM +0800, Billy Tsai wrote:
> For controllers with battery sensing capability (AST2600/AST2700), the
> last channel uses a different circuit design optimized for battery
> voltage measurement. This channel should not be enabled by default
> along with other channels to avoid potential interference and power
> efficiency issues.
> This ensures optimal power efficiency for normal ADC operations while
> maintaining full functionality when battery sensing is needed.

...

> +			/*
> +			 * After enable a new channel need to wait some time for adc stable

ADC

> +			 * Experiment result is 1ms.
> +			 */
> +			mdelay(1);

Why atomic? If not required, use fsleep(). Otherwise explain.

> +		}

-- 
With Best Regards,
Andy Shevchenko



