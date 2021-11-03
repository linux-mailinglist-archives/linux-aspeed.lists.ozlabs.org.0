Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECD444759
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 18:38:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkvBf4wlrz2yHT
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 04:38:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkvBW6V7lz2xth
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 04:38:25 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211606481"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="211606481"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 10:27:03 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="501179871"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.171.79])
 ([10.212.171.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 10:27:02 -0700
Message-ID: <796e0c02-5bca-e8a9-a17f-898aafec237f@linux.intel.com>
Date: Wed, 3 Nov 2021 10:26:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add
 'clocks' as a required property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
 <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
 <8db279c9-4c76-91a5-3617-a17effb2d103@linux.intel.com>
 <CAL_Jsq+SwCqFycKz4+agRsB3qr4Rbfra55Q6tNbMH2bNtoX+hA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <CAL_Jsq+SwCqFycKz4+agRsB3qr4Rbfra55Q6tNbMH2bNtoX+hA@mail.gmail.com>
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, jae.hyun.yoo@intel.com,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/3/2021 9:29 AM, Rob Herring wrote:
> On Wed, Nov 3, 2021 at 11:08 AM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Rob,
>>
>> On 11/2/2021 6:20 PM, Rob Herring wrote:
>>> On Tue, 02 Nov 2021 13:37:16 -0700, jae.hyun.yoo@intel.com wrote:
>>>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>>
>>>> Add 'clocks' as a required property.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> ---
>>>> v1 -> v2:
>>>> Changes sinve v1:
>>>>    - Added 'clocks' property into kcs-bmc bindings using
>>>>      'aspeed,ast2400-kcs-bmc.yaml' because it's not merged into
>>>>      'aspeed-lpc.yaml' yet. The bindings merging could be done using a
>>>>      separate patch later.
>>>>
>>>>    .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml   | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>
>>> Running 'make dtbs_check' with the schema in this patch gives the
>>> following warnings. Consider if they are expected or the schema is
>>> incorrect. These may not be new warnings.
>>>
>>> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
>>> This will change in the future.
>>>
>>> Full log is available here: https://patchwork.ozlabs.org/patch/1549943
>>>
>>>
>>> kcs@114: 'clocks' is a required property
>>>        arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
>>>
>>> kcs@24: 'clocks' is a required property
>>>        arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>>>
>>> kcs@28: 'clocks' is a required property
>>>        arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
>>>
>>> kcs@2c: 'clocks' is a required property
>>>        arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
>>>        arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
>>>
>>
>> #4/6 in this patch adds 'clocks' into aspeed-g5.dtsi and aspeed-g6.dtsi
>> as a default property and all above dts files include the dtsi file so
>> these warning shouldn't be seen. Is it a result after applying all
>> changes in this series or just after cherry picking #5/6 patch only?
> 
> Only patch 5 is applied.
> 
>> I tested 'dtbs_check' before submitting this series I tested it again
>> and got the same good result like below.
>>
>> Aren't the above warnings false positive? Or did I miss something?
> 
> What you missed is this is an ABI. You cannot make something required
> that was not required before. If the driver follows the schema and
> makes 'clocks' required, then old DTBs with a new kernel will break.

Okay. I got it clearly and understand that it could introduce a problem
in that case. Thanks for your clarification.

> It's possible that 'clocks' was always required or that it never
> worked without clocks, then this change is okay. Looking at this
> patch, I have no way to know that. The commit message has to explain
> that. A commit message needs to answer WHY are you making the change.
> You don't really need WHAT the change is as anyone can read the diff.

Then what would be better? Would it be good enough if I add more detail
commit message including a note that dtb recompiling is required? Or,
should I change this series to treat the 'clocks' as an optional
property? Can you please share your thought?

Thanks,
Jae

> Rob
> 
