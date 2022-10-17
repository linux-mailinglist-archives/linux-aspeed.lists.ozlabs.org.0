Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA880600BC7
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 11:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrXXG43N3z3c16
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 20:59:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MUHWuYJa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MUHWuYJa;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrXW425Sfz30JR
	for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Oct 2022 20:58:21 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id bj12so23586769ejb.13
        for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Oct 2022 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B/Byge+Vue4J7Z80ANz5rsyrsoG83IPzp3UARO7F6/s=;
        b=MUHWuYJag6UdIGNJWiJWxn8WAAZ42CXEFTnECn+6skOIqg/uauJYEVg974vMd9sMEk
         zE6zI7z18arTxzgN6sTudVQN0HH06/PzZJ+4X18m75Vy/bF7X3X+fEqiRAyn7cwpLeMe
         1S3Gkx8o3vO463r4qBmru/5P+HeV+QtYD7XFaMKTFQkBKEINKik6GSXOIGd4TakIzo/y
         22NV5ZvkVpf1kqoQWmMXugwEs+G3K/F00qz0J2gsZD0tyQrxzJVUb1Rv0OE2tl8BfDdT
         1Thx86QUb3Eo9BPHEOAqRcLadLrkm9xIrIOP9q0Nx+T+iVZxfi/eZSxmcD7GZQwM5l3C
         f6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/Byge+Vue4J7Z80ANz5rsyrsoG83IPzp3UARO7F6/s=;
        b=FHwnnAQtJ4j70HHMJbdhswtQc6x6XnbvXC+0H3Mh+RtHFR/IHfdRJgCyjfpN7yFGpK
         rYNDI+ayFFizfnn6b3pS7KAh13sk4zSWJn86VqU99WDmZMSeqtyT74j4KIqA2zukwVt2
         RZIC3BM8j1r4m8pErhG1bAWCEZx/mEiVLl56IGZ8Pxb4aou9hyNW7V1eQMlAxaeSs3nF
         jIgZyLKMeDDwsI+Y11/adYNh1zE2lk+nR7xAQhKc5NMV8ZjmUpVy/zznHnHRpHZ7ylTl
         bc1yD4FcTkioUKKsBMFzLxMNLtlklavAuetZ+NddOoswfEcuB7tGk2qoZwqEUEIEdrFY
         5VBA==
X-Gm-Message-State: ACrzQf3QZzPtMlo8PSeN8GwZ9v2yloSlLC5WLz7EG9aJsjDIuEQgdNxO
	XplVV4kwWEge1BtmvtzJaU+i130BuhT28BofpNgavA==
X-Google-Smtp-Source: AMsMyM4L0M6bcj2Wvh4KRdD8EKd7M4z6+eLVjZHPl1MFPGYp6JqekMO0KaAEpqZ8kDbWIS4EMUIR8qxcTy8qHdB2D/8=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr7556783ejc.690.1666000695069; Mon, 17
 Oct 2022 02:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com> <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
In-Reply-To: <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 11:58:03 +0200
Message-ID: <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Oct 17, 2022 at 11:27 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> > On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > than logical. This series is basically out of two parts:
> > > - add missed headers to the pin control drivers / users
> > > - clean up the headers of pin control subsystem
> > >
> > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > of the pin control.
> >
> > Aha I see you want to send a pull request so I backed out the applied patches
> > from the series for now.
>
> Can I consider all that you answered to as Rb tag?

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I haven't reviewed in detail but I fully trust you to do the right thing
and fix any fallout so will happily pull this.

Yours,
Linus Walleij
