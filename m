Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1D8444D19
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 02:48:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl64L4Mm3z2y7J
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 12:48:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MCLLMK1e;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=MCLLMK1e; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl64B6Rghz2xX1
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 12:48:41 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-240-219.tukw.qwest.net
 [97.113.240.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E1862373;
 Wed,  3 Nov 2021 18:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1635990517;
 bh=CkPGfIGdJl1Sm1jvL44ZO2+ID8zt4FiR+y+7s0H1yZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCLLMK1eNlLmUSFwuTCCKFYiMHqzqedGFHRwcU30yLMztv6y1e9AWemNn9ScMfmE0
 sMthE9AG3P7UW56IMhJPKMA2NpK6lPUQ78JvvrkDJJcI/6jZ6RDHTx15oQa78oVxTI
 VEzslz/RHf9aBc2RJ4oF7DDhvhy0bYOjGu1JkUGU=
Date: Wed, 3 Nov 2021 18:48:32 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH -next 0/4] Add LCLK control into Aspeed LPC sub drivers
Message-ID: <YYM78OxYMYwiFzWD@hatter.bewilderbeest.net>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <CACPK8XfBi+jY5ftLqsEVXHe01SQBNpTSwo+WtXN3=YUQnXACtw@mail.gmail.com>
 <YYHSHoELvKRI4Zh1@hatter.bewilderbeest.net>
 <d2a18e3b-cb02-37b5-cad8-45c3e8ff3bb4@linux.intel.com>
 <YYHYMKDD7hz15ceR@hatter.bewilderbeest.net>
 <63678f47-8b4a-1385-a755-bc7c2316ca0d@linux.intel.com>
 <YYHhMGm4C0srTW1x@hatter.bewilderbeest.net>
 <768252cc-2466-3b4b-9087-549b83e00a81@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <768252cc-2466-3b4b-9087-549b83e00a81@linux.intel.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Nov 03, 2021 at 08:56:10AM PDT, Jae Hyun Yoo wrote:
>
>Hi Zev,
>
>Not sure but looks like one of LPC functions is enabled while kernel
>booting. 
>

Looks like that was exactly the clue I needed -- obvious in retrospect, 
but I realize now that I'm only seeing this happen when I bypass the 
normal shutdown sequence via 'reboot -f'; with a plain 'reboot' I don't 
hit any problems.  Can you reproduce it that way?


Zev

