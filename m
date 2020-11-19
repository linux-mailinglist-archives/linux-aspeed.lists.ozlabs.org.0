Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E20112B8AC5
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Nov 2020 06:17:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc7H66D3tzDqgd
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Nov 2020 16:17:54 +1100 (AEDT)
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
 header.s=google header.b=izmRNWMI; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc7H10J2ZzDqfV
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Nov 2020 16:17:48 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id 63so2289410qva.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Nov 2020 21:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pS7KdQ8JkGLBhZmDEyT+dB0u8xhj5n1AeXL63Pha2Fo=;
 b=izmRNWMIYthZ/HU5FjfWgpUBzj4kR1JnWFFMkGF9fWC8m3Bry4y2YWkKQ9kTZ0JfNy
 x9a3amTxT60ls9Yh3gdyZ3rBj2ZWoanrxWybhglwkU01JtOK0XRXo6cqVATtUuUZrWym
 8OWum+pJbyXSqxZZ24YYML/AGcCmc3nAosQgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pS7KdQ8JkGLBhZmDEyT+dB0u8xhj5n1AeXL63Pha2Fo=;
 b=VNdjedSqGAimx7kr6eTHCkzTBnFAfg/YHLc/K7QFBnnldgDdeBtvCL0hJwHfDt/C1r
 aDpqkPZte202s2Z6/ZLu0C+NOjHhFaZO347yoCiDrBe6+2goOuk2VexZMI50H+osSpfH
 nVAw9zI3gqCeZ+qCypnsAl1V7lYJ1hI96L8Xm786uyTUQBvUZFDgINznjWFJPpUp7UN8
 Auqlh9SyhgV0NHC7yK6THXdJDdyBSnm8G9NSJin7aCWDra/BOq11E4feiGmPMHMfUjXG
 dysjJe2Nv2p5uJGykZs6KaE3I//j1VkQST35kb4H5ow9kaIXH9yDq3RWJ7bEWIJQ8dCU
 f8cQ==
X-Gm-Message-State: AOAM532RiWAo2PFouz8GZER4LijwjD7m2qL46KX4xZbqE2mJmFfWEAJR
 ELR/Hapf71S+Sr7TXfh+k6PwSOCwNR+pVHbvYFI=
X-Google-Smtp-Source: ABdhPJx5L4CA73TSB0ya3N3l8FjwQz/kudIn9JyskAAXeCrGCIE68jEVLG6uaVFZcwqsCyDdVssgOLVsAX8WYXEvCFQ=
X-Received: by 2002:a0c:c984:: with SMTP id b4mr9219438qvk.10.1605763064832;
 Wed, 18 Nov 2020 21:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20201022014731.2035438-1-andrew@aj.id.au>
 <20201022014731.2035438-6-andrew@aj.id.au>
In-Reply-To: <20201022014731.2035438-6-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Nov 2020 05:17:32 +0000
Message-ID: <CACPK8XfaF_ZzhL1mQxK5Rcpkq9UmBtas+MzxJvFTFC3Bm2UGuw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ARM: dts: rainier: Add reserved memory for ramoops
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
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 802027a3c43c..8431cf1b32e6 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -55,6 +55,15 @@ flash_memory: region@B8000000 {
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
