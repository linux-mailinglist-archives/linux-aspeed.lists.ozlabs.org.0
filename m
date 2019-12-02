Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F050210EA89
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 14:11:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RQVM0bVyzDqL2
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 00:11:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
X-Greylist: delayed 1027 seconds by postgrey-1.36 at bilbo;
 Tue, 03 Dec 2019 00:11:14 AEDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RQVB08XQzDqPN
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 00:11:13 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iblCv-0005Dy-AR; Mon, 02 Dec 2019 13:53:41 +0100
Message-ID: <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Rob
 Herring <robh+dt@kernel.org>
Date: Mon, 02 Dec 2019 13:53:37 +0100
In-Reply-To: <20191129000827.650566-3-joel@jms.id.au>
References: <20191129000827.650566-1-joel@jms.id.au>
 <20191129000827.650566-3-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2019-11-29 at 10:38 +1030, Joel Stanley wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> The AST2600 SoC contains the same LPC register set as the AST2500.

If the LPC register set is exactly the same, shouldn't AST2600 reuse the
AST2500 compatible, i.e.:
	compatible = "aspeed,ast2600-lpc-reset", "aspeed,ast2500-lpc-reset";
?

> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/reset/reset-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 067e7e7b34f1..795c9063fe7b 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
>  		.data = &reset_simple_active_low },
>  	{ .compatible = "aspeed,ast2400-lpc-reset" },
>  	{ .compatible = "aspeed,ast2500-lpc-reset" },
> +	{ .compatible = "aspeed,ast2600-lpc-reset" },
>  	{ .compatible = "bitmain,bm1880-reset",
>  		.data = &reset_simple_active_low },
>  	{ .compatible = "snps,dw-high-reset" },

regards
Philipp

