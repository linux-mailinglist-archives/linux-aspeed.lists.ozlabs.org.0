Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCBB44AC3E
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Nov 2021 12:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpQ8T0xX5z2yQw
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Nov 2021 22:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KUI62Pd4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KUI62Pd4; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpQ8N1fSRz2xtP
 for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Nov 2021 22:03:46 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso30292023otv.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Nov 2021 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cde9sTeLd0vmgQnDHFOawLma/945mJa1LBSD0r3d4s0=;
 b=KUI62Pd4Hj8HYSVaTZVhn3KQ/1ACqdRRbXUCxDm7Cl8VDNJ30jya31vSmTFZoNbTqZ
 alW0aZBNZ6y07fcs1h/IQ76exO8Tt+nUWG1WLdpjZXJzbv7JBbkb6Th0s6hutWHTMJul
 zNpfutFxzNwYz5uCgG6ipTjXUBqGZwv0pPQhMTLUoHB/kgUresoM+UTy0SXno5zo4vnr
 KpufGMJgF7Sk3SuTLYslA+Oa1Dq/gzdkM0jNnr/+O7z/76BsdwzbRGb2HJtr2gdPTcuG
 GjbBl9U35n20sIBbapohjJXCfJYxQoczB9QGluiaDkmhQEyS+U9OT1rRoyV7/1LookLj
 DINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cde9sTeLd0vmgQnDHFOawLma/945mJa1LBSD0r3d4s0=;
 b=QS94+QjuhmJaf55Hk/kryNoBVwwQpWr8oMtY9H1+H0msBTIFvVib6J62ek7qIAf4IF
 bmyiOvBtRlk1lJW6PNWKEmt7oUi9JIGs8yyo9nNYlIj3jxA97SmLI4kcmwDvIRvthlOU
 E1OvWaZp3OCk0VFEqskIOBssnTvlBbpUOEhgNu/9d6Z+PNnug7+H1ipiWVQHEKwQbpXC
 4phH15AI9LxrJeJXDMIoUiGmtc3SPxHlXkFIv4JIfTf8/wRTgqNasndQofTK3fnjjZAQ
 hGMEovU6pHZmbCq6vQhVC7so4Uf82cQSt9YU/5r3MMu8rQ+y1mfshi2WRXpYkI0c4n5e
 MYfw==
X-Gm-Message-State: AOAM531ySl/n62Abtsu6pS9zqCkjLxz4HdolHZau1uku1m9DUKlvTXXL
 YpuIVAau95wvbz9hBuSeyv4x/3q6iIWmwjsGPbJYHQ==
X-Google-Smtp-Source: ABdhPJwQOh0weKMLmGhNanRSWouIAcQ21jLyTUZlfQlEatdYccM7AhIWTjH/d9ZVCzYfYnSdy1TMVoeQKsf8ytpQYFs=
X-Received: by 2002:a05:6830:2809:: with SMTP id
 w9mr5110934otu.237.1636455821654; 
 Tue, 09 Nov 2021 03:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
 <20210921043936.468001-2-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 12:03:30 +0100
Message-ID: <CACRpkdZRWzq_j_UsU+eZurv1wT7muB1V4ktui1-Q0mHV3xw58A@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds: pca955x: Make the gpiochip always expose all
 pins
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, andy.shevchenko@gmail.com, robh+dt@kernel.org,
 clg@kaod.org, pavel@ucw.cz, linux-leds@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 6:40 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The devicetree binding allows specifying which pins are GPIO vs LED.
> Limiting the instantiated gpiochip to just these pins as the driver
> currently does requires an arbitrary mapping between pins and GPIOs, but
> such a mapping is not implemented by the driver. As a result,
> specifying GPIOs in such a way that they don't map 1-to-1 to pin indexes
> does not function as expected.
>
> Establishing such a mapping is more complex than not and even if we did,
> doing so leads to a slightly hairy userspace experience as the behaviour
> of the PCA955x gpiochip would depend on how the pins are assigned in the
> devicetree. Instead, always expose all pins via the gpiochip to provide
> a stable interface and track which pins are in use.
>
> Specifying a pin as `type = <PCA955X_TYPE_GPIO>;` in the devicetree
> becomes a no-op.
>
> I've assessed the impact of this change by looking through all of the
> affected devicetrees as of the tag leds-5.15-rc1:
>
> ```
> $ git grep -l 'pca955[0123]' $(find . -name dts -type d)
> arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> ```
>
> These are all IBM-associated platforms. I've analysed both the
> devicetrees and schematics where necessary to determine whether any
> systems hit the hazard of the current broken behaviour. For the most
> part, the systems specify the pins as either all LEDs or all GPIOs, or
> at least do so in a way such that the broken behaviour isn't exposed.
>
> The main counter-point to this observation is the Everest system whose
> devicetree describes a large number of PCA955x devices and in some cases
> has pin assignments that hit the hazard. However, there does not seem to
> be any use of the affected GPIOs in the userspace associated with
> Everest.
>
> Regardless, any use of the hazardous GPIOs in Everest is already broken,
> so let's fix the interface and then fix any already broken userspace
> with it.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
