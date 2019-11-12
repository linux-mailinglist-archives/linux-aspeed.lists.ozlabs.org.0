Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BED9F8C24
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 10:45:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C2sz0kg4zF4tl
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 20:45:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.63.121; helo=1.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4194 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Nov 2019 20:45:20 AEDT
Received: from 1.mo2.mail-out.ovh.net (1.mo2.mail-out.ovh.net [46.105.63.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C2sr0r89zF4c8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 20:45:15 +1100 (AEDT)
Received: from player711.ha.ovh.net (unknown [10.109.160.106])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 27FF81B4E32
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 09:29:48 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 1AFABBDFE896;
 Tue, 12 Nov 2019 08:29:43 +0000 (UTC)
Subject: Re: [PATCH 4/5] ARM: configs: multi_v7: ASPEED network, gpio, FSI
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20191112062857.32638-1-joel@jms.id.au>
 <20191112062857.32638-5-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ab9c9e67-e939-6f92-2496-f73fbadd4592@kaod.org>
Date: Tue, 12 Nov 2019 09:29:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112062857.32638-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7889180647336414061
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejuddurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedu
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
> Enable drivers used by the ASPEED SoCs so the multi v7 defconfig can run
> on those boards.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/arm/configs/multi_v7_defconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 13ba53286901..124f50dc9cc7 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -244,6 +244,7 @@ CONFIG_BGMAC_BCMA=y
>  CONFIG_SYSTEMPORT=m
>  CONFIG_MACB=y
>  CONFIG_NET_CALXEDA_XGMAC=y
> +CONFIG_FTGMAC100=m
>  CONFIG_GIANFAR=y
>  CONFIG_HIX5HD2_GMAC=y
>  CONFIG_E1000E=y
> @@ -437,6 +438,7 @@ CONFIG_PINCTRL_MSM8X74=y
>  CONFIG_PINCTRL_MSM8916=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
> +CONFIG_GPIO_ASPEED_SGPIO=y
>  CONFIG_GPIO_DAVINCI=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_EM=y
> @@ -1041,6 +1043,13 @@ CONFIG_ROCKCHIP_EFUSE=m
>  CONFIG_NVMEM_IMX_OCOTP=y
>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_NVMEM_VF610_OCOTP=y
> +CONFIG_FSI=m
> +CONFIG_FSI_MASTER_GPIO=m
> +CONFIG_FSI_MASTER_HUB=m
> +CONFIG_FSI_MASTER_ASPEED=m
> +CONFIG_FSI_SCOM=m
> +CONFIG_FSI_SBEFIFO=m
> +CONFIG_FSI_OCC=m
>  CONFIG_EXT4_FS=y
>  CONFIG_AUTOFS4_FS=y
>  CONFIG_MSDOS_FS=y
> 

