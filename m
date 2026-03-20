Return-Path: <linux-aspeed+bounces-3730-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HJVMx4ivWmr6wIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3730-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Mar 2026 11:31:58 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B882D8B65
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Mar 2026 11:31:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcf4n5dyzz2yYY;
	Fri, 20 Mar 2026 21:31:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774002713;
	cv=none; b=nsSnR7yzqojkJXXbrg2+o7Ye/sxdp8v0/7LtHMKygzJnBrXIG2XjIDsJX/EvsiD/gd4r9++rnxCmT3sxHCvNEpfn71B8vouNl7zfAdR4skAG08Ceatb6iz6rtmjdgROyYtGwj4NSoP+QGTTPONu0wbCX6ThFYUP/lN6aXhKKxhuxaHg5X2TzenL9uCnyZAdXtioVYSE/S182EXXBhlzc0Dp51N0MZG1ZjjoOQeCr05w7SsuqbdillfvMmSvmsgIwJImaFTL6FFEI51WY332f3blHGBWWIa4Rdr7qUOmkv8ACqM7MM0Mej9ZM8HIRibkS5LeEp6HmUkObqSx6+JXWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774002713; c=relaxed/relaxed;
	bh=+QqAXd2vpQ8qISDA9ynM6KZSRW1nNUGkKU4X69DBcWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTVzvdjJ7MECE/2Jp0lCjeK+Z7+UeWykiouhGvO2fPWRF5vcpYYCXBg4LueoABjfNQZX6HPzXl6o5Kc791Z1LlWQV/2t8o+2MZx+/CxIUvnELHMSKJtS5Ai5ZJpA8y/DpNduyIU/rLZVYtwI4iNCGhAKljKHuOl3WdiyIzrh2TuyJDHZfxa8D3C+jWgpU3Z21OeaCn2LxQtJePC5pvsFMJdj+DZYYQDslXhuCgpQ8i00LphvU7FVjEid1qdyFo46vjWticiMN7GYGOha7mUdbvfOrsyBaGcWRiSLyqgzcdSXbJdNZfZudUvKk5mCj0ZAy6YkZjT0VVS3CNb6M4Rcgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVXztChU; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVXztChU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcf4k6Ngxz2yWK
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Mar 2026 21:31:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774002711; x=1805538711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FuyuF6cs3y/UPu3j5OaECQ1GK3ebCt60+TAC0A5pjBI=;
  b=HVXztChUfY22DxM9zvrdhZ7Af3CiCJJ+X7qXAEsLhrblBsmqrp9CM3tF
   UfVStnuQ0OkUQ4mbfL+TaS8hw3CuG5W/UUR77Ip+EUz8DvY4Cn6Q5i/pE
   7YIKpOipt3ldyj0WRgqoNsZD+BIYKGIbIWOqCOXR5FBgKuPhkIJdyV3QT
   JfcfIAVxO8ZWlHAQyZgKieCGBZRBiToGbP4VLSofdvW/NW0liQmgYuxKh
   yBk77CENjn3OlGuQvOIWKdYZp86mfSBAZ0VkTDhsmKT4pnL5iyg6jSsBd
   JgHV9QgthkZdxyLCC3pWZd3IJahBr87dcbBk7f8a6ujxbajggJzf3LID9
   A==;
X-CSE-ConnectionGUID: JWvhb0DDTLSwAuaGzeDsEg==
X-CSE-MsgGUID: pmtXLZJvSVyHIMbpEd1+aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74266032"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74266032"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:31:47 -0700
X-CSE-ConnectionGUID: cEr5vsElS/SoNYs1tc2rkw==
X-CSE-MsgGUID: mbnQAE46S0y+yWubfuve9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218618516"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:31:43 -0700
Date: Fri, 20 Mar 2026 12:31:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	morris_mao@aspeedtech.com
Subject: Re: [PATCH v3 3/4] iio: adc: aspeed: Replace mdelay() with fsleep()
 for ADC stabilization delay
Message-ID: <ab0iDUp6t2LuGlAA@ashevche-desk.local>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
 <20260320-adc-v3-3-bc0eac04ef7c@aspeedtech.com>
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
In-Reply-To: <20260320-adc-v3-3-bc0eac04ef7c@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:morris_mao@aspeedtech.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-aspeed@lists.ozlabs.org];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-3730-lists,linux-aspeed=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 66B882D8B65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 01:46:37PM +0800, Billy Tsai wrote:
> The ADC stabilization delays in compensation mode and battery sensing
> mode do not require atomic context. Using mdelay() here results in
> unnecessary busy waiting.
> 
> Replace mdelay(1) with fsleep(1000) to allow the scheduler to run other
> tasks while waiting for the ADC to stabilize.
> 
> Also fix a minor typo in the comment ("adc" -> "ADC").

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I haven't suggested the idea, I only suggested to use fsleep() for the purpose.

-- 
With Best Regards,
Andy Shevchenko



