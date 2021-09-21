Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E14B413336
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Sep 2021 14:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDKyn0kRNz2yNp
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Sep 2021 22:11:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PP3MVhD0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PP3MVhD0; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDKyg4LNzz2xYJ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Sep 2021 22:11:05 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id j13so73302062edv.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Sep 2021 05:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gnHp9W9tpMJ93FgjbDcsYJnMdjBLWakKWF+667XwxdI=;
 b=PP3MVhD0mKRRrDh5TRhcjFoqsMzxsRG2tmeqli/gck9GjyjeHa62pOsEU2mKfFXtTV
 8hroET+GkHlGegL2astWVuKx+u++I6NikgAAJuYzMm7i70ZHcc6M+Nh7BNgNQvxPKB2j
 +cwbedix3zwQn+pRPQMxhmwS5ABmmpS5v1wO6GJDA0sWr4HusVAWopbFqwwFpuETQ+vG
 mrWdqhJkVks8Rdm5RoQqhWbdh0x2A4j32xHAXPQxscK1JFsUvA71pHOSSKDf6JIfATJv
 p8knOZotQlHXD9rK/IFffLpF25KlU/EQK5xgx0VZfRa6RL0nLoifYbgHPuw/Ko/C0Fmo
 jeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gnHp9W9tpMJ93FgjbDcsYJnMdjBLWakKWF+667XwxdI=;
 b=6vcGcsK9vGUEP5Qhg39sTST9PrXNmCXCdEUCkUkFebn++h4H/fIL1Wz3+n/8CIythA
 PgYBO9ZzP1rcOj4aOgwjA14LzO8TEGgi1NK1iO6as27ObPK9ZqawlrsS8Izr4cvb77Tu
 mVot3WfIoUUMSvecTEQJy+ZoI6l7H6CUZyKdwSBnYDaxbcSuqef0yQNt41eG7BS+n5lr
 xqqeg9Pl7W5eqDOyD2LzQWOZ5o6FQJRg+8usKt+0ji8/TZ+E7c6c/cVlPsnD5nZcXOAS
 rjRMe387xGWelWE2WDRTpgpPTgtS/Rg8hWtc/cupb5fe79A0N6NPQnWsgoKGSCKHgMxk
 keqw==
X-Gm-Message-State: AOAM530I0yc7leOxSM7eE9PDTdL4KNHyEEycdPlGM2po9m0CUA4qtRbN
 4M0SY9hTz/OIxrRBtgs/o4jqP1KVN/JOswYi9fI=
X-Google-Smtp-Source: ABdhPJz9F95jhhbvvfmN1NpFh1Avay80Hhpiq+1bFUNsLNPgvaC7MxatoxjIUL69w9lL0hjJbRKQEKrb6WeN/Jawc+8=
X-Received: by 2002:a05:6402:358a:: with SMTP id
 y10mr34397150edc.238.1632226255997; 
 Tue, 21 Sep 2021 05:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Sep 2021 15:10:18 +0300
Message-ID: <CAHp75VfzFh4Tp5-P-p-6=Oafd=xhQAL5i=XC5PUXedd-fVWz_g@mail.gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 clg@kaod.org, pavel@ucw.cz, linux-leds@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 7:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
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

Thanks for the rework! Briefly looking it looks very nice to me, hence, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

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
>
> Andrew
>
> Andrew Jeffery (2):
>   leds: pca955x: Make the gpiochip always expose all pins
>   leds: pca955x: Allow zero LEDs to be specified
>
>  drivers/leds/leds-pca955x.c | 65 +++++++++++++++++++------------------
>  1 file changed, 34 insertions(+), 31 deletions(-)
>
>
> base-commit: 239f32b4f161c1584cd4b386d6ab8766432a6ede
> --
> 2.30.2
>


-- 
With Best Regards,
Andy Shevchenko
