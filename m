Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D8839713F
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Jun 2021 12:16:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvSkZ2b8Bz2yxm
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Jun 2021 20:16:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sl+L5T4g;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sl+L5T4g; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvSkS6rdRz2yXZ
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Jun 2021 20:16:46 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id q1so20948719lfo.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Jun 2021 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JgJKLG77oA4fsPfmhV/22/+J8paV7JGFmptd3FIW44=;
 b=sl+L5T4gBDijTK/6PvXm02T1i8WN8JiAWYOScypKiijXgVP6N1crIeVt+wWGBXXFDH
 3bj7Vv2phMrmsLD6ekzlzlzgtg2MgXSKL/DL63Y3EGZnDOsTqKgLIRO7b2umrlTw7std
 GWGZhhGmbTAdUS6Dv8FSjCuGB7AjPT0R9XNIoF13jT7jKHHc1epZX0edVkf0ldfOuGMo
 w0hFrTRebe8kTg5hCXmkUHuC/HgJQqiM6NB06D1hzudz1sJotMH4RxG6uEuf/CvkMs/+
 oQe44XFiI/94UDn7W448kquuUxis6Cae4rc3z8SkQmHKh30VUpteVsP4C5Lh02HTEguu
 g3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JgJKLG77oA4fsPfmhV/22/+J8paV7JGFmptd3FIW44=;
 b=CtYu6HmLpdeU6yjxL0ndjM+EpUCwTxEeHoWJDwmMt32H2yunzmwicf6A5VNjyW/S/J
 eDu6I/FO2GFPHQ35YG1nXMDtnbuY9rhZqRmbgcYfFVoA7P0D7Q1Obbo4hRsJAGRrPpM2
 m+Ls1Ze/B5DuWz0PCoYXO6psqR42oY7avzBWDN711Vlf9n6Ir1OhV715+81ebNl61UB7
 mN6wWFLhOwag8hWVOHU8K9o6wJ2oRLUladQdvP8rGZgFY4TXXh9kW1NSf7VkOJ/qSHgB
 bScMIMHGKjkIXc9+u9G+g2IrnzrMjIUZN87uiriuPAWHwdvrGL3JS+deIHaBsHy6Ib26
 HdCA==
X-Gm-Message-State: AOAM530nh5U/oQUzVveUh0SL3yVAcTvn6RnWLShuu7RZE6VPkhBAkVXN
 rAk/0k6HSDPAHGIfoxT5Ho/N7wcWPJ8wJqosZmf4lA==
X-Google-Smtp-Source: ABdhPJy/xrCcERW+957lXcvVNGT5zyGBGdADRSZbatHeuqcKcxbF4gcIYsCn4wfFQ5npF9r30qUpQIoF7hiIHQTgIxE=
X-Received: by 2002:a19:5503:: with SMTP id n3mr9973147lfe.649.1622542598494; 
 Tue, 01 Jun 2021 03:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com>
 <CACRpkdZFcFuT9rdrc8BfEBmhy0--9uLMSJWfr=A+nU117_BT8A@mail.gmail.com>
 <20210528040934.GA28403@aspeedtech.com>
 <CACRpkdYnvzOW_86QgLAsNpNXWZXpaMiE7g9_jHZ0ZsFyhOjjAg@mail.gmail.com>
 <20210531052318.GA3973@aspeedtech.com>
In-Reply-To: <20210531052318.GA3973@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Jun 2021 12:16:27 +0200
Message-ID: <CACRpkdbq5me7erKdzaDHrPP5QjY4-Oxqz20tg2rSn3yrWDrhYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings to
 yaml.
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, May 31, 2021 at 7:23 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> The parameter max-ngpios is the maxmum number of gpio pins that SoC supported,
> ngpios is the maximum number of gpio pins that sgpio devices(e.g. sgpio cards) supported.

When you put it like that you really make it sound like you already
know, just looking at the compatible string, what max-ngpios is?

I.e. do you know for these three:

aspeed,ast2400-sgpiom
aspeed,ast2500-sgpiom
aspeed,ast2600-sgpiom

the unique number of slots for each? A 1-to-1 correspondance?

Then just add code to set this value from looking at the compatible
in the driver. You can write some text in description in these bindings
about how many slots each SoC has but there is no need to add any
extra parameter if you already know this from the SoC.

Yours,
Linus Walleij
