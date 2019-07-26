Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB079FAF
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 05:58:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yN8N6HfdzDqFt
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 13:58:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wFnT6nBtzDqQr
 for <linux-aspeed@lists.ozlabs.org>; Sat, 27 Jul 2019 03:04:57 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 10:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="172279192"
Received: from haiyuewa-mobl.ccr.corp.intel.com (HELO [10.255.31.18])
 ([10.255.31.18])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2019 10:04:51 -0700
Subject: Re: [RFC PATCH 14/17] ipmi: kcs: Finish configuring ASPEED KCS device
 before enable
To: Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
References: <20190726053959.2003-1-andrew@aj.id.au>
 <20190726053959.2003-15-andrew@aj.id.au>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <29a2d999-23bd-8e95-a1b8-f00e25a11df5@linux.intel.com>
Date: Sat, 27 Jul 2019 01:04:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726053959.2003-15-andrew@aj.id.au>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Jul 2019 13:58:37 +1000
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
 Arnd Bergmann <arnd@arndb.de>, Corey Minyard <minyard@acm.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

ÔÚ 2019-07-26 13:39, Andrew Jeffery Ð´µÀ:
> The currently interrupts are configured after the channel was enabled.
>
> Cc: Haiyue Wang<haiyue.wang@linux.intel.com>
> Cc: Corey Minyard<minyard@acm.org>
> Cc: Arnd Bergmann<arnd@arndb.de>
> Cc: Greg Kroah-Hartman<gregkh@linuxfoundation.org>
> Cc:openipmi-developer@lists.sourceforge.net
> Signed-off-by: Andrew Jeffery<andrew@aj.id.au>
> ---
>   drivers/char/ipmi/kcs_bmc_aspeed.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 3c955946e647..e3dd09022589 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -268,13 +268,14 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>   	kcs_bmc->io_inputb = aspeed_kcs_inb;
>   	kcs_bmc->io_outputb = aspeed_kcs_outb;
>   
> +	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
> +	if (rc)
> +		return rc;
> +
>   	dev_set_drvdata(dev, kcs_bmc);


Thanks for catching this, for not miss the data.

