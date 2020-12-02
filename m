Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D712CB56E
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 08:03:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm90R1lplzDqgl
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 18:03:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nml25srv; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm90G3dm2zDqdV
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Dec 2020 18:02:54 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id p12so371033qtp.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Dec 2020 23:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K/LW+Nm7CzY8OBZABUof+7+4pClm6pGGCifwBOr9FSo=;
 b=nml25srvIDgKr6LK5pmS34VajNkmFjkz00YZSGgbSDcrSP95OpRfV4p43e7K12yNQ8
 K0tG/d4v6e6xYCWAWdcu504tuMzyM9sOXQ7dicvJwlJkVAcUjz80FdAAMxnDNcn3YhNj
 M+JDjHRebHX5h/mHmSEt97z54+MDB4ZlKFIh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/LW+Nm7CzY8OBZABUof+7+4pClm6pGGCifwBOr9FSo=;
 b=RFPs/LSjopYbKIvN3s31trfXJVk6S/yXwEt/KsgHv8LSungXCTtV+ka1tP4qnAmBQP
 iRmo07sfHe4tTgzLV28zQIAy11Fvhq0kYhFIFF5j+PNeDjM5Ft0NyOgZb+ETvadvNjjX
 ahrfAUiC6LjymLH8JYQ/rzxfU8Hf8aOuUpdkUDA7F0uYL6SNvf2M558K5fPihu6W5Gqq
 PaU7hiNbEgh0LMMZ85IJcYhpYMhT6FNnSn0W0rPxRKMS1op4Qi0ElohntyDjBBFeBhnM
 VBt27mu2AFI++iQB6ZwyYdERn2tWneduBUu559ch4mYRAl6DyzNQAXsM7RtPdnMWK57D
 nzQQ==
X-Gm-Message-State: AOAM530L6sI+7OuKjSN9+Wdi1T/UgawJtiICUikkcmeDE/pjX9w4EedD
 chn6V5jVHeOuW9z5HQM1lLCuw1WyS7vNWF+JOzA=
X-Google-Smtp-Source: ABdhPJzO8P9uYlPvdQcAIvJtcX07Y7BQWFF26rgVDS0nYTsEGEzjj1FFaVdSjTQ44wpFZcDyzJ5EkJjcaZ2Mh3e8Pxc=
X-Received: by 2002:aed:38c8:: with SMTP id k66mr1234725qte.385.1606892570752; 
 Tue, 01 Dec 2020 23:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20201202063612.21241-1-troy_lee@aspeedtech.com>
 <20201202063612.21241-2-troy_lee@aspeedtech.com>
In-Reply-To: <20201202063612.21241-2-troy_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Dec 2020 07:02:38 +0000
Message-ID: <CACPK8XeMdz70aH59zR1GjD6+r+68Y46qhreTw0AG7bzctCtxCg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add AST2600 edac into common
 devicetree
To: Troy Lee <troy_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>,
 Robert Richter <rrichter@marvell.com>, leetroy@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Stefan Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Dec 2020 at 06:37, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Adding Aspeed AST2600 edac node into common devicetree.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 97ca743363d7..fb144515f397 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -69,6 +69,12 @@
>                 always-on;
>         };
>
> +       edac: sdram@1e6e0000 {
> +               compatible = "aspeed,ast2600-sdram-edac", "syscon";
> +               reg = <0x1e6e0000 0x174>;
> +               interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
>         ahb {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
> --
> 2.17.1
>
