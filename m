Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355D2B8AC8
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Nov 2020 06:18:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc7Hc619ZzDqSn
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Nov 2020 16:18:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TKzahsrN; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc7HW3rQHzDqSn
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Nov 2020 16:18:15 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id x13so2289026qvk.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Nov 2020 21:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OqZSptQt27MJXF+QZPVZ7r04kV7IR2mYe4GqqPa6IEE=;
 b=TKzahsrNBrqKjnKyDEivIbVJkMZS8RSwV+0GvMgueNjzBlMPDIaREBkYIDjwypWiT+
 QhlRvpGGsMXvrM09LdEh+CiAF2BU8+mUSRJP66L9xoi38ariG+czv6aPlQkvbWxDSo6e
 /vmLVCVISKYw4gUvl0iHqdP+g2ZKdrxDwlBvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqZSptQt27MJXF+QZPVZ7r04kV7IR2mYe4GqqPa6IEE=;
 b=a25frLZzcEw4jjMj+IjDfWSTKyYJUN7QDzd8h+XO1yngRdMKN12O4wFBida0ZGUlKD
 0pa8MmWQoDdXaOJB3FiIz88WegUjbzbUy64ow5bqbURNbUq3rHXkftRWVxJxfxkU0pPU
 jDipr40X2rv210eQukDytr0FWPZVornVHUkzptoZC1GlJs4i+GiSI0HgMlYd0ch020oc
 X91jhU11b138Ecu6i4QTp9nNrQpEOA+ju/54sDnA3mD+sHPe6ROs7DGPFfraBR7tLcGQ
 V2aIMBVunzmdqP361NW0By0rPMN8Qh5zF7qVNR4Ey0QBeey8KFIlxWjDM2+Vjo7d81cQ
 YHJg==
X-Gm-Message-State: AOAM533hQvTgG7+cy76HwOAIAdsNNxN0i9XdvA5RnQW9lAzEGWQSF4Jc
 d6RNLbswhLsRjHb543maE3DZpbfR+aAv/wFuDsQ=
X-Google-Smtp-Source: ABdhPJw/SAZ1gn3TFv6uB9mAMXTyHDmcqQqrp9QINmtcapIeeLWmWk6j34yHR/RZuXmPgs7hMBWrUoKmp/tl4N3D2z8=
X-Received: by 2002:a0c:aed4:: with SMTP id n20mr9290736qvd.16.1605763093184; 
 Wed, 18 Nov 2020 21:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20201022014731.2035438-1-andrew@aj.id.au>
 <20201022014731.2035438-7-andrew@aj.id.au>
In-Reply-To: <20201022014731.2035438-7-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Nov 2020 05:18:01 +0000
Message-ID: <CACPK8XeU866qVx4hdv4s9ZM99WoWDL9Ek+SBbOQMqTsxV+8Hdg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ARM: dts: tacoma: Add reserved memory for ramoops
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 22 Oct 2020 at 01:48, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Reserve a 1.5MiB region of memory to record kmsg dumps, console and
> userspace message state into 16kiB ring-buffer slots. The sizing allows
> for up to 16 dumps to be captured and read out.
>
> Set max-reason to KMSG_DUMP_EMERG to capture bad-path reboots.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 09b561429579..04efabe70d9f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -34,6 +34,15 @@ flash_memory: region@b8000000 {
>
>                 /* 48MB region from the end of flash to start of vga memory */
>
> +               ramoops@bc000000 {
> +                       compatible = "ramoops";
> +                       reg = <0xbc000000 0x180000>; /* 16 * (3 * 0x8000) */
> +                       record-size = <0x8000>;
> +                       console-size = <0x8000>;
> +                       pmsg-size = <0x8000>;
> +                       max-reason = <3>; /* KMSG_DUMP_EMERG */
> +               };
> +
>                 /* VGA region is dictated by hardware strapping */
>                 vga_memory: region@bf000000 {
>                         no-map;
> --
> 2.25.1
>
