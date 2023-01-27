Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953667E565
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Jan 2023 13:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3HBj34JYz3fFn
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Jan 2023 23:36:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lwWiN6WO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lwWiN6WO;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3HBY2lcWz3bXQ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Jan 2023 23:36:37 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id a9so5804986ybb.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Jan 2023 04:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wIQgqytbGCGnsLfE32j4FBII/PPntybaWfzlvCNe4UA=;
        b=lwWiN6WOnag9FDYNlfmanvaHGjwBm9MFXdooj5ZSLoPE48Hd3rPGiM7ki3oTnlHLrX
         mt0r9gpwkv/lTWKTNDBSxVmXDiv/vQT3R60ay3xoz/5bfCVDqpO8qGb8fDpGRofzaD5B
         8qXqHvRl+u5Ep2pneD3QvUj80okG6qoh2bGy+xjL8PTOfB8Otf/ki9qKiMMKIljKSI0e
         sP55FD6wj8t2Bep0VecAAQLSLR13LOcFPYxf0pdxwFMq8X9T39QyG1U+VnoHDen64yL0
         mVL0R7OxOAvrb9QtTFxhKucv24yT/R1cetCOuCDIrzsO/KoAMLE4gKlnVhO72oSDtJw9
         F+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIQgqytbGCGnsLfE32j4FBII/PPntybaWfzlvCNe4UA=;
        b=xJI2dRaveDOtVbQuLrjLnkHU/oieVtdRgZwcvw16FHdE8Ws/9714A0Y0ocVWMdCwH5
         7GvXZoV+Hinn7PbXKUthJDrA33+ec8ueVtzcorhkPAiBBmAgxg2By6QsjMPd3bD3fZLD
         jXwb8eX1S+PGrFAptEeMGBE1W9DCqjcciiY+WbpPvZezM0k/sCVkimxh5HSXb2/Csc4y
         ickoS9p9BuaYbuismJLpvWB+6/gLi2/19kHN/gBl3OMRLcKz0Aj5XhvdWM24UA87cTJE
         Lk2KW2RLunESISHhX/SaMVin186/mJnujCMC8uHQesbRyORairZOu6/NKp4/Qsx1GzBG
         vCFw==
X-Gm-Message-State: AO0yUKUQdvbss8XHj8NurBORXIEpjcNQk6x9xCcy32ieFEPhLmH/yCne
	b9CsrVkXzKx6FPcDhD3xMENu9K70bFiEYaQzSu8Y7Q==
X-Google-Smtp-Source: AK7set+SGlT6cS6PFZ86U9CRm3F0I0DktW1SMOReWMR7YLwEypf/V//zg3Oqk9kzRSuaCwV0xZD+IB4NPF0AgaruHN8=
X-Received: by 2002:a25:d884:0:b0:80b:66c5:9fc5 with SMTP id
 p126-20020a25d884000000b0080b66c59fc5mr1738328ybg.210.1674822993880; Fri, 27
 Jan 2023 04:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20230119235501.53294-1-joel@jms.id.au> <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
In-Reply-To: <b565b254-45aa-4f7a-b158-99fb4c66167f@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 13:36:22 +0100
Message-ID: <CACRpkdYGG8jA9x8Hb9ByvkhFXgbyG43K=LB5F0t4hLxyXtWKjQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 3:35 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 20 Jan 2023, at 10:25, Joel Stanley wrote:

> > A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
> > function's signal") exposed a problem with fetching the regmap for
> > reading the GFX register.
> >
> > The Romulus machine the device tree contains a gpio hog for GPIO S7.
> > With the patch applied:
> >
> >   Muxing pin 151 for GPIO
> >   Disabling signal VPOB9 for VPO
> >   aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
> >   aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151
> >
> > The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
> > of_clock code returns an error as it doesn't have a valid struct clk_hw
> > pointer. The regmap call happens because pinmux wants to check the GFX
> > node (IP block 1) to query bits there.
> >
> > For reference, before the offending patch:
> >
> >   Muxing pin 151 for GPIO
> >   Disabling signal VPOB9 for VPO
> >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> >   Disabling signal VPOB9 for VPOOFF1
> >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> >   Disabling signal VPOB9 for VPOOFF2
> >   Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
> >   Enabling signal GPIOS7 for GPIOS7
> >   Muxed pin 151 as GPIOS7
> >   gpio-943 (seq_cont): hogged as output/low
> >
> > As a workaround, skip the clock check to allow pinmux to proceed.
>
> We'd want the clock on and and the device out of reset before this
> makes sense though. We're just assuming the IP is in an operational
> state? Was this just accidentally working because reading the register
> in a bad state is producing 0 instead of other undefined garbage?

This makes sense, can we come up with a resonable patch for this
problem or should this one be merged as an intermediate remedy?

Yours,
Linus Walleij
