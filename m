Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2626C538
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 18:37:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs5Nw5wHWzDqjy
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 02:37:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs5KB6BqkzDqRp
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 02:34:21 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.95])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8412E5BCD50A;
 Wed, 16 Sep 2020 18:34:14 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 16 Sep
 2020 18:34:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005634e9cc0-062d-43b1-a9a5-af2e5a2bc8a0,
 282F6B8BB580550643A9CB45D70726BD5CC915E6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] soc: aspeed: Improve kconfig
To: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Andrew
 Jeffery <andrew@aj.id.au>
References: <20200916125731.784527-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9c38c586-9667-4052-66be-a6e03459068f@kaod.org>
Date: Wed, 16 Sep 2020 18:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200916125731.784527-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 839bfb9b-b496-44be-a3d8-aa897ca6fd37
X-Ovh-Tracer-Id: 4505288477939043235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
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

On 9/16/20 2:57 PM, Joel Stanley wrote:
> Reword the kconfig text to be consistent and reflect that most drivers
> are available for all supported ASPEED chips (2400, 2500 and 2600).
> 
> Rearrange the symbols the SoC drivers depend on so the menu doesn't
> appear unless you are building for ASPEED for compile testing.
> 
> The SYSCON_MFD and REGMAP options are usually selected by drivers that
> need them, so do this.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  drivers/soc/aspeed/Kconfig | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index c95fa30f1a76..9ce252445605 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -1,32 +1,36 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -menu "Aspeed SoC drivers"
>  
> -config SOC_ASPEED
> -	def_bool y
> -	depends on ARCH_ASPEED || COMPILE_TEST
> +if ARCH_ASPEED || COMPILE_TEST
> +
> +menu "ASPEED SoC drivers"
>  
>  config ASPEED_LPC_CTRL
> -	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
> -	tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
> +	tristate "ASPEED LPC firmware cycle control"
> +	select REGMAP
> +	select MFD_SYSCON
>  	help
> -	  Control Aspeed ast2400/2500 HOST LPC to BMC mappings through
> -	  ioctl()s, the driver also provides a read/write interface to a BMC ram
> -	  region where the host LPC read/write region can be buffered.
> +	  Control LPC firmware cycle mappings through ioctl()s. The driver
> +	  also provides a read/write interface to a BMC ram region where the
> +	  host LPC read/write region can be buffered.
>  
>  config ASPEED_LPC_SNOOP
> -	tristate "Aspeed ast2500 HOST LPC snoop support"
> -	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
> +	tristate "ASPEED LPC snoop support"
> +	select REGMAP
> +	select MFD_SYSCON
>  	help
>  	  Provides a driver to control the LPC snoop interface which
>  	  allows the BMC to listen on and save the data written by
>  	  the host to an arbitrary LPC I/O port.
>  
>  config ASPEED_P2A_CTRL
> -	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
> -	tristate "Aspeed ast2400/2500 HOST P2A VGA MMIO to BMC bridge control"
> +	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
> +	select REGMAP
> +	select MFD_SYSCON
>  	help
> -	  Control Aspeed ast2400/2500 HOST P2A VGA MMIO to BMC mappings through
> -	  ioctl()s, the driver also provides an interface for userspace mappings to
> -	  a pre-defined region.
> +	  Control ASPEED P2A VGA MMIO to BMC mappings through ioctl()s.  The
> +	  driver also provides an interface for userspace mappings to a
> +	  pre-defined region.
>  
>  endmenu
> +
> +endif
> 

