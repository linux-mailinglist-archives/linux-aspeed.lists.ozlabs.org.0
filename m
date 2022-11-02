Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9250B616F4D
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 22:00:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2fRv2ts4z2ywY
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 08:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JJAhyu9I;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JJAhyu9I;
	dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2fRp0ZLZz2xJ6
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 08:00:37 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso11003169otn.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 14:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WXSgV6gSBWXpZYt5R9dSU2XRI96JBuHJqksyBnzBTo=;
        b=JJAhyu9I9avCA18/elJljBaUZjEQ1AZLmiOifd0185Y3EK5HeaqP3S8tIt8gTFmmGA
         pUPV11+zpMkm8yra868gdu+JPvay5L/Opwv9NVBz2bTgI31wiopDPuGVdDBOeOv79yeS
         4wM2xoCUBswHSYlVSz0k6gih0dyDKp87PsHiT2VhdTtg84YFkXGF1EOFPpP8Y4ELfyVZ
         RKc/OhQocTKutC17cYFdo5bsOWcjqpuibRaBoG6O8Hj8QFbePWHaTtJuU/i2cE9PfSfY
         VPkhAfTwgP/OGt5nb9ZoCiysNro1ORT9McA5rRfRR9i9PAySfuTFBaiTO2OP2w2e75rt
         q7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WXSgV6gSBWXpZYt5R9dSU2XRI96JBuHJqksyBnzBTo=;
        b=aSSX5CUQMjUM4gGU0nKPkRL8Vzexqa3VB5spQ5+Cweh9dwJpQwpOubcJRjjjD6+494
         vFRVqFGqj1u0s4jhi5i4ahLSDvw8eIMPew6AX+jN4ME4/ItlLCBOwujUWtuzTlYJzzrn
         Sl5jk1imxXaELnlWF2miKX4rDYAXZkJpRmECrVG1wTeYpt/O9YYzy6TaV6v+FGY1K/ze
         TMB+zPXLkeBkfe6+xGhbBemV5GAJnnmXjTE2eEM4uhNStjDDqV4gYd8B9fToRfHwgC5M
         n5YXFmAmsf3eNLWTs0/+h+lzYxuTyUnDhsNkxdBQWUxFxNwtG9GJdEVZ6Uos5SqfMUXv
         NgMA==
X-Gm-Message-State: ACrzQf1804Guas+c3IZG/nF+ZIyzyYw+nqcCPW6dQQE06uJSvY4pNjz0
	hyRLOERY6tUF3Q7p/pq/tlA=
X-Google-Smtp-Source: AMsMyM7RqN8N0Q2iqpfM+uj7CGLUUNmPLN0Njp1cAr0gX8/yKSAoMNpTFaPaf9mD9I+AIPicd5Qs7g==
X-Received: by 2002:a05:6830:237d:b0:66c:4535:fe9c with SMTP id r29-20020a056830237d00b0066c4535fe9cmr11399540oth.30.1667422835383;
        Wed, 02 Nov 2022 14:00:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w15-20020a4a274f000000b004805c328971sm4775759oow.42.2022.11.02.14.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 14:00:35 -0700 (PDT)
Date: Wed, 2 Nov 2022 14:00:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Setup watchdog pre-timeout
 interrupt
Message-ID: <20221102210033.GA2090211@roeck-us.net>
References: <20221101205338.577427-1-eajames@linux.ibm.com>
 <20221101205338.577427-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101205338.577427-3-eajames@linux.ibm.com>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, wim@linux-watchdog.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 01, 2022 at 03:53:38PM -0500, Eddie James wrote:
> Specify the interrupt lines for the base SOCs that support it.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 3 +++
>  arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 04f98d1dbb97..b4b98bf38e48 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -410,18 +410,21 @@ wdt1: watchdog@1e785000 {
>  				compatible = "aspeed,ast2500-wdt";
>  				reg = <0x1e785000 0x20>;
>  				clocks = <&syscon ASPEED_CLK_APB>;
> +				interrupts = <27>;
>  			};
>  
>  			wdt2: watchdog@1e785020 {
>  				compatible = "aspeed,ast2500-wdt";
>  				reg = <0x1e785020 0x20>;
>  				clocks = <&syscon ASPEED_CLK_APB>;
> +				interrupts = <27>;
>  			};
>  
>  			wdt3: watchdog@1e785040 {
>  				compatible = "aspeed,ast2500-wdt";
>  				reg = <0x1e785040 0x20>;
>  				clocks = <&syscon ASPEED_CLK_APB>;
> +				interrupts = <27>;
>  				status = "disabled";
>  			};
>  
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index ebbcfe445d9c..d9379fd7b1c2 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -539,23 +539,27 @@ uart5: serial@1e784000 {
>  
>  			wdt1: watchdog@1e785000 {
>  				compatible = "aspeed,ast2600-wdt";
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x1e785000 0x40>;
>  			};
>  
>  			wdt2: watchdog@1e785040 {
>  				compatible = "aspeed,ast2600-wdt";
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x1e785040 0x40>;
>  				status = "disabled";
>  			};
>  
>  			wdt3: watchdog@1e785080 {
>  				compatible = "aspeed,ast2600-wdt";
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x1e785080 0x40>;
>  				status = "disabled";
>  			};
>  
>  			wdt4: watchdog@1e7850c0 {
>  				compatible = "aspeed,ast2600-wdt";
> +				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x1e7850C0 0x40>;
>  				status = "disabled";
>  			};
