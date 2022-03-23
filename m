Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8D4E5250
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Mar 2022 13:38:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNnvH1Ndnz300L
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Mar 2022 23:38:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=JxM+pbxp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=JxM+pbxp; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNnv86d3Xz2xKT
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Mar 2022 23:37:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=0tIk9V8VD5AtRCLLGr16uC8J1QyfJRaMrHIoDCtvAUw=; b=JxM+pbxpDceF19qUldOyoUWeHw
 TaMtGKOhzOL44VRCWkFKHRC6Xehodn1mGuNkRrfLBxi0rUESofO540+bJOJvnaErIgvwQLad1QHFY
 4YpZUOenCF3xgdzkAa44Nswj++HFg72J1WmbwcTtrPxiSlS3Pv1s30Ix1/Sa/eweyunY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nX0F2-00CHHR-PF; Wed, 23 Mar 2022 13:37:32 +0100
Date: Wed, 23 Mar 2022 13:37:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: ryan_chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 2/2] i2c:aspeed:support ast2600 i2c new register mode
 driver
Message-ID: <YjsUjB7vr1scHPVy@lunn.ch>
References: <20220323004009.943298-1-ryan_chen@aspeedtech.com>
 <20220323004009.943298-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323004009.943298-3-ryan_chen@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 23, 2022 at 08:40:09AM +0800, ryan_chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register set. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. And i2c new register mode have separate register
> set to control i2c master and slave.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/Kconfig                 |   11 +
>  drivers/i2c/busses/Makefile                |    1 +
>  drivers/i2c/busses/aspeed-i2c-new-global.c |   91 ++
>  drivers/i2c/busses/aspeed-i2c-new-global.h |   19 +
>  drivers/i2c/busses/i2c-new-aspeed.c        | 1698 ++++++++++++++++++++

I always find it funny when somebody uses 'new'. What is the next
version going to be called? 'even-newer', and the version after that
'really-really-new'?

> +static const struct of_device_id aspeed_new_i2c_bus_of_table[] = {
> +	{
> +		.compatible = "aspeed,ast2600-i2c-bus",
> +	},

Given this compatible string, why not call it i2c-aspeed-2600.c, and
remove 'new' everywhere.

       Andrew
