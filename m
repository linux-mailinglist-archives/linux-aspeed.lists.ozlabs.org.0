Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB44BD6D2
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 08:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2DZl6pYrz3cB0
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 18:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z06LCpgN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z06LCpgN; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2DZc4nPyz30Mn
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Feb 2022 18:34:14 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id d7so29910011qvk.2
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Feb 2022 23:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R4B6JGXR6mvZF1952Vke43JV0QR66SxjuMutQVOsFo8=;
 b=Z06LCpgN2MVimjjFUlm3IrOc0bB63t5ON0LGaE4naFFq5j3x0jb78evJj8rax3eWP/
 wgLsdIlXGADTXtwIZOPQPKaJFEYfYXwgtZ5UOBJuzO2T8WAjlN5DomYW9eZL93ICBZT8
 yimSlEUKhwEw4f1FPbp0zK/EwW0EF/4JAD5uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R4B6JGXR6mvZF1952Vke43JV0QR66SxjuMutQVOsFo8=;
 b=1uWzjRGcW2KOsc+rFNGzojd3VqVrJv/m+CoO/fDX7kULs37uqLoGvdo4TfM4nCT55A
 9fPErgMQgjlb4PlwpTZMCMcQ68IN5CwnwqXNaADh5+qdc9ktr9DaT7ftV5p8MJtfNy5z
 oPdcoPvq5mlwv1iSv//+RdR/Bp8SG/fDk7WQqVqBopkjg1+6kuRYkOx8oNdUMqVlM5g9
 lPQGtRVzOO3TxtMINqE5uS162idM64vkJZucbUCuOkYx/Rt0Xbhk3dVJBmHwHEKzahS1
 P4Adoi2cOCu3q/Jg4mV3npGXvCxpppx1CXC934gIXZgymK1V3teIlSsX94yAH+lV2fQz
 zgpw==
X-Gm-Message-State: AOAM533lRvJW0mxhyh/s95MZHmREBwxf1ElPVoyVxg/M4EEKnitflx5Q
 Rah7KmrnFTt7EuiLYQIqOTLeWZR2UVzFkuGDo+M=
X-Google-Smtp-Source: ABdhPJx2pPvLE2lY8PhsDFi43EexUA016GTtes5KYX0xv/HLHfxhIxLOM/pn0HF05x8GWnFK30iX+BejJZ2bFcsMSdI=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr16728455qta.58.1645428851531; Sun, 20
 Feb 2022 23:34:11 -0800 (PST)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
 <d2b85ad7-aef7-6088-03f5-cbd6e0bcab5d@kaod.org>
In-Reply-To: <d2b85ad7-aef7-6088-03f5-cbd6e0bcab5d@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 07:33:59 +0000
Message-ID: <CACPK8Xdvns7PK9t1ZutAbkJqhb5eRcoWCDySQGsfbtLv+XMvqQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
To: Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-leds@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Pavel,



On Fri, 24 Sept 2021 at 06:41, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/21/21 06:39, Andrew Jeffery wrote:
> > Without these patches the driver limits the number of pins exposed on
> > the gpiochip to the number of pins specified as GPIO in the devicetree,
> > but doesn't map between the GPIO and pin number spaces. The result is
> > that specifying offset or interleaved GPIOs in the devicetree gives
> > unexpected behaviour in userspace.
> >
> > By always exposing all pins as GPIOs the patches resolve the lack of
> > mapping between GPIO offsets and pins on the package in the driver by
> > ensuring we always have a 1-to-1 mapping.
> >
> > The issue is primarily addressed by patch 1/2. Patch 2/2 makes it
> > possible to not expose any pins as LEDs (and therefore make them all
> > accessible as GPIOs). This has a follow-on effect of allowing the drive=
r
> > to bind to a device instantiated at runtime without requiring a
> > description in the devicetree.
> >
> > I've tested the series under qemu to inspect the various interactions
> > between LEDs vs GPIOs as well as conflicting GPIO requests.

> > Please review!
>
> This is simpler than the 'ngpio' business we had before.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

I saw that you recently merged some LED patches. I was wondering if
you could consider this series for v5.18. It still applies cleanly,
and we've been running it for a while now, so it's very well tested.

Cheers,

Joel
