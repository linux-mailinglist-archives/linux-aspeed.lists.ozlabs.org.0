Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE804D3237
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Mar 2022 16:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDGvj6tnVz3bVK
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 02:53:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192;
 helo=3.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDGvZ2nXyz2xsq
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 02:53:43 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 90FB1242BD;
 Wed,  9 Mar 2022 15:53:39 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 16:53:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006823af12e-97fb-4feb-b06d-d1d19df1e0d1,
 4C617328B094ABD9DFA4DE296C3C041D1A210FDA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <92c2301f-5759-c13c-84f6-52ec69af7de6@kaod.org>
Date: Wed, 9 Mar 2022 16:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ARM: soc: aspeed: Add secure boot controller support
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220304030336.1017197-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220304030336.1017197-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 24ea044a-bdd3-4a74-90a4-7a6dbccab1a0
X-Ovh-Tracer-Id: 14808398525096102819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddukedgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfdthedvjeekhfduveekkeffkeelteeffedtkeduleeiudejfedtieekffevgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Joel,

On 3/4/22 04:03, Joel Stanley wrote:
> This reads out the status of the secure boot controller and exposes it
> in debugfs.
> 
> An example on a AST2600A3 QEMU model:
> 
>   # grep -r . /sys/kernel/debug/aspeed/*
>   /sys/kernel/debug/aspeed/abr_image:0
>   /sys/kernel/debug/aspeed/low_security_key:0
>   /sys/kernel/debug/aspeed/otp_protected:0
>   /sys/kernel/debug/aspeed/secure_boot:1
>   /sys/kernel/debug/aspeed/uart_boot:0
> 
> On boot the state of the system according to the secure boot controller
> will be printed:
> 
>   [    0.037634] AST2600 secure boot enabled
> 
> or
> 
>   [    0.037935] AST2600 secure boot disabled
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> We're creating a common API for a subset of this information in sysfs:
> 
>   https://lore.kernel.org/all/20220204072234.304543-1-joel@jms.id.au/
> 
> However, machines with an ASPEED soc need the detailed information from
> the SBE that is not relevant for other systems, so expose it all in
> debugfs.
> 
>   drivers/soc/aspeed/aspeed-sbc.c | 71 +++++++++++++++++++++++++++++++++
>   drivers/soc/aspeed/Kconfig      |  7 ++++
>   drivers/soc/aspeed/Makefile     |  1 +
>   3 files changed, 79 insertions(+)
>   create mode 100644 drivers/soc/aspeed/aspeed-sbc.c
> 
> diff --git a/drivers/soc/aspeed/aspeed-sbc.c b/drivers/soc/aspeed/aspeed-sbc.c
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

Why not put these definitions under a common header file ?

> +struct sbe {> +	u8 abr_image;
> +	u8 low_security_key;
> +	u8 otp_protected;
> +	u8 secure_boot;
> +	u8 invert;
> +	u8 uart_boot;

 From what the code does below, these could be of type 'bool'

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
> +
> +	sbe.abr_image = !!(security_status & ABR_IMAGE_SOURCE);
> +	sbe.low_security_key = !!(security_status & LOW_SEC_KEY);
> +	sbe.otp_protected = !!(security_status & OTP_PROTECTED);
> +	sbe.secure_boot = !!(security_status & SECURE_BOOT);
> +	/* Invert the bit, as 1 is boot from SPI/eMMC */
> +	sbe.uart_boot =  !(security_status & UART_BOOT);
> +
> +	debugfs_root = debugfs_create_dir("aspeed", NULL);

may be use 'arch_debugfs_dir' or is that the same ? and test the returned
value as it can fail.

Also, instead of 'debugfs_root', we could introduce an extern
'aspeed_debugfs_dir' for other aspeed drivers. For instance, the spi-mem
driver for flash devices could expose some internal settings like the
direct mapping ranges for each flash device. I am sure other drivers
would use it.

> +	debugfs_create_u8("abr_image", 0444, debugfs_root, &sbe.abr_image);
> +	debugfs_create_u8("low_security_key", 0444, debugfs_root, &sbe.low_security_key);
> +	debugfs_create_u8("otp_protected", 0444, debugfs_root, &sbe.otp_protected);
> +	debugfs_create_u8("uart_boot", 0444, debugfs_root, &sbe.uart_boot);
> +	debugfs_create_u8("secure_boot", 0444, debugfs_root, &sbe.secure_boot);

It would be cleaner if these files were under a 'sbe' or 'sbc' directory.

Thanks,

C.

> +
> +	pr_info("AST2600 secure boot %s\n", sbe.secure_boot ? "enabled" : "disabled");
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
>   	help
>   	  Say yes to support decoding of ASPEED BMC information.
>   
> +config ASPEED_SBC
> +	bool "ASPEED Secure Boot Controller driver"
> +	default MACH_ASPEED_G6> +	help
> +	  Say yes to provide information about the secure boot controller in
> +	  debugfs.
> +
>   endmenu
>   
>   endif
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index b35d74592964..042235ffa05b 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
>   obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
>   obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
>   obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
> +obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o

