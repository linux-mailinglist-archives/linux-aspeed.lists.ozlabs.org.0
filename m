Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C0A443A67
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 01:30:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkSNn0JdYz2y7J
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 11:30:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Zkhlc/Fa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Zkhlc/Fa; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkSNh1NVLz2xKJ
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 11:30:44 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-240-219.tukw.qwest.net
 [97.113.240.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 20532285;
 Tue,  2 Nov 2021 17:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1635899442;
 bh=kutB5SU1qk86Qex7r3FP2m75aK+dhC3RMcn7DHixw+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zkhlc/FaWAkQyLIJg853zWURFEacyHX+bXvwg92ZOMofVt1ZhJv14RF/o90RnUUxz
 C4nbnmGxNItoxDCuGl+3bLA7t2YokPFsFLmt32eLpsC5sntJcwkw3qZKPE6LPNp7vV
 ekW2ZPuXG2iPXYd4cMNY4//hAiaxo8S1HXI8fXcE=
Date: Tue, 2 Nov 2021 17:30:40 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH -next 0/4] Add LCLK control into Aspeed LPC sub drivers
Message-ID: <YYHYMKDD7hz15ceR@hatter.bewilderbeest.net>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <CACPK8XfBi+jY5ftLqsEVXHe01SQBNpTSwo+WtXN3=YUQnXACtw@mail.gmail.com>
 <YYHSHoELvKRI4Zh1@hatter.bewilderbeest.net>
 <d2a18e3b-cb02-37b5-cad8-45c3e8ff3bb4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d2a18e3b-cb02-37b5-cad8-45c3e8ff3bb4@linux.intel.com>
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

On Tue, Nov 02, 2021 at 05:17:30PM PDT, Jae Hyun Yoo wrote:
>Hi Zev,
>
>On 11/2/2021 5:04 PM, Zev Weiss wrote:
>>On Mon, Nov 01, 2021 at 04:36:38PM PDT, Joel Stanley wrote:
>>>On Mon, 1 Nov 2021 at 23:18, <jae.hyun.yoo@intel.com> wrote:
>>>>
>>>>From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>>
>>>>Hello all,
>>>>
>>>>This series is for appliying below fix to all Aspped LPC sub drivers.
>>>>https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/
>>>>
>>>>
>>>>An LPC sub driver can be enabled without using the lpc-ctrl driver or it
>>>>can be registered ahead of lpc-ctrl depends on each system 
>>>>configuration and
>>>>this difference introduces that LPC can be enabled without heart 
>>>>beating of
>>>>LCLK so it causes improper handling on host interrupts when the 
>>>>host sends
>>>>interrupts in that time frame. Then kernel eventually forcibly 
>>>>disables the
>>>>interrupt with dumping stack and printing a 'nobody cared this 
>>>>irq' message
>>>>out.
>>>>
>>>>To prevent this issue, all LPC sub drivers should enable LCLK 
>>>>individually
>>>>so this patch adds clock control logic into the remaining Aspeed LPC sub
>>>>drivers.
>>>
>>>Thanks for sending this out!
>>>
>>>This will resolve a few of the issues we have in the issue tracker:
>>>
>>>https://github.com/openbmc/linux/issues/210
>>>https://github.com/openbmc/linux/issues/130
>>>
>>>The patches look good to me. I think you've just missed Corey's PR for
>>>v5.16, but I will stick them in the openbmc tree once they've had a
>>>review.
>>>
>>
>>Hi Jae,
>>
>>I tried this series out on the same in-progress OpenBMC port from 
>>issue number 210 linked above and am still seeing problems (dmesg 
>>pasted below).
>>
>>I cherry-picked commit f9241fe8b9652 ("ARM: dts: aspeed: Add uart 
>>routing to device tree") from linux-next to allow the first patch to 
>>apply cleanly; is there anything else I might be missing that'd be 
>>needed to test the series properly?
>
>Looks like below dmesg shows an error from 'aspeed_lpc_snoop_probe'
>which this series doesn't touch. Do you have below fix in your code
>tree?
>
>https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/
>
>Thanks,
>Jae
>

Yes, I've got that patch (commit 3f94cf1558), and the accompanying dts 
update to add the clocks property to the lpc-snoop device (commit 
d050d049f8).

However, while there is an aspeed_lpc_snoop_probe() backtrace there, 
note that there's *also* one from aspeed_kcs_probe() further on 
(starting at timestamp 3.263306).


Zev

