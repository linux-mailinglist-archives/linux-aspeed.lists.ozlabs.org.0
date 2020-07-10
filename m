Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F66F21AFA0
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 08:42:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B33Pt5yJRzDrMl
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 16:42:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B33Pl4XJGzDrHq
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 16:42:24 +1000 (AEST)
IronPort-SDR: 8jRbj8eQMUXzgVyiXnxE/2oNx7Jb7amugTvi7GfirBS/e6WIDNPq3F/3JUS6ozDiOfbgvTy4UG
 zUSAxzLeAXBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149628800"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; d="scan'208";a="149628800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 23:42:20 -0700
IronPort-SDR: OdJt/DPOJXTDMtl6BzBoR7MaAS7AcbsrG9FJ0PXw5fygo6H4LpeFs/7DaaQQ4xt/62Ii+Vx3wz
 VKyUNZcouXUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; d="scan'208";a="389396441"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73])
 ([10.237.72.73])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2020 23:42:13 -0700
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Fix clock divider calculation
To: Eddie James <eajames@linux.ibm.com>, linux-clk@vger.kernel.org
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-3-eajames@linux.ibm.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <fe0c6b0f-0fa1-a4e4-1f60-5258b30c14f9@intel.com>
Date: Fri, 10 Jul 2020 09:41:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200709195706.12741-3-eajames@linux.ibm.com>
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 mturquette@baylibre.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, sboyd@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 9/07/20 10:57 pm, Eddie James wrote:
> When calculating the clock divider, start dividing at 2 instead of 1.
> The divider is divided by two at the end of the calculation, so starting
> at 1 may result in a divider of 0, which shouldn't happen.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 56912e30c47e..a1bcc0f4ba9e 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -68,7 +68,7 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>  	if (WARN_ON(clock > host->max_clk))
>  		clock = host->max_clk;
>  
> -	for (div = 1; div < 256; div *= 2) {
> +	for (div = 2; div < 256; div *= 2) {
>  		if ((parent / div) <= clock)
>  			break;
>  	}
> 

