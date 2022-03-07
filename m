Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 309334CEF0E
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Mar 2022 02:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBgK80VDGz30N6
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Mar 2022 12:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=oAJluC8o;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KPxdvW0v;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=oAJluC8o; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KPxdvW0v; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBgJx2s3rz2xKJ
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Mar 2022 12:06:40 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6F81D3201D5E;
 Sun,  6 Mar 2022 20:06:36 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Sun, 06 Mar 2022 20:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=/AUgfC+7Zw02ZKm05wwfBjgGYhe5UtHHDAkHZM
 sAvBk=; b=oAJluC8o2n5itBLIJav8NM4lUAf3InHVfFyPs602lwujNS47U1pV19
 2ht0C0EbyXSTh615lCEShGwy0qEYWGd2kiAo6DSF7w/4zgaFkYqnwtDL9EQ9PASQ
 0tEjp1i+LEuMMYB+Y4tvN1p9B/ZDR0nhqc4jfYpc28LeVBfxPmcJ8vGBJcRcwXGC
 xYRsIodErcI2tPAntM758ksGKTC35G6aYN8Nmzap8cejGviEuAnYFxzGEoJsB7PK
 pf1WiHpt4OWTuQ95MKmpTRkFpT8MQ0fq5jl68XM13MdKnF6TJ+ZfK8NhNF0R3Z+R
 NS4RfZ4jqSSPzf2bxRPgCBHvM/qK+XkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/AUgfC+7Zw02ZKm05
 wwfBjgGYhe5UtHHDAkHZMsAvBk=; b=KPxdvW0v5RCLfS6e+MVAA0xdGw53ACmZ9
 ABzpMf3UG0qoW7kojlTEcaNyEKcAMNEDbs3zYfbEh1+g4kuciSTPyqmDJYJmfQwi
 C0Z/TILA/IkP5aW38AR1MKr0qpDUIbuGo4lJnj/23OpJNE1i4E0HL+Y9duWmMaRL
 aaDmro64LDgVfGhNiwpIc6mltMyT6OQz6qjlWLk4pMy+t/p+FJxZHtM6FZoc24QS
 rCPfuXDo/UYaTS2pQEQ1cnB/AdjD1L5k6rjRVAUe0Kz+kpVzUfWVt0+xGhvkgHNa
 OmwuZ6zHMC+NfQ+aTLqIyegEswOqSoYShFqb+p2UlXpSrMCTMnVZA==
X-ME-Sender: <xms:m1olYpI1tzCS7Xkjziex5RK31kTL94xDoWtUnOar5Thn8ujiEERioQ>
 <xme:m1olYlIXsZ4N6B_moOCKkRkO5_C8nuXUO-fOvjkbxU4LgQQ-MnGPAOnh1BzuwLPYP
 cyWYKETznwVc8X6fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddufedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:m1olYhvyUj-l9CKx5tyGjpYPZycGf88HnRpJlHq3sRSbG-_f12xqgw>
 <xmx:m1olYqbDnFsyF3lOKWQubwgldLWgtzfkqFdiCAL_asDMrpVFmExeTQ>
 <xmx:m1olYgY20mY1poG_SdiLSuW1OhSL1AoyaWPJyIsHmQB-5Q4CDRvD7Q>
 <xmx:m1olYrxdDqk_Xal4i-KIvJpdsZjitVfR6orrH3PvfMWtu2og_IEitg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1C33EF6007E; Sun,  6 Mar 2022 20:06:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <ff5acde7-3c64-4d1b-820f-f1ca23d5ddc2@www.fastmail.com>
In-Reply-To: <20220304030336.1017197-1-joel@jms.id.au>
References: <20220304030336.1017197-1-joel@jms.id.au>
Date: Mon, 07 Mar 2022 11:36:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ARM: soc: aspeed: Add secure boot controller support
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 4 Mar 2022, at 13:33, Joel Stanley wrote:
> This reads out the status of the secure boot controller and exposes it
> in debugfs.
>
> An example on a AST2600A3 QEMU model:
>
>  # grep -r . /sys/kernel/debug/aspeed/*
>  /sys/kernel/debug/aspeed/abr_image:0
>  /sys/kernel/debug/aspeed/low_security_key:0
>  /sys/kernel/debug/aspeed/otp_protected:0
>  /sys/kernel/debug/aspeed/secure_boot:1
>  /sys/kernel/debug/aspeed/uart_boot:0
>
> On boot the state of the system according to the secure boot controller
> will be printed:
>
>  [    0.037634] AST2600 secure boot enabled
>
> or
>
>  [    0.037935] AST2600 secure boot disabled
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> We're creating a common API for a subset of this information in sysfs:
>
>  https://lore.kernel.org/all/20220204072234.304543-1-joel@jms.id.au/
>
> However, machines with an ASPEED soc need the detailed information from
> the SBE that is not relevant for other systems, so expose it all in
> debugfs.
>
>  drivers/soc/aspeed/aspeed-sbc.c | 71 +++++++++++++++++++++++++++++++++
>  drivers/soc/aspeed/Kconfig      |  7 ++++
>  drivers/soc/aspeed/Makefile     |  1 +
>  3 files changed, 79 insertions(+)
>  create mode 100644 drivers/soc/aspeed/aspeed-sbc.c
>
> diff --git a/drivers/soc/aspeed/aspeed-sbc.c 
> b/drivers/soc/aspeed/aspeed-sbc.c
> new file mode 100644
> index 000000000000..ee466f02ae4c
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-sbc.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright 2022 IBM Corp. */
> +
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/debugfs.h>
> +
> +#define SEC_STATUS		0x14
> +#define ABR_IMAGE_SOURCE	BIT(13)
> +#define OTP_PROTECTED		BIT(8)
> +#define LOW_SEC_KEY		BIT(7)
> +#define SECURE_BOOT		BIT(6)
> +#define UART_BOOT		BIT(5)
> +
> +struct sbe {
> +	u8 abr_image;
> +	u8 low_security_key;
> +	u8 otp_protected;
> +	u8 secure_boot;
> +	u8 invert;
> +	u8 uart_boot;
> +};
> +
> +static struct sbe sbe;
> +
> +static int __init aspeed_sbc_init(void)
> +{
> +	struct device_node *np;
> +	void __iomem *base;
> +	struct dentry *debugfs_root;
> +	u32 security_status;

If you change anything else, maybe reverse-christmas-tree this too?

> +
> +	/* AST2600 only */
> +	np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
> +	if (!of_device_is_available(np))
> +		return -ENODEV;
> +
> +	base = of_iomap(np, 0);
> +	if (!base) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
> +	security_status = readl(base + SEC_STATUS);
> +
> +	iounmap(base);
> +	of_node_put(np);

The cleanup looks right to me. I half wonder if it would be better with 
a single-exit and gotos, but that's just an idle thought.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +
> +	sbe.abr_image = !!(security_status & ABR_IMAGE_SOURCE);
> +	sbe.low_security_key = !!(security_status & LOW_SEC_KEY);
> +	sbe.otp_protected = !!(security_status & OTP_PROTECTED);
> +	sbe.secure_boot = !!(security_status & SECURE_BOOT);
> +	/* Invert the bit, as 1 is boot from SPI/eMMC */
> +	sbe.uart_boot =  !(security_status & UART_BOOT);
> +
> +	debugfs_root = debugfs_create_dir("aspeed", NULL);
> +	debugfs_create_u8("abr_image", 0444, debugfs_root, &sbe.abr_image);
> +	debugfs_create_u8("low_security_key", 0444, debugfs_root, 
> &sbe.low_security_key);
> +	debugfs_create_u8("otp_protected", 0444, debugfs_root, 
> &sbe.otp_protected);
> +	debugfs_create_u8("uart_boot", 0444, debugfs_root, &sbe.uart_boot);
> +	debugfs_create_u8("secure_boot", 0444, debugfs_root, 
> &sbe.secure_boot);
> +
> +	pr_info("AST2600 secure boot %s\n", sbe.secure_boot ? "enabled" : 
> "disabled");
> +
> +	return 0;
> +}
> +
> +
> +subsys_initcall(aspeed_sbc_init);
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index f579ee0b5afa..7a2a5bed8bc5 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -52,6 +52,13 @@ config ASPEED_SOCINFO
>  	help
>  	  Say yes to support decoding of ASPEED BMC information.
> 
> +config ASPEED_SBC
> +	bool "ASPEED Secure Boot Controller driver"
> +	default MACH_ASPEED_G6
> +	help
> +	  Say yes to provide information about the secure boot controller in
> +	  debugfs.
> +
>  endmenu
> 
>  endif
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index b35d74592964..042235ffa05b 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
>  obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
>  obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
>  obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
> +obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
> -- 
> 2.34.1
