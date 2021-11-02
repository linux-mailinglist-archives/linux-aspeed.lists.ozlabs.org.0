Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE6443358
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 17:42:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkG0w2XQqz2yJF
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 03:42:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkG0r0Hwtz2xBY
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 03:42:51 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294768227"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="294768227"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:35:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="583666391"
Received: from nlibermx-mobl.amr.corp.intel.com (HELO [10.209.55.177])
 ([10.209.55.177])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:35:32 -0700
Message-ID: <edaeb540-aa31-d143-4320-cb2a73f0070f@linux.intel.com>
Date: Tue, 2 Nov 2021 09:35:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next 4/4] ipmi: kcs_bmc_aspeed: add clock control logic
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, ChiaWei Wang <chiawei_wang@aspeedtech.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-5-jae.hyun.yoo@intel.com>
 <HK0PR06MB3779F8E273396ED805EE5D81918B9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8XesLdb+Cbi3ZYrOahRHbXQi3L=cQXax=RV2=PrjiPQBew@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <CACPK8XesLdb+Cbi3ZYrOahRHbXQi3L=cQXax=RV2=PrjiPQBew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 "jae.hyun.yoo@intel.com" <jae.hyun.yoo@intel.com>,
 Cedric Le Goater <clg@kaod.org>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/1/2021 8:28 PM, Joel Stanley wrote:
> On Tue, 2 Nov 2021 at 03:16, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>>
>> Hi Jae,
>>
>>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On
>>>
>>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>
>>> If LPC KCS driver is registered ahead of lpc-ctrl module, LPC KCS block will be
>>> enabled without heart beating of LCLK until lpc-ctrl enables the LCLK. This
>>> issue causes improper handling on host interrupts when the host sends
>>> interrupts in that time frame.
>>> Then kernel eventually forcibly disables the interrupt with dumping stack and
>>> printing a 'nobody cared this irq' message out.
>>>
>>> To prevent this issue, all LPC sub drivers should enable LCLK individually so this
>>> patch adds clock control logic into the LPC KCS driver.
>>
>> Have all LPC sub drivers could result in entire LPC block down if any of them disables the clock (e.g. driver unload).
>> The LPC devices such as SIO can be used before kernel booting, even without any BMC firmware.
>> Thereby, we recommend to make LCLK critical or guarded by protected clock instead of having all LPC sub drivers hold the LCLK control.
>>
>> The previous discussion for your reference:
>> https://lkml.org/lkml/2020/9/28/153
> 
> Please read the entire thread. The conclusion:
> 
> https://lore.kernel.org/all/CACPK8XdBmkhZ8mcSFmDAFV8k7Qj7ajBL8TVKfK8c+5aneUMHZw@mail.gmail.com/
> 
> That is, for the devices that have a driver loaded can enable the
> clock. When they are unloaded, they will reduce the reference count
> until the last driver is unloaded. eg:
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L945
> 
> There was another fork to the thread, where we suggested that a
> protected clocks binding could be added:
> 
> https://lore.kernel.org/all/160269577311.884498.8429245140509326318@swboyd.mtv.corp.google.com/
> 
> If you wish to use this mechanism for eg. SIO clocks, then I encourage
> Aspeed to submit a patch to do that.

We are revisiting the aged discussion. Thanks for bringing it back.

I agree with Joel that a clock should be enabled only on systems that
need the clock actually so it should be configurable by a device driver
or through device tree setting, not by the static setting in
clk-ast2600.c code. So that's the reason why I stopped upstreaming below
change for making BCLK as a critical clock.

https://www.spinics.net/lists/linux-clk/msg44836.html

Instead, I submitted these two changes to make it configurable through
device tree setting.

https://lists.ozlabs.org/pipermail/linux-aspeed/2020-January/003394.html
https://lists.ozlabs.org/pipermail/linux-aspeed/2020-January/003339.html

But these were not accepted too.

And recently, Samuel introduced a better and more generic way.

https://lore.kernel.org/all/20200903040015.5627-2-samuel@sholland.org/

But it's not accepted yet either.


Chiawei,

Please refine the mechanism and submit a change to make SIO clocks
configurable through device tree setting. I believe that we can keep
this patch series even with the change, or it can be modified and
adjusted if needed after the SIO clocks fix is accepted.

Thanks,
Jae
