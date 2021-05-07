Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBAA376003
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 May 2021 08:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc0Hz56Vzz2yY6
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 May 2021 16:03:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc0Hv5VxGz2yWQ;
 Fri,  7 May 2021 16:03:38 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1475oj5n034484;
 Fri, 7 May 2021 13:50:45 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May
 2021 14:02:35 +0800
Date: Fri, 7 May 2021 14:02:29 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 5/5] mmc: sdhci-of-aspeed: Assert/Deassert reset
 signal before probing eMMC
Message-ID: <20210507060228.GC23749@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-6-steven_lee@aspeedtech.com>
 <20210506102458.GA20777@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210506102458.GA20777@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1475oj5n034484
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
Cc: "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>, "open
 list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian
 Hunter <adrian.hunter@intel.com>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "Hongweiz@ami.com" <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The 05/06/2021 18:24, Philipp Zabel wrote:
> Hi Steven,
> 
> On Thu, May 06, 2021 at 06:03:12PM +0800, Steven Lee wrote:
> > For cleaning up the AST2600 eMMC controller, the reset signal should be
> > asserted and deasserted before it is probed.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  drivers/mmc/host/sdhci-of-aspeed.c | 49 ++++++++++++++++++++++++------
> >  1 file changed, 40 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> > index 4979f98ffb52..8ef06f32abff 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> [...]
> > @@ -533,11 +545,22 @@ static struct platform_driver aspeed_sdhci_driver = {
> >  	.remove		= aspeed_sdhci_remove,
> >  };
> >  
> > +static const struct of_device_id aspeed_sdc_of_match[] = {
> > +	{ .compatible = "aspeed,ast2400-sd-controller", },
> > +	{ .compatible = "aspeed,ast2500-sd-controller", },
> > +	{ .compatible = "aspeed,ast2600-sd-controller", .data = &ast2600_sdc_info},
> > +	{ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, aspeed_sdc_of_match);
> > +
> >  static int aspeed_sdc_probe(struct platform_device *pdev)
> >  
> >  {
> >  	struct device_node *parent, *child;
> >  	struct aspeed_sdc *sdc;
> > +	const struct of_device_id *match = NULL;
> > +	const struct aspeed_sdc_info *info = NULL;
> 
> There is no need to initialize these variables to NULL, see below:
> 

Will modify it.

> >  	int ret;
> >  
> >  	sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
> > @@ -546,6 +569,23 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
> >  
> >  	spin_lock_init(&sdc->lock);
> >  
> > +	match = of_match_device(aspeed_sdc_of_match, &pdev->dev);
> 
> match is set unconditionally before it is used,
> 
> > +	if (!match)
> > +		return -ENODEV;
> > +
> > +	if (match->data)
> > +		info = match->data;
> 
> and info could be set unconditionally as well:
> 
> 	info = match->data;
> 
> > +	if (info) {
> > +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> > +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> 
> Please use devm_reset_control_get_exclusive() or
> devm_reset_control_get_optional_exclusive().
> 

Will modify as you suggest.

> > +			if (!IS_ERR(sdc->rst)) {
> 
> Please just return errors here instead of ignoring them.
> The reset_control_get_optional variants return NULL in case the
> device node doesn't contain a resets phandle, in case you really
> consider this reset to be optional even though the flag is set?
> 

Will return error here.

> > +				reset_control_assert(sdc->rst);
> > +				reset_control_deassert(sdc->rst);
> 
> Is there no need for delays between assertion and deassertion or after
> the reset is deasserted?
> 

Per the internal discussion, I Will add udelay(1).

> > +			}
> > +		}
> > +	}
> > +
> >  	sdc->clk = devm_clk_get(&pdev->dev, NULL);
> >  	if (IS_ERR(sdc->clk))
> >  		return PTR_ERR(sdc->clk);
> 
> In general, I would assert/deassert the reset only after all resources
> are successfully acquired. This might avoid unnecessary resets in case
> of probe deferrals.
> 

Thanks for the suggestion. I will try to move the implementation of
reset after devm_ioremap_resource().

> regards
> Philipp
