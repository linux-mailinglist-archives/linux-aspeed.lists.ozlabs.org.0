Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2A75EB2
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 08:02:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vz4b0Q9DzDqP1
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 16:02:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vyzT1t4yzDqDJ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:57:35 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 22:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="254223291"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.122])
 ([10.237.72.122])
 by orsmga001.jf.intel.com with ESMTP; 25 Jul 2019 22:57:26 -0700
Subject: Re: [PATCH v2 2/2] mmc: Add support for the ASPEED SD controller
To: Andrew Jeffery <andrew@aj.id.au>, linux-mmc <linux-mmc@vger.kernel.org>
References: <20190712033214.24713-1-andrew@aj.id.au>
 <20190712033214.24713-3-andrew@aj.id.au>
 <d6f7fdf2-07ed-354a-ca29-f3175623679c@intel.com>
 <7cd30f3d-43fd-42da-9301-091eb2625c65@www.fastmail.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <8a7bfe52-83ca-7601-7d75-e5615da7b5de@intel.com>
Date: Fri, 26 Jul 2019 08:56:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7cd30f3d-43fd-42da-9301-091eb2625c65@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 26 Jul 2019 16:01:58 +1000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 26/07/19 3:52 AM, Andrew Jeffery wrote:
> On Thu, 25 Jul 2019, at 22:49, Adrian Hunter wrote:
>> On 12/07/19 6:32 AM, Andrew Jeffery wrote:
>>> +static int aspeed_sdhci_probe(struct platform_device *pdev)
>>> +{
>>> +	struct sdhci_pltfm_host *pltfm_host;
>>> +	struct aspeed_sdhci *dev;
>>> +	struct sdhci_host *host;
>>> +	struct resource *res;
>>> +	int slot;
>>> +	int ret;
>>> +
>>> +	host = sdhci_pltfm_init(pdev, &aspeed_sdc_pdata, sizeof(*dev));
>>> +	if (IS_ERR(host))
>>> +		return PTR_ERR(host);
>>> +
>>> +	pltfm_host = sdhci_priv(host);
>>> +	dev = sdhci_pltfm_priv(pltfm_host);
>>> +	dev->parent = dev_get_drvdata(pdev->dev.parent);
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	slot = aspeed_sdhci_calculate_slot(dev, res);
>>> +	if (slot < 0)
>>> +		return slot;
>>> +	dev_info(&pdev->dev, "Configuring for slot %d\n", slot);
>>> +	dev->width_mask = !slot ? ASPEED_SDC_S0MMC8 : ASPEED_SDC_S1MMC8;
>>
>> That implies that you only support 2 slots which begs the question why
>> you don't validate slot.
> 
> I'm not sure what you mean here, but I'll dig into it.

I just meant, if you only support 2 slots:

	if (slot > 1)
		return -EINVAL;
