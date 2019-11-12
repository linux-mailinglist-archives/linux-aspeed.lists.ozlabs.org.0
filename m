Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77955F8F3A
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 13:06:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C60r21T1zF51k
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 23:06:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.33.73; helo=20.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4190 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Nov 2019 23:06:26 AEDT
Received: from 20.mo4.mail-out.ovh.net (20.mo4.mail-out.ovh.net [46.105.33.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C60f2L0GzF4Zn
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 23:06:23 +1100 (AEDT)
Received: from player699.ha.ovh.net (unknown [10.109.143.249])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id E2D41212293
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 09:28:14 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id B59A0BFA35EE;
 Tue, 12 Nov 2019 08:28:09 +0000 (UTC)
Subject: Re: [PATCH 2/5] ARM: config: aspeed-g5: Add SGPIO and FSI drivers
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20191112062857.32638-1-joel@jms.id.au>
 <20191112062857.32638-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6e17dd6a-b188-3ffb-b054-b8d5813bba3e@kaod.org>
Date: Tue, 12 Nov 2019 09:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112062857.32638-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7862722002244504429
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
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
> These are recently merged drivers for ASPEED systems.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  arch/arm/configs/aspeed_g5_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index b87508c7056c..b0d056d49abe 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -155,6 +155,7 @@ CONFIG_SPI=y
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_ASPEED=y
> +CONFIG_GPIO_ASPEED_SGPIO=y
>  CONFIG_W1=y
>  CONFIG_W1_MASTER_GPIO=y
>  CONFIG_W1_SLAVE_THERM=y
> @@ -237,8 +238,10 @@ CONFIG_FSI=y
>  CONFIG_FSI_MASTER_GPIO=y
>  CONFIG_FSI_MASTER_HUB=y
>  CONFIG_FSI_MASTER_AST_CF=y
> +CONFIG_FSI_MASTER_ASPEED=y
>  CONFIG_FSI_SCOM=y
>  CONFIG_FSI_SBEFIFO=y
> +CONFIG_FSI_OCC=y
>  CONFIG_FANOTIFY=y
>  CONFIG_OVERLAY_FS=y
>  CONFIG_TMPFS=y
> 

