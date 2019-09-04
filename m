Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD4A7C3B
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 09:02:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NZXF2hClzDqpy
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 17:02:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=baylibre.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=bgolaszewski@baylibre.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="a4yHwUrx"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NZX90d4dzDqSp
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 17:02:47 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id g16so7701818otp.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hJb8C0XxHQ+BPdFitXGai/GvOOBT3Zt2EUfRo7xRmzs=;
 b=a4yHwUrxocYrJolETfDC/dVE5GboZjW8JiuE3msRZRCguq5K4r/1oDLfRqaoJmbSH5
 cZI/QYpDHXUrcZotRjrf/trcRlqB8ltA3kJK6DjfGFk3hmeG+jXApv3k7ApeIlJO7AFR
 u4xiR3hK90QpFCVn6HPEsug1s8QSoJBV5XzlMHywHUadBrAyy3Q+bmm3Z68VXeZH43IC
 BjK6Nl3lnDt6qR04RYGBn0zAQ+XvmjU2z9x2H8MgGPQSsPdLycKbhOhmph0C4YMPDCw8
 0RfbGDgCXiPYDnO8jlo/vKaMVj26uIkvRHpk+oocjJrN6gwqA2WzgWoxaJXQX2evtFw3
 3gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hJb8C0XxHQ+BPdFitXGai/GvOOBT3Zt2EUfRo7xRmzs=;
 b=BIqnvWT5YbCD2H4EaCzBiqz1VUKrfhYz78rsxJ4HSIniHfij9uBM1cTK7GIIQf/5Qw
 nQRJ9F/4TBOFlwyfr2IIEqMnquxyOpAraiaoxdOQd3zR22BNE9Vk0q4gpopRMP4vMfo5
 hUd24bgdtQe++26vNUctrn56lqGSnnGYK9lMvSLP1DuJJ0QnDt0jYe8cXn0jSvaqoBT2
 kJFh9X4NvIuA2PVSxGGjDlOeCxu+tTi8FTzusqWSUCrvk6dhV26uJfvIg/Q+HLZ9H/Iy
 yVOFA2YdYr8QnFx/9GkxPuVyNped9hCoxe3vReTKPj1086yf+NmPyJUI17gdTexz0GXO
 grXg==
X-Gm-Message-State: APjAAAWDCkkkfoNWDOv9bffShYEGCpqhUsAhCPJLdp1LlluCcu3fEir9
 CFZ6Eg4VlH2VSe0Fe2GDL3PKaHW04/fDGXBYKK9txA==
X-Google-Smtp-Source: APXvYqxxks9djuMMHQfVLolM/IUn9zgO3O4jtGuHuSO1CHv6NW5x0Jn250yoKjvs6bRFbiPnut+ChZu3saOUiE5+Idk=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr15201774oto.250.1567580564651; 
 Wed, 04 Sep 2019 00:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
 <20190904061245.30770-4-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-4-rashmica.g@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 4 Sep 2019 09:02:33 +0200
Message-ID: <CAMpxmJUGm3Zs8VHwHnXTQ2cKnpF0caR=7V4bBi1_sy1U2mWc0g@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: Update documentation with ast2600 controllers
To: Rashmica Gupta <rashmica.g@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

=C5=9Br., 4 wrz 2019 o 08:13 Rashmica Gupta <rashmica.g@gmail.com> napisa=
=C5=82(a):
>

Again, this needs a proper commit description and the subject should
start with "dt-bindings: ...".

You also need to Cc the device-tree maintainers. Use
scripts/get_maintainer.pl to list all people that should get this
patch.

Bart

> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Doc=
umentation/devicetree/bindings/gpio/gpio-aspeed.txt
> index 7e9b586770b0..cd388797e07c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> @@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
>  -------------------------------------------
>
>  Required properties:
> -- compatible           : Either "aspeed,ast2400-gpio" or "aspeed,ast2500=
-gpio"
> +- compatible           : Either "aspeed,ast2400-gpio", "aspeed,ast2500-g=
pio",
> +                                         "aspeed,ast2600-gpio", or "aspe=
ed,ast2600-1-8v-gpio"
>
>  - #gpio-cells          : Should be two
>                           - First cell is the GPIO line number
> --
> 2.20.1
>
