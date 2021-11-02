Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92CF442EE7
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 14:12:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk9LC5nCKz2yJF
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 00:12:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4201 seconds by postgrey-1.36 at boromir;
 Wed, 03 Nov 2021 00:12:29 AEDT
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk9L52MFNz2xtc
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Nov 2021 00:12:27 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.72])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5D66321070;
 Tue,  2 Nov 2021 09:35:49 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 2 Nov
 2021 10:35:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004e727d65d-8397-4210-84a7-829b0dd3b7f5,
 5C292F81AE153BA05FA9CE80812C04756C1C1785) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <194999c0-e9b3-1b0d-3739-faa2b7f72391@kaod.org>
Date: Tue, 2 Nov 2021 10:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH -next 2/4] ipmi: bt: add clock control logic
Content-Language: en-US
To: <jae.hyun.yoo@intel.com>, Rob Herring <robh+dt@kernel.org>, Corey Minyard
 <minyard@acm.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Haiyue Wang <haiyue.wang@linux.intel.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-3-jae.hyun.yoo@intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211101233751.49222-3-jae.hyun.yoo@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b52a7976-2078-43c7-9601-4622d6a06c64
X-Ovh-Tracer-Id: 465278140314979317
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehhedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnihhpmhhiqdguvghvvghlohhpvghrsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvght
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
Cc: devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/2/21 00:37, jae.hyun.yoo@intel.com wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> If LPC BT driver is registered ahead of lpc-ctrl module, LPC BT
> hardware block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupts in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
> 
> To prevent this issue, all LPC sub drivers should enable LCLK
> individually so this patch adds clock control logic into the LPC
> BT driver.
> 
> Fixes: 54f9c4d0778b ("ipmi: add an Aspeed BT IPMI BMC driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

LGTM,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   drivers/char/ipmi/bt-bmc.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 7450904e330a..a20f92cc7b18 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/atomic.h>
>   #include <linux/bt-bmc.h>
> +#include <linux/clk.h>
>   #include <linux/errno.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> @@ -62,6 +63,7 @@ struct bt_bmc {
>   	wait_queue_head_t	queue;
>   	struct timer_list	poll_timer;
>   	struct mutex		mutex;
> +	struct clk		*clk;
>   };
>   
>   static atomic_t open_count = ATOMIC_INIT(0);
> @@ -423,6 +425,19 @@ static int bt_bmc_probe(struct platform_device *pdev)
>   	if (IS_ERR(bt_bmc->base))
>   		return PTR_ERR(bt_bmc->base);
>   
> +	bt_bmc->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(bt_bmc->clk)) {
> +		rc = PTR_ERR(bt_bmc->clk);
> +		if (rc != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get clock\n");
> +		return rc;
> +	}
> +	rc = clk_prepare_enable(bt_bmc->clk);
> +	if (rc) {
> +		dev_err(dev, "Unable to enable clock\n");
> +		return rc;
> +	}
> +
>   	mutex_init(&bt_bmc->mutex);
>   	init_waitqueue_head(&bt_bmc->queue);
>   
> @@ -433,7 +448,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
>   	rc = misc_register(&bt_bmc->miscdev);
>   	if (rc) {
>   		dev_err(dev, "Unable to register misc device\n");
> -		return rc;
> +		goto err;
>   	}
>   
>   	bt_bmc_config_irq(bt_bmc, pdev);
> @@ -457,6 +472,11 @@ static int bt_bmc_probe(struct platform_device *pdev)
>   	clr_b_busy(bt_bmc);
>   
>   	return 0;
> +
> +err:
> +	clk_disable_unprepare(bt_bmc->clk);
> +
> +	return rc;
>   }
>   
>   static int bt_bmc_remove(struct platform_device *pdev)
> @@ -466,6 +486,8 @@ static int bt_bmc_remove(struct platform_device *pdev)
>   	misc_deregister(&bt_bmc->miscdev);
>   	if (bt_bmc->irq < 0)
>   		del_timer_sync(&bt_bmc->poll_timer);
> +	clk_disable_unprepare(bt_bmc->clk);
> +
>   	return 0;
>   }
>   
> 

