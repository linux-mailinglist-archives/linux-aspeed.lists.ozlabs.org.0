Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0179EA0
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 04:24:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yL3J3ZbQzDqRy
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 12:24:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="irtv6mcr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JD6AaBML"; dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yL344HmMzDqN5
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 12:23:59 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 00EB91730;
 Mon, 29 Jul 2019 22:23:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 29 Jul 2019 22:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=VyxODSw/tRbhfBSToBdgcw8l4+PZOn7
 D5cdegfoq2fI=; b=irtv6mcrSUlU42j++dXIrzGmVdwZNEKgD3wm8OuYShRWbiN
 lsYc5YurwtbemMyF5utr0AbLvumXjda4z7WNOIQ9TvLJwG9F94MiGdRDJ78Wo9PB
 eyRSw/xqsnLYo0kGFhwkVWaonMBMYwaosQ6glU2eE5g8A5fQvsYh/bk9R/tWibUZ
 ZFBPt5zpWHRnDa4PCS/4L63z6xtzMJ9MaHcb+W0bkT7mgDeSkxEKQEIiZ+Owhs8n
 SjLp16FcpCcb4PHdEmQDA0Mvb/LL8HO40jmTrTwGHfJCcaX4E0aNBR3eX9EChtg2
 aGjxWGL8Zd7TbbS/ojH6ycENN7UlqtIz94K4I+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VyxODS
 w/tRbhfBSToBdgcw8l4+PZOn7D5cdegfoq2fI=; b=JD6AaBMLn3Dywuyoil5nHJ
 HGpq8BqFtxkRvpRPftwZb0Mjr0T9aFRGX1ISizuQnoB2yNGMCRT2lRS0MACYxFdC
 mhI9DMqj26YCtO1wTrTS5CTVXOpu4LgdgvJP41HyNKFf9tl3/SxEgL53F0pmMtc1
 NTYY8XUCDt1ClWjZAZXG+XlGKoH4HBcsdcwu5z0xRxY0tVCedLAOUXdeQQ0kLDUz
 YaOW9i17QiGXOl2Obyn2hkbOtUt3GAKIhH5pLeUK5Z6yhfa4uNh7buXcQuTqYgWi
 QI1oHm/KOeDJZKUGBVIugGji5nPK8ZQaBSkUtEg8omvktNI6JZfEoNn/+yjksLxQ
 ==
X-ME-Sender: <xms:Oqo_XZ92B2MptR8XrGt2rvqB6A75BYkkM5sx03QQjQvLFhyx-fYYWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledvgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:Oqo_XfyeKGs9_Kp2xn4n6k8X4Q_QyfYS9H2hAvAysNkzJUX-aQJeZg>
 <xmx:Oqo_XVIfR7B0eYRrrsWvGr6l5LUm_WlD9ByFyaS0tOnIQMlsZnlsPg>
 <xmx:Oqo_XSZ22Zt2dH67sAxpfF_ncRINFARY3vuRDuE9q2vkDZUYf-0xkA>
 <xmx:PKo_XZXSkR4kTG8GdzueTXBHWP4gJmcD6l39HX2s9hrVP_EeSTfyJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 50C1AE00A2; Mon, 29 Jul 2019 22:23:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <19074ccb-5356-469b-8d1e-8076be135a21@www.fastmail.com>
In-Reply-To: <20190729133250.GB4110@lunn.ch>
References: <20190729043926.32679-1-andrew@aj.id.au>
 <20190729043926.32679-3-andrew@aj.id.au> <20190729133250.GB4110@lunn.ch>
Date: Tue, 30 Jul 2019 11:53:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] net: phy: Add mdio-aspeed
Content-Type: text/plain
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
 Florian Fainelli <f.fainelli@gmail.com>, linux-aspeed@lists.ozlabs.org,
 netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, David Miller <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 29 Jul 2019, at 23:03, Andrew Lunn wrote:
> On Mon, Jul 29, 2019 at 02:09:24PM +0930, Andrew Jeffery wrote:
> > The AST2600 design separates the MDIO controllers from the MAC, which is
> > where they were placed in the AST2400 and AST2500. Further, the register
> > interface is reworked again, so now we have three possible different
> > interface implementations, however this driver only supports the
> > interface provided by the AST2600. The AST2400 and AST2500 will continue
> > to be supported by the MDIO support embedded in the FTGMAC100 driver.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/net/phy/Kconfig       |  13 +++
> >  drivers/net/phy/Makefile      |   1 +
> >  drivers/net/phy/mdio-aspeed.c | 159 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 173 insertions(+)
> >  create mode 100644 drivers/net/phy/mdio-aspeed.c
> > 
> > diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> > index 20f14c5fbb7e..206d8650ee7f 100644
> > --- a/drivers/net/phy/Kconfig
> > +++ b/drivers/net/phy/Kconfig
> > @@ -21,6 +21,19 @@ config MDIO_BUS
> >  
> >  if MDIO_BUS
> >  
> > +config MDIO_ASPEED
> > +	tristate "ASPEED MDIO bus controller"
> > +	depends on ARCH_ASPEED || COMPILE_TEST
> > +	depends on OF_MDIO && HAS_IOMEM
> > +	help
> > +	  This module provides a driver for the independent MDIO bus
> > +	  controllers found in the ASPEED AST2600 SoC. This is a driver for the
> > +	  third revision of the ASPEED MDIO register interface - the first two
> > +	  revisions are the "old" and "new" interfaces found in the AST2400 and
> > +	  AST2500, embedded in the MAC. For legacy reasons, FTGMAC100 driver
> > +	  continues to drive the embedded MDIO controller for the AST2400 and
> > +	  AST2500 SoCs, so say N if AST2600 support is not required.
> > +
> >  config MDIO_BCM_IPROC
> >  	tristate "Broadcom iProc MDIO bus controller"
> >  	depends on ARCH_BCM_IPROC || COMPILE_TEST
> > diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
> > index 839acb292c38..ba07c27e4208 100644
> > --- a/drivers/net/phy/Makefile
> > +++ b/drivers/net/phy/Makefile
> > @@ -22,6 +22,7 @@ libphy-$(CONFIG_LED_TRIGGER_PHY)	+= phy_led_triggers.o
> >  obj-$(CONFIG_PHYLINK)		+= phylink.o
> >  obj-$(CONFIG_PHYLIB)		+= libphy.o
> >  
> > +obj-$(CONFIG_MDIO_ASPEED)	+= mdio-aspeed.o
> >  obj-$(CONFIG_MDIO_BCM_IPROC)	+= mdio-bcm-iproc.o
> >  obj-$(CONFIG_MDIO_BCM_UNIMAC)	+= mdio-bcm-unimac.o
> >  obj-$(CONFIG_MDIO_BITBANG)	+= mdio-bitbang.o
> > diff --git a/drivers/net/phy/mdio-aspeed.c b/drivers/net/phy/mdio-aspeed.c
> > new file mode 100644
> > index 000000000000..71496a9ff54a
> > --- /dev/null
> > +++ b/drivers/net/phy/mdio-aspeed.c
> > @@ -0,0 +1,159 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/* Copyright (C) 2019 IBM Corp. */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/mdio.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_mdio.h>
> > +#include <linux/phy.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DRV_NAME "mdio-aspeed"
> > +
> > +#define ASPEED_MDIO_CTRL		0x0
> > +#define   ASPEED_MDIO_CTRL_FIRE		BIT(31)
> > +#define   ASPEED_MDIO_CTRL_ST		BIT(28)
> > +#define     ASPEED_MDIO_CTRL_ST_C45	0
> > +#define     ASPEED_MDIO_CTRL_ST_C22	1
> > +#define   ASPEED_MDIO_CTRL_OP		GENMASK(27, 26)
> > +#define     MDIO_C22_OP_WRITE		0b01
> > +#define     MDIO_C22_OP_READ		0b10
> > +#define   ASPEED_MDIO_CTRL_PHYAD	GENMASK(25, 21)
> > +#define   ASPEED_MDIO_CTRL_REGAD	GENMASK(20, 16)
> > +#define   ASPEED_MDIO_CTRL_MIIWDATA	GENMASK(15, 0)
> > +
> > +#define ASPEED_MDIO_DATA		0x4
> > +#define   ASPEED_MDIO_DATA_MDC_THRES	GENMASK(31, 24)
> > +#define   ASPEED_MDIO_DATA_MDIO_EDGE	BIT(23)
> > +#define   ASPEED_MDIO_DATA_MDIO_LATCH	GENMASK(22, 20)
> > +#define   ASPEED_MDIO_DATA_IDLE		BIT(16)
> > +#define   ASPEED_MDIO_DATA_MIIRDATA	GENMASK(15, 0)
> > +
> > +#define ASPEED_MDIO_RETRIES		10
> > +
> > +struct aspeed_mdio {
> > +	void __iomem *base;
> > +};
> > +
> > +static int aspeed_mdio_read(struct mii_bus *bus, int addr, int regnum)
> > +{
> > +	struct aspeed_mdio *ctx = bus->priv;
> > +	u32 ctrl;
> > +	int i;
> > +
> > +	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d\n", __func__, addr,
> > +		regnum);
> > +
> > +	/* Just clause 22 for the moment */
> > +	ctrl = ASPEED_MDIO_CTRL_FIRE
> 
> Hi Andrew
> 
> In the binding, you say C45 is supported. Here you don't. It would be
> nice to be consistent.

Right - but the bindings describe the hardware, and the hardware is capable.
Just that the driver as it stands can't drive it that way.

Having said that I do need to do more digging to understand how to cater to
C45 PHYs wrt the read/write calls.

> 
> 
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_ST, ASPEED_MDIO_CTRL_ST_C22)
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_OP, MDIO_C22_OP_READ)
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_PHYAD, addr)
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_REGAD, regnum);
> > +
> > +	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
> > +
> > +	for (i = 0; i < ASPEED_MDIO_RETRIES; i++) {
> > +		u32 data;
> > +
> > +		data = ioread32(ctx->base + ASPEED_MDIO_DATA);
> > +		if (data & ASPEED_MDIO_DATA_IDLE)
> > +			return FIELD_GET(ASPEED_MDIO_DATA_MIIRDATA, data);
> > +
> > +		udelay(100);
> > +	}
> 
> One of the readx_poll_timeout functions could be used.

Thanks, I'll take a look.

> 
> > +
> > +	dev_err(&bus->dev, "MDIO read failed\n");
> > +	return -EIO;
> > +}
> > +
> > +static int aspeed_mdio_write(struct mii_bus *bus, int addr, int regnum, u16 val)
> > +{
> > +	struct aspeed_mdio *ctx = bus->priv;
> > +	u32 ctrl;
> > +	int i;
> > +
> > +	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d, val: 0x%x\n",
> > +		__func__, addr, regnum, val);
> > +
> > +	/* Just clause 22 for the moment */
> > +	ctrl = ASPEED_MDIO_CTRL_FIRE
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_ST, ASPEED_MDIO_CTRL_ST_C22)
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_OP, MDIO_C22_OP_WRITE)
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_PHYAD, addr)
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_REGAD, regnum)
> > +		| FIELD_PREP(ASPEED_MDIO_CTRL_MIIWDATA, val);
> > +
> > +	iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
> > +
> > +	for (i = 0; i < ASPEED_MDIO_RETRIES; i++) {
> > +		ctrl = ioread32(ctx->base + ASPEED_MDIO_CTRL);
> > +		if (!(ctrl & ASPEED_MDIO_CTRL_FIRE))
> > +			return 0;
> > +
> > +		udelay(100);
> > +	}
> 
> readx_poll_timeout() here as well.
> 
> Otherwise this looks good.

Thanks for the review!

Andrew
