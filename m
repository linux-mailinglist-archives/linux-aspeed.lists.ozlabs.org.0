Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4C44460A
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 17:37:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hksqm6DtGz2yHL
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 03:37:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hksqh5wv1z2xBF
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 03:37:04 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="255166567"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="255166567"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 09:13:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="450120304"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.171.79])
 ([10.212.171.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 09:13:14 -0700
Message-ID: <e5646939-79ed-a588-da22-4ec45213e49a@linux.intel.com>
Date: Wed, 3 Nov 2021 09:13:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add
 'clocks' as a required property
Content-Language: en-US
To: minyard@acm.org, Rob Herring <robh@kernel.org>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
 <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
 <20211103015227.GO4667@minyard.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20211103015227.GO4667@minyard.net>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 jae.hyun.yoo@intel.com, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/2/2021 6:52 PM, Corey Minyard wrote:
> On Tue, Nov 02, 2021 at 08:20:37PM -0500, Rob Herring wrote:
>> On Tue, 02 Nov 2021 13:37:16 -0700, jae.hyun.yoo@intel.com wrote:
>>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>
>>> Add 'clocks' as a required property.
>>>
>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>> ---
>>> v1 -> v2:
>>> Changes sinve v1:
>>>   - Added 'clocks' property into kcs-bmc bindings using
>>>     'aspeed,ast2400-kcs-bmc.yaml' because it's not merged into
>>>     'aspeed-lpc.yaml' yet. The bindings merging could be done using a
>>>     separate patch later.
>>>
>>>   .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml   | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>
>> Running 'make dtbs_check' with the schema in this patch gives the
>> following warnings. Consider if they are expected or the schema is
>> incorrect. These may not be new warnings.
>>
>> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
>> This will change in the future.
>>
>> Full log is available here: https://patchwork.ozlabs.org/patch/1549943
>>
> 
>  From the code, I think this change will break all these platforms, as
> the initialization of kcs will fail without the clock property.  I'm
> going to pull this out until it gets sorted out.
> 
> Also, could you rebase on the latest kernel when submitting next time?
> There was a minor thing I had to fix up.
> 
> -corey

Hi Corey,

I believe that this series will not break these platforms if this series
applied correctly but I agree with that we don't need to rush this.

I'll submit v3 after rebasing it on the latest master when all queued
changes in '-next' are merged. It would be also good for reducing
confusions if any.

Thanks,
Jae

>>
>> kcs@114: 'clocks' is a required property
>> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
>>
>> kcs@24: 'clocks' is a required property
>> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>>
>> kcs@28: 'clocks' is a required property
>> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
>>
>> kcs@2c: 'clocks' is a required property
>> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
>> 	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
>>
