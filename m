Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82EFDEBF
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Nov 2019 14:18:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DzSJ0N6wzF5WL
	for <lists+linux-aspeed@lfdr.de>; Sat, 16 Nov 2019 00:18:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DzSB1GQTzF5QV
 for <linux-aspeed@lists.ozlabs.org>; Sat, 16 Nov 2019 00:18:16 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 05:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="203584337"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.197])
 ([10.237.72.197])
 by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2019 05:18:11 -0800
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-aspeed: add inversion signal presence
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
References: <20191114125435.27756-1-i.mikhaylov@yadro.com>
 <20191114125435.27756-3-i.mikhaylov@yadro.com>
 <fcb5f8b5-40b9-6497-b24d-0b73e2525949@intel.com>
 <b443738f5e2a3c7ba96b329a8347374f7f934483.camel@yadro.com>
 <d177ef37-643e-442d-d536-750e0bb5e86d@intel.com>
 <221381ebad0236625775bda5655fcd7c78455e6f.camel@yadro.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <5bd753c3-102b-d78c-c390-4f88ebb0e229@intel.com>
Date: Fri, 15 Nov 2019 15:17:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <221381ebad0236625775bda5655fcd7c78455e6f.camel@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 15/11/19 2:56 PM, Ivan Mikhaylov wrote:
> On Fri, 2019-11-15 at 09:20 +0200, Adrian Hunter wrote:
>> On 14/11/19 7:19 PM, Ivan Mikhaylov wrote:
>>> On Thu, 2019-11-14 at 15:10 +0200, Adrian Hunter wrote:
>>> On 14/11/19 2:54 PM, Ivan Mikhaylov wrote:
>>>>> Change the default .get_cd callback. Add inverted signal card detection
>>>>> check.
>>>>>
>>>>> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
>>>>>
>>>>> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c
>>>>> b/drivers/mmc/host/sdhci-of-
>>>>> aspeed.c
>>>>> index 8962f6664381..186559ee8fcc 100644
>>>>> --- a/drivers/mmc/host/sdhci-of-aspeed.c
>>>>> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
>>>>> @@ -143,6 +143,19 @@ static inline int
>>>>> aspeed_sdhci_calculate_slot(struct
>>>>> aspeed_sdhci *dev,
>>>>>  	return (delta / 0x100) - 1;
>>>>>  }
>>>>>  
>>>>> +static int aspeed_get_cd(struct mmc_host *mmc)
>>>>> +{
>>>>> +	struct sdhci_host *host = mmc_priv(mmc);
>>>>> +
>>>>> +	int present = !!(sdhci_readl(host, SDHCI_PRESENT_STATE)
>>>>> +			 & SDHCI_CARD_PRESENT);
>>>>> +
>>>>> +	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
>>>>> +		present = !present;
>>>>
>>>> Perhaps safer to flip the bit using CONFIG_MMC_SDHCI_IO_ACCESSORS and
>>>> ->readl() callback
>>
>>
>>> Sorry, don't quite understand what you're saying. You want to instantiate
>>> '.read_l' callback instead of '.get_cd' in sdhci_ops and substitute the real
>>> value?
>>>
>>> res = readl(base, reg);
>>> if (reg == SDHCI_PRESENT_STATE)
>>> 	if (mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
>>> 		return !res;
>>
>> Presumably just flip the SDHCI_CARD_PRESENT bit i.e.
>>
>> 		return res ^ SDHCI_CARD_PRESENT;
>>
>>> return res;
>>>
>>> Something like this?
>>
>> Yes
>>
> 
> Don't you think it will bring a little overhead on any sdhci_readl plus

Register accesses are usually slow (~1us) compared with logic.  Of course,
I/O requests are even slower >100ms so it is unlikely that the overhead is
significant.

> sdhci_readl will not get the real value in case of inverted signal which seems
> is not right from communication fairness between hw and sw? I took that approach

One of the purposes of the accessors is to smooth over the difference
between the SDHCI standard and actual hardware.  Given that
SDHCI_PRESENT_STATE is also used in sdhci_set_card_detection() and
sdhci_irq(), it is surprising that changing only ->get_cd() works correctly.

> with .get_cd from variety of drivers in host/mmc but if you think it will be
> better and safer with .read_l - I'll do that way. 
> 
> Sorry for the link in subject, didn't notice that I put it in previous message
> somehow.
> 
> Thanks.
> 
> 

