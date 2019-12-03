Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 444DD110089
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 15:44:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S4WQ1SXLzDqTF
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Dec 2019 01:44:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="i4SZp7OR"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S4Vw3Q3dzDqQC
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Dec 2019 01:44:07 +1100 (AEDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD2E920803
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575384244;
 bh=Vb5aXB2aX+gF6f+cuazczJG4nAEA8YenYXVOkT2E0yI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i4SZp7OR5A3xUaJTwT2SQ34ZFbE8HZJAylsqj+shAJpk7PBjc0zmRBE2W2r4mttpF
 leE4RRIEGsoLvHNT51Cg9ew4RBq0WZGHbQK/o/CrxP++AGOuXC4oknzMoHXJuq8/Ej
 /yT1BIpgmwEjvZR0ytVgAtBRo5IvSqouapJkMqY4=
Received: by mail-qt1-f177.google.com with SMTP id v2so3966837qtv.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Dec 2019 06:44:04 -0800 (PST)
X-Gm-Message-State: APjAAAWvJKrOQL+l2lsX1KfibYONcHVwcBqpL7VhdjLLRq9avWcnOfo5
 wWfyOwX2Y1H/NWkJoSMqScZmWSE1GHgd/ZKp4g==
X-Google-Smtp-Source: APXvYqwtexQ5zo9ZimQeqDp9BS65TDnucMrw2I96L1AtL1jBY6DHB8RwSL6Mo2Z5PWeDgBxoOukGgcq4zG7e9CQKVtY=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr5304524qtp.224.1575384243826; 
 Tue, 03 Dec 2019 06:44:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
 <141f068d10b94413a6d0ca73fe07f8e961380e7b.1575369656.git-series.andrew@aj.id.au>
In-Reply-To: <141f068d10b94413a6d0ca73fe07f8e961380e7b.1575369656.git-series.andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 3 Dec 2019 08:43:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ8p-zs2F-mXkO_egoBtZ8WymM4O-2AaDJMZYeCFS3sLg@mail.gmail.com>
Message-ID: <CAL_JsqJ8p-zs2F-mXkO_egoBtZ8WymM4O-2AaDJMZYeCFS3sLg@mail.gmail.com>
Subject: Re: [PATCH 05/14] ARM: dts: aspeed-g5: Fix aspeed,
 external-nodes description
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Xo Wang <xow@google.com>, linux-aspeed@lists.ozlabs.org,
 Ken Chen <chen.kenyy@inventec.com>, Adriana Kobylak <anoo@us.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yuan Yao <yao.yuan@linaro.org>, Brian Yang <yang.brianc.w@inventec.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 3, 2019 at 6:03 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The existing approach lead to an error from the dtbs_check:
>
>     pinctrl: aspeed,external-nodes: [[8, 9]] is too short

This one where we have list of phandles is fixed in dtc. I need to
update the kernel's copy.

> Cc: Adriana Kobylak <anoo@us.ibm.com>
> Cc: Brian Yang <yang.brianc.w@inventec.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: John Wang <wangzqbj@inspur.com>
> Cc: Ken Chen <chen.kenyy@inventec.com>
> Cc: Tao Ren <taoren@fb.com>
> Cc: Xo Wang <xow@google.com>
> Cc: Yuan Yao <yao.yuan@linaro.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts     |  4 +----
>  arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts |  4 +----
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts         |  9 +++++++--
>  arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts           |  4 +----
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts             |  4 +----
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts             |  4 +----
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts               |  4 +----
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts         |  4 +----
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts               |  2 +--
>  arch/arm/boot/dts/aspeed-g5.dtsi                         |  3 +--
>  10 files changed, 8 insertions(+), 34 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> index c2ece0b91885..de9612e49c69 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> @@ -211,10 +211,6 @@
>         status = "okay";
>  };
>
> -&pinctrl {
> -       aspeed,external-nodes = <&gfx &lhc>;
> -};
> -
>  &gpio {
>         pin_gpio_c7 {
>                 gpio-hog;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> index 2c29ac037d32..022d0744d786 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> @@ -200,10 +200,6 @@
>         status = "okay";
>  };
>
> -&pinctrl {
> -       aspeed,external-nodes = <&gfx &lhc>;
> -};
> -
>  &gpio {
>         pin_gpio_c7 {
>                 gpio-hog;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index c17bb7fce7ff..d69da58476fe 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -782,8 +782,13 @@
>         memory-region = <&gfx_memory>;
>  };
>
> -&pinctrl {
> -       aspeed,external-nodes = <&gfx &lhc>;
> +&gpio {
> +       pin_gpio_b7 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(B,7) GPIO_ACTIVE_LOW>;
> +               output-high;
> +               line-name = "BMC_INIT_OK";
> +       };

Seems like an unrelated change?

Rob
