Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4826D04C
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 02:59:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJXD2L04zDqv5
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 10:59:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=XD0baKQy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=sDhQRqfv; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ105DD3zDqL2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 10:36:04 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 455525C0B47;
 Wed, 16 Sep 2020 19:40:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Sep 2020 19:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Pp1oa9DT0nuB30pqA8KbMziVzg8MUH9
 zMt5rCFr4XLI=; b=XD0baKQyxxfVUl13q9wWqMZhYf51w2a3YXQzVJr7zA5OG00
 Fxq4I6jp1SXh+0K9ky+zne7I9kasSiymxrnDajPvKJbqWnF6RbcBHwVH45OOxpj5
 Cu0z8AUpyZlDPHyDinJPW9v8aOUwL4vhJN16hAbTwXu8J6r1SxE6fYZf0OStvVGV
 6d1Bzw8ATk/VgY143xqrAAlXmTRDrndWozWOYO1HW6bRN8uwnGzlvFwSOZsxfKZd
 acHDUW6tZTjpg5wdI19BY2w1bJzNGc71/Kr+3JcrMaYtd8kuckwBq75rn4Mhg0m7
 TZC0rt9rKa3dfGG3Rqsgbg2kL/CSDvp+lNsQ/Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Pp1oa9
 DT0nuB30pqA8KbMziVzg8MUH9zMt5rCFr4XLI=; b=sDhQRqfvvcmP+V7bbnoAYX
 Q1JHdSXj6SO8h244GElELo92UMUqlVu7HOFlWXM2HjmkgUKxG/oHYvpGTGGfSs2i
 Asg89FksYCpDzYBOaItt4DUgu4NI7OxAQ3D0lcVihTo3Pe4iIr4WdMCUk9vfjeMT
 Fs5KAbLtd0lmEUicgXcEAnoZq/J9ZUN+R0rV/kD2UTZBXf/A5yB6qOJ4j2y4vXcB
 Iij7BrWIdUJD5JKUtyNeSFbZ1AePl839t6pAj3s9wKGUAuy0x0AW5sjhy08VEZ8V
 vi3V0jw3AK0wtxQZDGEAWhNxHxpX9W8+LQLev+XDVvh+VDESA0D1CVqx6HcyAolg
 ==
X-ME-Sender: <xms:hqJiXxYbc8zJXf7meo06051uLMGS8CrH4zu6RA6s_t0Ur8C8iWumrA>
 <xme:hqJiX4Zolsu3bnQ2_XQc3O-rFILn56YIl0hKW2-x2n2lrLUETqCKsquOQXWjFZrqS
 9FBonpVFF5EdXfXlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:hqJiXz8921cn8sT9iUlWJoPxaNXq_MlPdcqRddwq19y6kNQ4r9MSDg>
 <xmx:hqJiX_oZV75PeL9qVydY-SUr8-JzthgrPBdI2kX_zTE9nDyxvFsw0w>
 <xmx:hqJiX8pvKEczMS7PFhrzynFAq0hU5LQqbsllxH5NLqlaT1GmYGi70A>
 <xmx:iaJiX5Cq1cT2IF5-WdySzRavqYzko1P2jcD-W1SxXhlFlwk51wJRYg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2751EE00D1; Wed, 16 Sep 2020 19:40:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <aabf960e-33b3-4094-ad03-8305ca1794c7@www.fastmail.com>
In-Reply-To: <20200916084703.778386-3-joel@jms.id.au>
References: <20200916084703.778386-1-joel@jms.id.au>
 <20200916084703.778386-3-joel@jms.id.au>
Date: Thu, 17 Sep 2020 09:10:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] soc: aspeed: Add soc info driver
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 16 Sep 2020, at 18:17, Joel Stanley wrote:
> This adds a SOC_BUS info driver for the ASPEED platform.
> 
> The full ID table is preserved in this commit message in case someone
> finds a need to change the implemntation in the future.
> 
> 	{ "AST1100-A0", 0x00000200 },
> 	{ "AST1100-A1", 0x00000201 },
> 	{ "AST1100-A2", 0x00000202 },
> 	{ "AST1100-A3", 0x00000202 },
> 
> 	{ "AST2050-A0", 0x00000200 },
> 	{ "AST2050-A1", 0x00000201 },
> 	{ "AST2050-A2", 0x00000202 },
> 	{ "AST2050-A3", 0x00000202 },
> 
> 	{ "AST2100-A0", 0x00000300 },
> 	{ "AST2100-A1", 0x00000301 },
> 	{ "AST2100-A2", 0x00000302 },
> 	{ "AST2100-A3", 0x00000302 },
> 
> 	{ "AST2150-A0", 0x00000202 },
> 	{ "AST2150-A1", 0x00000202 },
> 
> 	{ "AST2200-A0", 0x00000102 },
> 	{ "AST2200-A1", 0x00000102 },
> 
> 	{ "AST2300-A0", 0x01000003 },
> 	{ "AST2300-A1", 0x01010303 },
> 
> 	{ "AST1300-A1", 0x01010003 },
> 	{ "AST1050-A1", 0x01010203 },
> 
> 	{ "AST2400-A0", 0x02000303 },
> 	{ "AST2400-A1", 0x02010303 },
> 	{ "AST1400-A1", 0x02010103 },
> 	{ "AST1250-A1", 0x02010303 },
> 
> 	{ "AST2500-A0", 0x04000303 },
> 	{ "AST2510-A0", 0x04000103 },
> 	{ "AST2520-A0", 0x04000203 },
> 	{ "AST2530-A0", 0x04000403 },
> 	{ "AST2500-A1", 0x04010303 },
> 	{ "AST2510-A1", 0x04010103 },
> 	{ "AST2520-A1", 0x04010203 },
> 	{ "AST2530-A1", 0x04010403 },
> 	{ "AST2500-A2", 0x04030303 },
> 	{ "AST2510-A2", 0x04030103 },
> 	{ "AST2520-A2", 0x04030203 },
> 	{ "AST2530-A2", 0x04030403 },
> 
> 	{ "AST2600-A0", 0x05000303 },
> 	{ "AST2600-A1", 0x05010303 },
> 	{ "AST2600-A2", 0x05020303 },
> 	{ "AST2620-A1", 0x05010203 },
> 	{ "AST2620-A2", 0x05020203 },
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/soc/aspeed/Kconfig          |   7 ++
>  drivers/soc/aspeed/Makefile         |   1 +
>  drivers/soc/aspeed/aspeed-socinfo.c | 141 ++++++++++++++++++++++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 drivers/soc/aspeed/aspeed-socinfo.c
> 
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index 3c03c255e6e9..be5a29e8b0dc 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -35,6 +35,13 @@ config ASPEED_P2A_CTRL
>  	  driver also provides an interface for userspace mappings to a
>  	  pre-defined region.
>  
> +config ASPEED_SOCINFO
> +	bool "ASPEED SoC Information driver"
> +	default ARCH_ASPEED
> +	select SOC_BUS
> +	help
> +	  Say yes to support decoding of ASPEED BMC information.
> +
>  endmenu
>  
>  endif
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index b64be47f2b1f..fcab7192e1a4 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
>  obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
>  obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
> +obj-$(CONFIG_ASPEED_SOCINFO)	+= aspeed-socinfo.o
> diff --git a/drivers/soc/aspeed/aspeed-socinfo.c 
> b/drivers/soc/aspeed/aspeed-socinfo.c
> new file mode 100644
> index 000000000000..b72c449f7ccb
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-socinfo.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright 2019 IBM Corp. */
> +
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>
> +
> +static struct {
> +	const char *name;
> +	const u32 id;
> +} const rev_table[] = {
> +	/* AST2400 */
> +	{ "AST2400", 0x02000303 },
> +	{ "AST1400", 0x02010103 },
> +	{ "AST1250", 0x02010303 },
> +	/* AST2500 */
> +	{ "AST2500", 0x04000303 },
> +	{ "AST2510", 0x04000103 },
> +	{ "AST2520", 0x04000203 },
> +	{ "AST2530", 0x04000403 },
> +	/* AST2600 */
> +	{ "AST2600", 0x05000303 },
> +	{ "AST2620", 0x05010203 },
> +};
> +
> +static const char *siliconid_to_name(u32 siliconid)
> +{
> +	unsigned int id = siliconid & 0xff00ffff;
> +	unsigned int i;
> +
> +	for (i = 0 ; i < ARRAY_SIZE(rev_table) ; ++i) {
> +		if (rev_table[i].id == id)
> +			return rev_table[i].name;
> +	}
> +
> +	return "Unknown";
> +}
> +
> +static const char *siliconid_to_rev(u32 siliconid)
> +{
> +	unsigned int rev = (siliconid >> 16) & 0xff;
> +
> +	switch (rev) {
> +	case 0:
> +		return "A0";
> +	case 1:
> +		return "A1";
> +	case 3:
> +		return "A2";
> +	};
> +
> +	return "??";
> +}
> +
> +static int __init aspeed_socinfo_init(void)
> +{
> +	struct soc_device_attribute *attrs;
> +	struct soc_device *soc_dev;
> +	struct device_node *np;
> +	void __iomem *reg;
> +	bool has_chipid = false;
> +	u32 siliconid;
> +	u32 chipid[2];
> +	const char *machine = NULL;
> +
> +	np = of_find_compatible_node(NULL, NULL, "aspeed,silicon-id");
> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
> +	reg = of_iomap(np, 0);
> +	if (!reg)
> +		return -ENODEV;
> +	siliconid = readl(reg);
> +	of_node_put(np);
> +	iounmap(reg);
> +
> +	/* This is optional, the ast2400 does not have it */
> +	reg = of_iomap(np, 1);

Use of np after of_node_put(np) above.

> +	if (reg) {
> +		has_chipid = true;
> +		chipid[0] = readl(reg);
> +		chipid[1] = readl(reg + 4);
> +		iounmap(reg);
> +		of_node_put(np);

Double of_node_put() of np.

> +	}
> +
> +	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENODEV;
> +
> +	/*
> +	 * Machine: Romulus BMC
> +	 * Family: AST2500
> +	 * Revision: A1
> +	 * SoC ID: raw silicon revision id
> +	 * Serial Nnumber: 64-bit chipid
> +	 */
> +
> +	np = of_find_node_by_path("/");
> +	of_property_read_string(np, "model", &machine);
> +	if (machine)
> +		attrs->machine = kstrdup(machine, GFP_KERNEL);
> +	of_node_put(np);
> +
> +	attrs->family = kasprintf(GFP_KERNEL, "%s",
> +				  siliconid_to_name(siliconid));
> +
> +	attrs->revision = kasprintf(GFP_KERNEL, "%s",
> +				    siliconid_to_rev(siliconid));

`struct soc_device_attribute` declares these as `const char *` and the strings
are constants in the driver, so is there any reason to use kasprintf() here?

Andrew

> +
> +	attrs->soc_id = kasprintf(GFP_KERNEL, "%08x", siliconid);
> +
> +	if (has_chipid) {
> +		attrs->serial_number = kasprintf(GFP_KERNEL, "%08x%08x",
> +						 chipid[1], chipid[0]);
> +	}
> +
> +	soc_dev = soc_device_register(attrs);
> +	if (IS_ERR(soc_dev)) {
> +		kfree(attrs->family);
> +		kfree(attrs->revision);
> +		kfree(attrs->soc_id);
> +		kfree(attrs->serial_number);
> +		kfree(attrs);
> +		return PTR_ERR(soc_dev);
> +	}
> +
> +	pr_info("ASPEED BMC %s rev %s (%s)\n",
> +			attrs->family,
> +			attrs->revision,
> +			attrs->soc_id);
> +
> +	return 0;
> +}
> +early_initcall(aspeed_socinfo_init);
> -- 
> 2.28.0
> 
>
