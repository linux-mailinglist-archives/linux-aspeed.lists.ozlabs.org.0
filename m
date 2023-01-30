Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18066803F1
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 03:59:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4tFL5BYSz3cQl
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 13:59:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=P7m8d8Vu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=P7m8d8Vu;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4tFD2KfCz3cGR
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Jan 2023 13:59:26 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id bk15so27963775ejb.9
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Jan 2023 18:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cuvuEIWvWifnWX+tS1UYLP6iIDWylaHtaPdx3s7KXPI=;
        b=P7m8d8Vu8n6QWMQBb7p50k+pVC6BEmR2mNBvda/nkiWAg+SXwQPkUAnf+RtpTGB91a
         KLD5Lg7XHB98GPiGC0W33pDX+Wttrj9Do6/FblIvC1EBy+WTQqx+2jBCcGBlubPR3mmV
         htYWs0wBIFhwhs+JVf8p0z85dRsKIIXP1mFrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuvuEIWvWifnWX+tS1UYLP6iIDWylaHtaPdx3s7KXPI=;
        b=oGi8Zs59xpwoifhdgbXFBf8Tphw8zdoFhtf7TVit7K5MsLN3oW3bfAV4/7fdJqd4OF
         AvkZmT2QfXKrdNv+4M51o7wFF4FpRi8kH2xsgk60lH50LPk6DJYsqPIWZHUEitybQLJF
         vA0uaU+TlTZ10039xk26Kl60m9XgHcKtNLOMGFl4VhKZpiRfFamB/y5XRrpzcZ4ARHDm
         Fk0pX3nqFM9nacrSc0euIWhLxivTcjXtgWJlnZz9mANU4X6IPB+BP1cPGHRq4AVIMJQe
         HzgULB7/LHcT9gftgjXvNGkoMjU8Xn4tr8kDQy/81ST19/Be/5WtBIpotNDwkDLxYyD2
         RgFQ==
X-Gm-Message-State: AO0yUKXllFsW7Xcc1hqVvS6IheqryCFv/mTcXbHFSo7B8E68Xb8d0vCc
	uO1/x+w+RwOnwosLv857ALlpPbNRzrTxl5bE13s=
X-Google-Smtp-Source: AK7set8jJbSsX0UW9Q/dgX/JZoXwGvmYuPcKHeNB3K01XA1dZgMi/vz0oqAdBiKgmfDyvC65QFwFa779jrBBAm7Vmag=
X-Received: by 2002:a17:907:2a03:b0:87f:5802:fd72 with SMTP id
 fd3-20020a1709072a0300b0087f5802fd72mr1847753ejc.237.1675047561610; Sun, 29
 Jan 2023 18:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20230119235501.53294-1-joel@jms.id.au> <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
 <CACRpkdYGG8jA9x8Hb9ByvkhFXgbyG43K=LB5F0t4hLxyXtWKjQ@mail.gmail.com>
In-Reply-To: <CACRpkdYGG8jA9x8Hb9ByvkhFXgbyG43K=LB5F0t4hLxyXtWKjQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Jan 2023 02:59:09 +0000
Message-ID: <CACPK8Xf3Nz8mZrGrwUXx9PZWp90jYwEOAoZ2giY4qKou3opn3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 27 Jan 2023 at 12:36, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jan 20, 2023 at 3:35 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Fri, 20 Jan 2023, at 10:25, Joel Stanley wrote:
>
> > > A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
> > > function's signal") exposed a problem with fetching the regmap for
> > > reading the GFX register.
> > >
> > > The Romulus machine the device tree contains a gpio hog for GPIO S7.
> > > With the patch applied:
> > >
> > >   Muxing pin 151 for GPIO
> > >   Disabling signal VPOB9 for VPO
> > >   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
> > >   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
> > >
> > > The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
> > > of_clock code returns an error as it doesn't have a valid struct clk_hw
> > > pointer. The regmap call happens because pinmux wants to check the GFX
> > > node (IP block 1) to query bits there.
> > >
> > > For reference, before the offending patch:
> > >
> > >   Muxing pin 151 for GPIO
> > >   Disabling signal VPOB9 for VPO
> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> > >   Disabling signal VPOB9 for VPOOFF1
> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> > >   Disabling signal VPOB9 for VPOOFF2
> > >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> > >   Enabling signal GPIOS7 for GPIOS7
> > >   Muxed pin 151 as GPIOS7
> > >   gpio-943 (seq_cont): hogged as output/low
> > >
> > > As a workaround, skip the clock check to allow pinmux to proceed.
> >
> > We'd want the clock on and and the device out of reset before this
> > makes sense though. We're just assuming the IP is in an operational
> > state? Was this just accidentally working because reading the register
> > in a bad state is producing 0 instead of other undefined garbage?
>
> This makes sense, can we come up with a resonable patch for this
> problem or should this one be merged as an intermediate remedy?

Andrew is correct, my testing showed that we do need to take the
device out of reset in order to write a value that sticks. Qemu is
insufficient for testing this as it doesn't model the reset lines.

We really don't want to enable the clocks just to set a value that
doesn't need to be set. There's a big nasty delay in the clock driver.

I suggest we revert the problematic patch until we can come up with a
better solution.

Cheers,

Joel
