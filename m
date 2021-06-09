Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1F3A11B9
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 12:54:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0PBm67xNz308S
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 20:54:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aqmTQ4Tq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aqmTQ4Tq; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0PBj2pzYz2xg6
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 20:54:52 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 131so31103286ljj.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Jun 2021 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvIuq7yCBZI9oh+HolFFkb/f7sv15WjrCKTD1PWydYE=;
 b=aqmTQ4Tq7tp3JhjxH4GQ9HXZVvX8RRZOYwnTZqi9FwM6DNLCDlVKbHyie15+145qBI
 o6An9yE8okaeikBuxFIdZs9p4u/S/tbNX2MTXDdDPcCd7ychrX5KlcQmqoBHvyS/8y1h
 aZa2dxXYrL9EbKPIUC/kIdVAGRkxfR4+kmzpfVgiI7rkvePdrajM08ARcHhUO88/QK2O
 hdXXraH/qgd3SkAAiB+DPV3k4t8u8A70JSZe7qkIfHciR8T1SK8BsKtLhEhUMBqVjAGZ
 G60hZjGepVKScMs3xNKpAJ8FlPOv6u3jYG45jLhhpQbOIHjrSkCsCl+mSQnRSl74lJpK
 t3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvIuq7yCBZI9oh+HolFFkb/f7sv15WjrCKTD1PWydYE=;
 b=Wo5ksOKpDxKl9RB4OFyw5tVCvuxpZYnCstVY5BS8d4QIi5tfOW5mxd+NyPCH2HTg6t
 XMg4Ic9rd7k+WxDGxjzFHdO6MC64Jso8UuOQ+Ya+wfAlXadHS0pVxeJKNmVM6jL0Yup0
 ZnSSkzjlbFSKjtmRNW9LB0/wtMdqzPsu+Z57X4YiqSIw3RTxI/fpLYIQFXM9TkkGvUET
 CuwsNjg7R1irqdWc0lY10/J19iXAmEsFSkgEoGoBs8Do33EPXJoZ23vnk7RQvlj3R3rC
 pe8K+ZoX0rCsfOZ05PlJO+300ZtJIAOyC6LJlNVPVSySNJVq8t1MRed+jfmoXaRfrwJE
 tn8A==
X-Gm-Message-State: AOAM531Z0QixAfNFWKyUPN5NeWm4nVLHKA8mRoGCbQRf1zZFQwDIgn0r
 FaAPN5RZpIvHTFObLltuFEgkESKDpNgNmu11fx278A==
X-Google-Smtp-Source: ABdhPJy9jtLYPd3PIA6YsEvO5XTv5tO8NP31qTDfX0RScssCc2S2g4ub5LbPM5p6JmfTmLKacK2QOK7wOSZswNzp3KA=
X-Received: by 2002:a05:651c:1411:: with SMTP id
 u17mr11232132lje.438.1623236088374; 
 Wed, 09 Jun 2021 03:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
In-Reply-To: <20210608102547.4880-1-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 12:54:37 +0200
Message-ID: <CACRpkdZOStr+K9U9QTkAcsk4NxuSqBRVv_-9_VkGJbT69iSxmQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] ASPEED sgpio driver enhancement.
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

On Tue, Jun 8, 2021 at 12:26 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> supports up to 80 pins.
> In the current driver design, the max number of sgpio pins is hardcoded
> in macro MAX_NR_HW_SGPIO and the value is 80.
>
> For supporting sgpio master interfaces of AST2600 SoC, the patch series
> contains the following enhancement:
> - Convert txt dt-bindings to yaml.
> - Update aspeed-g6 dtsi to support the enhanced sgpio.
> - Define max number of gpio pins in ast2600 platform data. Old chip
>   uses the original hardcoded value.
> - Support muiltiple SGPIO master interfaces.
> - Support up to 128 pins.
> - Support wdt reset tolerance.
> - Fix irq_chip issues which causes multiple sgpio devices use the same
>   irq_chip data.
> - Replace all of_*() APIs with device_*().
>
> Changes from v4:

v5 looks good to me!

I just need Rob's or another DT persons nod on the bindings (or timeout)
before I merge it. Poke me if nothing happens.

>   ARM: dts: aspeed-g6: Add SGPIO node.
>   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.

These two need to be merged through the SoC tree, the rest I will handle.

Yours,
Linus Walleij
