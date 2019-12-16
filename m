Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996F120598
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 13:29:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c0v41rLWzDqT6
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 23:29:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a43;
 helo=mail-vk1-xa43.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="S/B9vSxt"; 
 dkim-atps=neutral
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c0tk6szMzDqSk
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 23:28:45 +1100 (AEDT)
Received: by mail-vk1-xa43.google.com with SMTP id d17so1187052vke.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 04:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QaoPgwh2xfV295jRIGnmPYl36fDZZNdnkiloN5hh4CE=;
 b=S/B9vSxtl+yCUJ5TJtpNk2Stv/n4pxJen2cvthe3ynAP3s2fdfTEDf3tZomPyz6/ti
 c56rzuxM4QAB6cX1SwuBlhogEMIItrAmGHHi3ns9bmKzWiSCvIoPoAQsE6LewWidcSt/
 uS/ygBA6WwzxnYrECvxR1yO2wGs7T55an3bXKgv1VII9O7KQetwebEVFyS7PP5o5JG8Z
 WXw7M3EFBu/VJ44dxGgmBl8Gz7OGufeX8UpyQueudgpm0MdnhWFUBNsCWFzcddS22VKX
 sPNZI3c8eaEF8pJD1EuxwIwS1BAOsagfTF+6dyoXqycYB/nk0NUuEatN48eLbR9wzjR0
 GqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QaoPgwh2xfV295jRIGnmPYl36fDZZNdnkiloN5hh4CE=;
 b=Ixj6dK157JztasoDCBUQ2GQRhMyINUoUyeS4r1OBG0LoH5b1xxBF+3q80OtzftbUSs
 82NnW6Z+VLu0awqB4kkpeo/oTZFNmY2HF4C0UCe4HLC+dtOTNtTSrVqNz38MW1W92/yB
 jifVXzkYhVCirulopWxG4YfH4BrJhFV0JzqrBPAAQe4Wfq5vEHsLaO5GV6FUw2KAIdF5
 oqmuj0iBLV2WyL9t1dhz7+7KV4JiFHCau1tDPf7eMAqFK6Z6/5ExMD1ywAHjI//6O88C
 blU8MOFimO7Jg2hfPXlhamehpEm4+zy7cCPb8/vstud827NQpbs5xwfaBaiNy6g4QMzl
 SWig==
X-Gm-Message-State: APjAAAW7g3wNVMpUypZMol5aKh9UWSYcpYeS5F0ywSOAq/L4ItvHPOZO
 l0WgK9IcIIQ65zKTR2U384mpzk9J6mirIL3U5YW65g==
X-Google-Smtp-Source: APXvYqw/AlQK61lzoibi6xl6okziErleCZ8cs/LBZLmTMrBvWdsoY+o2BjyAVo3CYVnu+ks556/YdO+EFNqOolU0srg=
X-Received: by 2002:a1f:fe4e:: with SMTP id l75mr24217758vki.18.1576499321815; 
 Mon, 16 Dec 2019 04:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
In-Reply-To: <20191212162152.5uu3feacduetysq7@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 13:28:30 +0100
Message-ID: <CACRpkdbkiQLmyxHG4mAOqOho34UkUZwctRwsUgyJKCgZBOUEvQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
To: Marco Felsch <m.felsch@pengutronix.de>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 Mark Brown <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 5:21 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> On 19-12-12 16:10, Mark Brown wrote:

> > Note that there's two bits to my concern - one is if we should be using
> > gpiolib or pinctrl, the other is what's driving the input (whichever API
> > it's configured through) which didn't seem to be mentioned.
>
> gpiolib or pinctrl:
> I pointed out all my arguments above so I think it is time for Linus.

I think I've elaborated on this?

The API is fine with me, because this thing does some autonomous
control and I don't know any better way to share that same line
with the GPIO subsystem than to make this offset available to
the regulator driver.

Yours,
Linus Walleij
