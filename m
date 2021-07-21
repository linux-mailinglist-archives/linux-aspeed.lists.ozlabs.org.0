Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DEE3D0F7D
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Jul 2021 15:28:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVGcF6588z306g
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Jul 2021 23:28:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=lfuTg9AW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::b32;
 helo=mail-yb1-xb32.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lfuTg9AW; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVGc84KDVz2yM5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Jul 2021 23:28:06 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id k184so3222525ybf.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Jul 2021 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MAafdB8maEcxAt7X4aari+TcZmDheDXHSryvpJebCSE=;
 b=lfuTg9AWFswlPJLywoHYJK1agsZpv6/T05aDWoVWngTAAT8PURAoKP4BvhuWDegYwm
 vbyWOypf9xXj4Eka8iqW66c4ICKcLvZ1GaZU9OHYPqXx+phQsBqMmBtMuGNm63DbbQ2R
 tiQ2TmwqRwE25YRB7yabtogkuJoH53yd1eoV7j6SPdismGUzX0KcG3GqdFFbeKNDSr0C
 5VW8VOEtldwEL51DqtvM30NXemVgS42Gimleq+MHwlIy20A9WG9R/juxJzMRObMW1N9O
 ex1D+TORYJp02UbEh+YMRbnDyoMFlrzgP5mLIT13K0gqrn7cdHVE90AnNVSFQs0pXQC0
 M9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MAafdB8maEcxAt7X4aari+TcZmDheDXHSryvpJebCSE=;
 b=SfuAThhm+9Mk4giRNKLpgLjcYyiWhO8OANEKMIteKmgMuxFbqB6mCT0ki9CbIbUsCQ
 4GwNBjYX4z6lec+7Ubuyk1TFmyXbchYOfbHFR8fJwuaFXhsdU1xfyVUqGhorBKGGZjCs
 AO6oVLC4+eUFYj2Obm7bjbyBY/mNWHqsI/asAO10uzWNkRYO9Ep1ESsRLgZrP+Db74XZ
 1YtEcPOuhQCxYIgRV71uy6UAD4/X6IfnB8nqT0FN+nXLYnYZlRyevWXl7g2dfDPFT5zY
 DzaDgUerjPOGX/4JOkDoAopjoE1yB805tuUpzjkBD6JKhtPjKz+4rOS1KRXgj6Dj/ENn
 Moeg==
X-Gm-Message-State: AOAM531brcsDZ8DJn7+lzmnY5lNgFAFLCgDmbnfQ/A8306pARs05JYiM
 JGfr4QRhityoz7R3EBU52ZhrHtAbB8HMPnXRqJ9b8Q==
X-Google-Smtp-Source: ABdhPJx1WjVAkp6jRxZJp7kiQRs4VYJ4eZLaT2BIRQ1z4nBLr5bwozTZDA10RbWlmANLp/oyaO6yLB+iVdqEuKCbZ7k=
X-Received: by 2002:a25:4102:: with SMTP id o2mr43915325yba.23.1626874081235; 
 Wed, 21 Jul 2021 06:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-1-steven_lee@aspeedtech.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 21 Jul 2021 15:27:50 +0200
Message-ID: <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
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
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
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
> - Support muiltiple SGPIO master interfaces.
> - Support up to 128 pins by dts ngpios property.
> - Pair input/output GPIOs instead of using 0 as GPIO input pin base and
>   MAX_NR_HW_SGPIO as GPIO output pin base.
> - Support wdt reset tolerance.
> - Fix irq_chip issues which causes multiple sgpio devices use the same
>   irq_chip data.
> - Replace all of_*() APIs with device_*().
>
> Changes from v5:
> * Squash v5 patch-05 and patch-06 to one patch.
> * Remove MAX_NR_HW_SGPIO and corresponding design to make the gpio
>   input/output pin base are determined by ngpios.
>   For example, if MAX_NR_HW_SGPIO is 80 and ngpios is 10, the original
>   pin order is as follows:
>     Input:
>     0 1 2 3 ... 9
>     Output:
>     80 81 82 ... 89
>
>   With the new design, pin order is changed as follows:
>     Input:
>     0 2 4 6 ... 18(ngpios * 2 - 2)
>     Output:
>     1 3 5 7 ... 19(ngpios * 2 - 1)
> * Replace ast2600-sgpiom-128 and ast2600-sgpiom-80 compatibles by
>   ast2600-sgpiom.
> * Fix coding style issues.
>
> Changes from v4:
> * Remove ngpios from dtsi
> * Add ast2400 and ast2500 platform data.
> * Remove unused macros.
> * Add ngpios check in a separate patch.
> * Fix coding style issues.
>
> Changes from v3:
> * Split dt-bindings patch to 2 patches
> * Rename ast2600-sgpiom1 compatible with ast2600-sgiom-128
> * Rename ast2600-sgpiom2 compatible with ast2600-sgiom-80
> * Correct the typo in commit messages.
> * Fix coding style issues.
> * Replace all of_*() APIs with device_*().
>
> Changes from v2:
> * Remove maximum/minimum of ngpios from bindings.
> * Remove max-ngpios from bindings and dtsi.
> * Remove ast2400-sgpiom and ast2500-sgpiom compatibles from dts and
>   driver.
> * Add ast2600-sgpiom1 and ast2600-sgpiom2 compatibles as their max
>   number of available gpio pins are different.
> * Modify functions to pass aspeed_sgpio struct instead of passing
>   max_ngpios.
> * Split sgpio driver patch to 3 patches
>
> Changes from v1:
> * Fix yaml format issues.
> * Fix issues reported by kernel test robot.
>
> Please help to review.
>
> Thanks,
> Steven
>
> Steven Lee (9):
>   dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
>   dt-bindings: aspeed-sgpio: Add ast2600 sgpio
>   ARM: dts: aspeed-g6: Add SGPIO node.
>   ARM: dts: aspeed-g5: Remove ngpios from sgpio node.
>   gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
>   gpio: gpio-aspeed-sgpio: Add set_config function
>   gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
>   gpio: gpio-aspeed-sgpio: Use generic device property APIs
>   gpio: gpio-aspeed-sgpio: Return error if ngpios is not multiple of 8.
>
>  .../bindings/gpio/aspeed,sgpio.yaml           |  77 ++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  46 -----
>  arch/arm/boot/dts/aspeed-g5.dtsi              |   1 -
>  arch/arm/boot/dts/aspeed-g6.dtsi              |  28 +++
>  drivers/gpio/gpio-aspeed-sgpio.c              | 178 +++++++++++-------
>  5 files changed, 215 insertions(+), 115 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
>
> --
> 2.17.1
>

The series looks good to me. Can the DTS and GPIO patches go into
v5.15 separately?

Bart
