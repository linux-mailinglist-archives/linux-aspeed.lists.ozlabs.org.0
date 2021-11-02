Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF1344345D
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 18:11:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkGdg6L81z2yKN
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 04:11:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkGdZ25GVz2xF4
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 04:11:12 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="254932223"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="254932223"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:38:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="583667612"
Received: from nlibermx-mobl.amr.corp.intel.com (HELO [10.209.55.177])
 ([10.209.55.177])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:38:25 -0700
Message-ID: <3ad1f139-1951-b99e-3df0-4a34a2044809@linux.intel.com>
Date: Tue, 2 Nov 2021 09:38:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next 0/4] Add LCLK control into Aspeed LPC sub drivers
Content-Language: en-US
To: minyard@acm.org, Joel Stanley <joel@jms.id.au>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <CACPK8XfBi+jY5ftLqsEVXHe01SQBNpTSwo+WtXN3=YUQnXACtw@mail.gmail.com>
 <20211102122241.GK4667@minyard.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20211102122241.GK4667@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Zev Weiss <zev@bewilderbeest.net>, Rob Herring <robh+dt@kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Cedric Le Goater <clg@kaod.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/2/2021 5:22 AM, Corey Minyard wrote:
> On Mon, Nov 01, 2021 at 11:36:38PM +0000, Joel Stanley wrote:
>> On Mon, 1 Nov 2021 at 23:18, <jae.hyun.yoo@intel.com> wrote:
>>>
>>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>
>>> Hello all,
>>>
>>> This series is for appliying below fix to all Aspped LPC sub drivers.
>>> https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/
>>>
>>> An LPC sub driver can be enabled without using the lpc-ctrl driver or it
>>> can be registered ahead of lpc-ctrl depends on each system configuration and
>>> this difference introduces that LPC can be enabled without heart beating of
>>> LCLK so it causes improper handling on host interrupts when the host sends
>>> interrupts in that time frame. Then kernel eventually forcibly disables the
>>> interrupt with dumping stack and printing a 'nobody cared this irq' message
>>> out.
>>>
>>> To prevent this issue, all LPC sub drivers should enable LCLK individually
>>> so this patch adds clock control logic into the remaining Aspeed LPC sub
>>> drivers.
>>
>> Thanks for sending this out!
>>
>> This will resolve a few of the issues we have in the issue tracker:
>>
>> https://github.com/openbmc/linux/issues/210
>> https://github.com/openbmc/linux/issues/130
>>
>> The patches look good to me. I think you've just missed Corey's PR for
>> v5.16, but I will stick them in the openbmc tree once they've had a
>> review.
> 
> We can still get them in to 5.16 if it's important for that; this is a
> bug fix, after all, and it's early.  I just need to know the urgency.
> 
> Get the Reviewed-by's in and add the bindings and I can get it into the
> next tree for a bit, then I can submit.  We may be in rc1 by then, but
> that's ok.

Thanks Corey! I'll submit v2 soon.

Jae

> 
> -corey
> 
>>
>> Cheers,
>>
>> Joel
>>
>>>
>>> Please review this series.
>>>
>>> Thanks,
>>> Jae
>>>
>>> Jae Hyun Yoo (4):
>>>    ARM: dts: aspeed: add LCLK setting into LPC IBT node
>>>    ipmi: bt: add clock control logic
>>>    ARM: dts: aspeed: add LCLK setting into LPC KCS nodes
>>>    ipmi: kcs_bmc_aspeed: add clock control logic
>>>
>>>   arch/arm/boot/dts/aspeed-g4.dtsi   |  1 +
>>>   arch/arm/boot/dts/aspeed-g5.dtsi   |  5 +++++
>>>   arch/arm/boot/dts/aspeed-g6.dtsi   |  5 +++++
>>>   drivers/char/ipmi/bt-bmc.c         | 24 ++++++++++++++++++++++-
>>>   drivers/char/ipmi/kcs_bmc_aspeed.c | 31 ++++++++++++++++++++++++++----
>>>   5 files changed, 61 insertions(+), 5 deletions(-)
>>>
>>> --
>>> 2.25.1
>>>
