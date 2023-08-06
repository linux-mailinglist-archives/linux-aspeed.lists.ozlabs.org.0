Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50917719FA
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 08:04:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVSQsnl4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK5PB3Lx9z2yVc
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Aug 2023 16:04:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVSQsnl4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jszhang@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJZBL1FKSz2yWC;
	Sun,  6 Aug 2023 19:38:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D043160FE5;
	Sun,  6 Aug 2023 09:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DBFC433C7;
	Sun,  6 Aug 2023 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691314678;
	bh=eVpmHvQ+el5oYnGHhCSpJ5MEq+qn7dtrQFEijdKMa8E=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=hVSQsnl40hPx5Hzzj5zBBPn+ff8r3wDMB4k07G0sRzVhqsLlZsELCofYkyX1vHEH9
	 03ftiNg9xoj/PdueOZCPd4+FYwDyorhR9keodEEfyj9p9KA4/h9hFsiKMDTw1wM7lf
	 //8t24an4y9cxraswJL0vsj9Y8Zk5jSE5vPvdgX9dinzZrLvJvcZVXFm6si+6Nq2rF
	 1Tt8WY1cesvzjLLo4dNhnZQZE5teSMdzrfqdtaOHt49D6vcGVyzszm2dZZYrfboNVH
	 m6uPs5ND889+AtHQvdUCRX8b03lZtROnjo0oDt7LRhtMcC0TWq4ZFRWob1DxWot5kb
	 F1CL31Cx36ztg==
Date: Sun, 6 Aug 2023 17:26:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 04/23] ARM: berlin: Drop unused includes
Message-ID: <ZM9nMTHTFEY8JcC/@xhacker>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-4-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-4-d8de2cc88bff@kernel.org>
X-Mailman-Approved-At: Mon, 07 Aug 2023 16:01:51 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Tomer Maimon <tmaimon77@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-aspeed@lists.ozlabs.org, Heiko Stuebner <heiko@sntech.de>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qiang 
 Zhao <qiang.zhao@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, linux-pm@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Jay Fang <f.fangjian@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, soc@kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Dinh Nguyen <dinguyen@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shiraz Has him <shiraz.linux.
 kernel@gmail.com>, openbmc@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 03, 2023 at 04:42:44PM -0600, Rob Herring wrote:
> Several includes are not needed, so drop them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

Thanks!

PS: what would be the better merge path? Arnd take it directly with each
sub-maintainers' ack or something else?
> ---
>  arch/arm/mach-berlin/berlin.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/mach-berlin/berlin.c b/arch/arm/mach-berlin/berlin.c
> index 2424ad40190c..13d5c899f09e 100644
> --- a/arch/arm/mach-berlin/berlin.c
> +++ b/arch/arm/mach-berlin/berlin.c
> @@ -8,11 +8,6 @@
>   *  (c) Marvell International Ltd.
>   */
>  
> -#include <linux/init.h>
> -#include <linux/io.h>
> -#include <linux/kernel.h>
> -#include <linux/of_platform.h>
> -#include <asm/hardware/cache-l2x0.h>
>  #include <asm/mach/arch.h>
>  
>  static const char * const berlin_dt_compat[] = {
> 
> -- 
> 2.40.1
> 
