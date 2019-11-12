Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540CF8A8D
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 09:35:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C1K666yCzF50P
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 19:35:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.46.10; helo=4.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Nov 2019 19:35:16 AEDT
Received: from 4.mo3.mail-out.ovh.net (4.mo3.mail-out.ovh.net [178.33.46.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C1K04RsRzF4xs
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 19:35:13 +1100 (AEDT)
Received: from player791.ha.ovh.net (unknown [10.108.54.156])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 0C8852310B0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 09:29:18 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id 21A83BDD63AF;
 Tue, 12 Nov 2019 08:29:13 +0000 (UTC)
Subject: Re: [PATCH 3/5] ARM: config: aspeed-g4: Add MMC, and cleanup
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20191112062857.32638-1-joel@jms.id.au>
 <20191112062857.32638-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fc2e193f-93e5-fc71-663f-d08e5b60e8ca@kaod.org>
Date: Tue, 12 Nov 2019 09:29:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112062857.32638-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7880736402176641901
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
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

On 12/11/2019 07:28, Joel Stanley wrote:
> The PCA muxes now depend on I2C_MUX. SPI si now required by SPI-NOR.
> 
> Add the eMMC driver, and remove the FSI SBEFIFO which is not used on AST2400
> systems.
> 
> The remaining changes are cleanups from regenerating the defconfig.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/arm/configs/aspeed_g4_defconfig | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
> index 1857df992484..303f75a3baec 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -132,10 +132,12 @@ CONFIG_ASPEED_BT_IPMI_BMC=y
>  CONFIG_HW_RANDOM_TIMERIOMEM=y
>  # CONFIG_I2C_COMPAT is not set
>  CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_MUX=y
>  CONFIG_I2C_MUX_PCA9541=y
>  CONFIG_I2C_MUX_PCA954x=y
>  CONFIG_I2C_ASPEED=y
>  CONFIG_I2C_FSI=y
> +CONFIG_SPI=y
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_ASPEED=y
> @@ -185,6 +187,12 @@ CONFIG_USB_CONFIGFS_F_LB_SS=y
>  CONFIG_USB_CONFIGFS_F_FS=y
>  CONFIG_USB_CONFIGFS_F_HID=y
>  CONFIG_USB_CONFIGFS_F_PRINTER=y
> +CONFIG_MMC=y
> +# CONFIG_PWRSEQ_EMMC is not set
> +# CONFIG_PWRSEQ_SIMPLE is not set
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_OF_ASPEED=y
>  CONFIG_NEW_LEDS=y
>  CONFIG_LEDS_CLASS=y
>  CONFIG_LEDS_CLASS_FLASH=y
> @@ -216,7 +224,6 @@ CONFIG_FSI_MASTER_GPIO=y
>  CONFIG_FSI_MASTER_HUB=y
>  CONFIG_FSI_MASTER_AST_CF=y
>  CONFIG_FSI_SCOM=y
> -CONFIG_FSI_SBEFIFO=y
>  CONFIG_FANOTIFY=y
>  CONFIG_OVERLAY_FS=y
>  CONFIG_TMPFS=y
> @@ -231,7 +238,6 @@ CONFIG_SQUASHFS_ZSTD=y
>  # CONFIG_NETWORK_FILESYSTEMS is not set
>  CONFIG_HARDENED_USERCOPY=y
>  CONFIG_FORTIFY_SOURCE=y
> -# CONFIG_CRYPTO_ECHAINIV is not set
>  CONFIG_CRYPTO_HMAC=y
>  CONFIG_CRYPTO_SHA256=y
>  CONFIG_CRYPTO_USER_API_HASH=y
> @@ -247,14 +253,14 @@ CONFIG_DEBUG_INFO_REDUCED=y
>  CONFIG_DEBUG_INFO_DWARF4=y
>  CONFIG_GDB_SCRIPTS=y
>  CONFIG_STRIP_ASM_SYMS=y
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_PANIC_ON_OOPS=y
> +CONFIG_PANIC_TIMEOUT=-1
>  CONFIG_SOFTLOCKUP_DETECTOR=y
>  # CONFIG_DETECT_HUNG_TASK is not set
>  CONFIG_WQ_WATCHDOG=y
> -CONFIG_PANIC_ON_OOPS=y
> -CONFIG_PANIC_TIMEOUT=-1
>  # CONFIG_SCHED_DEBUG is not set
> -CONFIG_SCHED_STACK_END_CHECK=y
>  CONFIG_FUNCTION_TRACER=y
> -# CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_DEBUG_WX=y
>  CONFIG_DEBUG_USER=y
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> 

