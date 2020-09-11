Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C92656D7
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 04:04:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnfG86KfczDqjy
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 12:04:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Yl5F6v3G; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnfFc3gHYzDqlJ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 12:04:20 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id w1so8394206edr.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 19:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4z2pqEFQc/fD65ZOsXerYiEysQgGTg32CxOqPq6IBO8=;
 b=Yl5F6v3Gb5Wf97Fk7b6hKKBWyB2sKMDsS9bWOdXzZtR/tMKrYB/h+bw6QqR+eMEQ4r
 o/+POFn2MJ3SMxzYnmuA9W829P1AFOY0/A3iUAQmW/UINSWM35kGr6p6E43PRX+jsdBq
 J7DnkofDASefYBN6LZYnoXbgvdBmUKSFYQBkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4z2pqEFQc/fD65ZOsXerYiEysQgGTg32CxOqPq6IBO8=;
 b=X7T5vVxSJN/7gzVFoe3jYzZfxFDnSllHq7vX4MWb/VhtJgTdm3cvujD1uKoVUsxg0O
 O1xlqBoduc2glfC8l+W7Pdrp0RH2JzHyl6JdqByYP62ludYv+dpJhE2wJs6/bcvgj2VQ
 TZhOGZaaYSvj8Zhi8cw+bd9iQo0vTvkrjkggkVD52ec8wKUUFg32ajKdGJCKNpNnp8HF
 AA0zCGvroxyc7fErAmuhqT1wt+BOleblnrnz8UsYpJYnQFCgRzALQ8mpIqwNxuUrcZj/
 xPudOWD1l/+X7gDVLLwqhtjGDPL2DH9N7qhPcofeXC5L2u+ziMynFU87IGlwXNXMx6tM
 h81Q==
X-Gm-Message-State: AOAM530zM6lFfEzlyAGu4GWCk9/mizcgmLMmE+ZP9nQ7IzyRRTS4c/B8
 yITpJh816zbOJANdeK2TOTycq0hFEYZUKzYRcNY=
X-Google-Smtp-Source: ABdhPJwVxLGtPmCtwE8CRX/qzbghy6V4fqt4VrSZ878trNfxo80v6AVlUc0HYi6YzOE52WWzoFiNpsiDSSYsKtZ0A0U=
X-Received: by 2002:a50:fb0e:: with SMTP id d14mr13074812edq.172.1599789851191; 
 Thu, 10 Sep 2020 19:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200910105440.3087723-1-andrew@aj.id.au>
 <20200910105440.3087723-4-andrew@aj.id.au>
In-Reply-To: <20200910105440.3087723-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 02:03:58 +0000
Message-ID: <CACPK8XcR72zuVTJXC840oYW9M1a=tKpn5z-4qJbv00LaA1qrqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: tacoma: Add data sample phase delay for eMMC
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 10:55, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Adjust the phase delay to avoid data timeout splats like the following:
>
> [  731.368601] mmc0: Timeout waiting for hardware interrupt.
> [  731.374644] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> [  731.381828] mmc0: sdhci: Sys addr:  0x00000020 | Version:  0x00000002
> [  731.389012] mmc0: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000020
> [  731.396194] mmc0: sdhci: Argument:  0x00462a18 | Trn mode: 0x0000002b
> [  731.403377] mmc0: sdhci: Present:   0x01f70106 | Host ctl: 0x00000017
> [  731.410559] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
> [  731.417733] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
> [  731.424915] mmc0: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
> [  731.432098] mmc0: sdhci: Int enab:  0x03ff008b | Sig enab: 0x03ff008b
> [  731.439282] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [  731.446464] mmc0: sdhci: Caps:      0x01f80080 | Caps_1:   0x00000007
> [  731.453647] mmc0: sdhci: Cmd:       0x0000193a | Max curr: 0x001f0f08
> [  731.460829] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0xffffffff
> [  731.468013] mmc0: sdhci: Resp[2]:   0x320f5913 | Resp[3]:  0x00000900
> [  731.475195] mmc0: sdhci: Host ctl2: 0x0000008b
> [  731.480139] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0xbe040200
> [  731.487321] mmc0: sdhci: ============================================
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 5f4ee67ac787..94ec301ceb73 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -179,6 +179,8 @@ &emmc_controller {
>
>  &emmc {
>         status = "okay";
> +       aspeed,input-phase = <0x7>;
> +       aspeed,output-phase = <0x1f>;
>  };
>
>  &fsim0 {
> --
> 2.25.1
>
