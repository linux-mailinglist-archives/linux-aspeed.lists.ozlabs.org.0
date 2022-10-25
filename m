Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A313560C23F
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 05:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxHWC39Gcz3bjl
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 14:29:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=hWOiabhv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=hWOiabhv;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxHV91fBkz3br4
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 14:29:05 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1D3D614F;
	Mon, 24 Oct 2022 20:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1666668536;
	bh=Izj+g4YVRt+Rr4znHin5k2OzyE0uc6hgbjf/NdXpoDY=;
	h=Date:From:To:Cc:Subject:From;
	b=hWOiabhvoEbQ3wgWxVqKVfxdt0ZU3UVA/L7CabCzAEFv97WiWwp30Ebp9z3lyIJtw
	 /Ra7mAHRiD09+rtusXft5QlG6zxfFELwsNb4wLacdlVin8qJfupIZXZRtQ852dpS7/
	 8ElwLFgafTaw3abP0nRm7uVNaU0OgLLR5x9obsT0=
Date: Mon, 24 Oct 2022 20:28:54 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Subject: Log spam from aspeed-video driver
Message-ID: <Y1dX9r9ybGjBrW0k@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi all,

Since the recent update of the OpenBMC kernel to 6.0, I've been seeing a 
lot of new log noise from aspeed-video driver when the host is powered 
off after having been on:

     [  335.526279] aspeed-video 1e700000.video: Timed out; first mode detect
     [  335.544172] aspeed-video 1e700000.video: No signal; don't start frame
     [  337.165555] aspeed-video 1e700000.video: Timed out; first mode detect
     [  337.186214] aspeed-video 1e700000.video: No signal; don't start frame
     [  338.815501] aspeed-video 1e700000.video: Timed out; first mode detect
     [  338.834008] aspeed-video 1e700000.video: No signal; don't start frame

It just emits that pair of messages continuously, about every 1.6 
seconds.

Looking through the commit history of the driver, it looks like that 
stems from commit a3de90afe392 ("media: aspeed: use 
v4l2_info/v4l2_warn/v4l2_dbg for log"), which converted a bunch of print 
calls from dev_dbg() to various v4l2_*() calls.  Reverting to the old 
5.15 kernel (which didn't include that change), I found by enabling the 
dev_dbg() prints via sysfs (and cranking up the console loglevel) that 
the conditions triggering those messages have been happening all along, 
I just hadn't been seeing them because the debug prints were disabled by 
default.

I should note that aside from the dmesg spam I don't see any functional 
problems with the driver; obmc-ikvm works as expected.

Was switching those dev_dbg() calls to v4l2_warn() instead of v4l2_dbg() 
intentional?  Does this indicate some latent bug that should be fixed, 
or should they just be converted to v4l2_dbg()?


Thanks,
Zev

