Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0597822E
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 00:54:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xdRP3jqYzDqHx
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 08:54:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="tAZwniCR"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xdRD2T2BzDqHx
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 08:53:59 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id b29so33452721lfq.1
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Jul 2019 15:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=293HgNYyed41RovpEOe3GRTdf8e582HYxtgx4LeaxX8=;
 b=tAZwniCR0CPqi/ult8quwOe+LiEPOnK1pWoH/p5x/mp3iQzLmMmSrUg7fMjQ7j3abc
 PeCYmgFFjQhbJMuMRIF6KWG3Y5GWnVCaGcercOYI//Rkt4MMZ9VP4wUURUMSWFoHyJCW
 IEKUirZ1GtcscdHq8zp422EJAcMe87w4vkWfQ+iuFLk6UZOGinDfdBSQAoh7WUSQUmNI
 Sl9dm4D/tOBaEA2nSHG2wOllxE7ohK2FMv/LTTseUeesqYxiNAZafvWIZWQPpO0zRRJ9
 isxZ/0baSUzg1L4ny3bXBnp1AsnU1eOHnMvU/MTgGsUhO5t/DwyLtcMBqVE6td/QHqT7
 yyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=293HgNYyed41RovpEOe3GRTdf8e582HYxtgx4LeaxX8=;
 b=O1KZmUHIj5kR5ZA4VtF1+sTMM2TCA0wDYFm4vPb8sCswaoS8cQJcPLWLQvDpiHo9f0
 TrJpL7DxbXt/5rrGyoNG4CP0gdEXBMEBSANnznOOOfpw/Bxj7sOfbKdvDOabYFw3DoW4
 OiY6bsACfvLLPzSFPeJUTbDJQkGdtbPdceQJET9Ld7yLblvWWU3QGDHj4JPUyjXb2a90
 m+Wr1cLy1DtIxEar6NmFXRzD6+W7fFEo2skw8g4ttCx9yzJ7EHzOAPF0QTdYmVkxxKD8
 LdQ13Cwk2MPDoPtcPauuc2YGyJCMjX+UAIVRdUQwOEBmYF3Uhm0u0qPqNdqBLFlMaDor
 jomQ==
X-Gm-Message-State: APjAAAWwOy3QAYRxArDtqLyhuujx4e7xWWXi2UaKL9+s2PzG0ytcD4Gm
 Q58qrW1EXzAT3Py7T7FINlJTNtCIN/cauci0YVxRhw==
X-Google-Smtp-Source: APXvYqyRtXjryP5sP5m8Z9yg9JFeb+N25+DCvbf/LanaCCkR4NFm7RX6WHaYn71J41in1OzN5ZtYeqLAwNo3WAGVnD0=
X-Received: by 2002:a19:7616:: with SMTP id c22mr51039500lff.115.1564354436188; 
 Sun, 28 Jul 2019 15:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190724080155.12209-1-andrew@aj.id.au>
In-Reply-To: <20190724080155.12209-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jul 2019 00:53:45 +0200
Message-ID: <CACRpkdaJTB-=DODtj-u6bOkmy7bQ8eXoYyTqv4xK9L+cV4T11Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g5: Delay acquisition of regmaps
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 10:02 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> While sorting out some devicetree issues I found that the pinctrl driver
> was failing to acquire its GFX regmap even though the phandle was
> present in the devicetree:
>
>     [    0.124190] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: No GFX phandle found, some mux configurations may fail
>
> Without access to the GFX regmap we fail to configure the mux for the
> VPO function:
>
>     [    1.548866] pinctrl core: add 1 pinctrl maps
>     [    1.549826] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: found group selector 164 for VPO
>     [    1.550638] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request pin 144 (V20) for 1e6e6000.display
>     [    1.551346] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request pin 145 (U19) for 1e6e6000.display
>     ...
>     [    1.562057] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request pin 218 (T22) for 1e6e6000.display
>     [    1.562541] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: request pin 219 (R20) for 1e6e6000.display
>     [    1.563113] Muxing pin 144 for VPO
>     [    1.563456] Want SCU8C[0x00000001]=0x1, got 0x0 from 0x00000000
>     [    1.564624] aspeed_gfx 1e6e6000.display: Error applying setting, reverse things back
>
> This turned out to be a simple problem of timing: The ASPEED pinctrl
> driver is probed during arch_initcall(), while GFX is processed much
> later. As such the GFX syscon is not yet registered during the pinctrl
> probe() and we get an -EPROBE_DEFER when we try to look it up, however
> we must not defer probing the pinctrl driver for the inability to mux
> some GFX-related functions.
>
> Switch to lazily grabbing the regmaps when they're first required by the
> mux configuration. This generates a bit of noise in the patch as we have
> to drop the `const` qualifier on arguments for several function
> prototypes, but has the benefit of working.
>
> I've smoke tested this for the ast2500-evb under qemu with a dummy
> graphics device. We now succeed in our attempts to configure the SoC's
> VPO pinmux function.
>
> Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and GFX controllers")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes. Good rootcausing!

Yours,
Linus Walleij
