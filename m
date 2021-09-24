Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4420416AA0
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Sep 2021 05:49:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFyhM2qMZz2yyK
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Sep 2021 13:49:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bL87uALh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bL87uALh; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFyhG6zy2z2yNv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Sep 2021 13:49:18 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id t13so2431988qtc.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Sep 2021 20:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aeqPl8lRAJi/jngCXcVyekAXBb4CJKVOEfw9KCRibJE=;
 b=bL87uALhnZQ7xyPEXWDW+jMNYZp8S1nxJnEOCde4kDE2gW+iIKz1JpNCa8ITDhxB4+
 vxSC6lBz8iFjEU1lWVimNSvB70bTO+uHyq/8juHZ2lM9KnsmHh+ntXKCa9cowFJ7mciB
 gKG7YAO2bN9c2+K1TtAvImHkI6wTRX8tVt7pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aeqPl8lRAJi/jngCXcVyekAXBb4CJKVOEfw9KCRibJE=;
 b=v1gpk7CEHtu6Nq0DWxsOZtRz5kGNXIPrU6D1k0dR6COICLPsRL8olqq3pkVo4nQ87l
 wMGih8t2fHalbvnPvjhK3DVOH9EvdYymQZcxPoBPD/n0Ws5eMQfXHa7GeWCUfObbaVE2
 TZL1mRjZN47f//S+789XCXqSt0aBNpes3hXxfyf2X3T1xseS9UuGpCD+y7uj3HxPOPuY
 V1Hg6+f8lJsvFv0bEUiKXTtwBdaOR0q1GbSM1pBbjx3qAHOSxIbNKWtstyxfB0PhI/G5
 jV6DHhlNvKMoAzYyXeylD7hXHLax0oLEUadnbqHvKaXws6QnHU/pXZbRgJamDGOvF2ml
 Eytw==
X-Gm-Message-State: AOAM532PtD7nAVhYWcUgY2bOlU3aQEv7GXFP/vZkvtZxFyKoys0kpTgx
 oy+OgFa52PXItjrHAgZvHvz9P4tbi8/V6f2n9bk=
X-Google-Smtp-Source: ABdhPJxpnTgNiXHwv0NhWyHlGgi4NFqri8IWBT5HGvaXlbmezTaEoOzlqXTHAWdP3EPM4UyatB9FeyfhDIuRLao8CAU=
X-Received: by 2002:a05:622a:45:: with SMTP id
 y5mr2109484qtw.145.1632455352824; 
 Thu, 23 Sep 2021 20:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Sep 2021 03:49:01 +0000
Message-ID: <CACPK8XdTCfXVqDnBHcmbp4Zy=UKW5pZGAi1eiiDsUwu6=_+sig@mail.gmail.com>
Subject: Re: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
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
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 21 Sept 2021 at 04:39, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This is a rework of a Rube Goldberg-inspired RFC I posted previously:
>
> https://lore.kernel.org/lkml/20210723075858.376378-1-andrew@aj.id.au/
>
> This time around there's a lot less Rube - the series:
>
> 1. Contains no (ab)use of pinctrl
> 2. Always exposes all pins as GPIOs
> 3. Internally tracks the active pins
>
> Without these patches the driver limits the number of pins exposed on
> the gpiochip to the number of pins specified as GPIO in the devicetree,
> but doesn't map between the GPIO and pin number spaces. The result is
> that specifying offset or interleaved GPIOs in the devicetree gives
> unexpected behaviour in userspace.
>
> By always exposing all pins as GPIOs the patches resolve the lack of
> mapping between GPIO offsets and pins on the package in the driver by
> ensuring we always have a 1-to-1 mapping.
>
> The issue is primarily addressed by patch 1/2. Patch 2/2 makes it
> possible to not expose any pins as LEDs (and therefore make them all
> accessible as GPIOs). This has a follow-on effect of allowing the driver
> to bind to a device instantiated at runtime without requiring a
> description in the devicetree.
>
> I've tested the series under qemu to inspect the various interactions
> between LEDs vs GPIOs as well as conflicting GPIO requests.
>
> Please review!

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
