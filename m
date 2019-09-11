Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7BAF9EA
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 12:07:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SyHR5qDRzF2Py
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 20:06:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="p2jaID0P"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyDJ48MWzF2DD
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 20:04:16 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id c195so1081248lfg.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2019 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUrALqLYIp3tenV9WPlX+wrIGiFW2sjaAtprRGLAeEM=;
 b=p2jaID0PK0kDp5GpJDQQkIXhcRDJG0tyKs3M8dW00A0nTmYl4XPzPDxiiXVVHMrvt+
 3r7lWYb3E1VbxJKjCFl4T/s7r/GjKdCpMsYFGhPYq40CrLVtcwphRVLlOz4Mi1abAmc6
 gb7WEzvYMYxI1T0Yv1JJQMukj1kqEswd1th8aKqcRAHTLbfy8nsrMproykhpVp2apyq1
 YZAJxHMjH/FKf0pJw40wEhiG4GATCpQy1rgKrv+b1JNb++7VFgOOXTCNwIkKecduNXL3
 gwOiiQuJzd/9zYidBIhoUcbKtFgICCtV1yeLL8Sdtn6e6RFujjx3Wf2pnscLkru96m90
 vHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUrALqLYIp3tenV9WPlX+wrIGiFW2sjaAtprRGLAeEM=;
 b=EcUsvl7XFCikSsbBRsSdVsqj8Eq9EtKtdCzgYjJ6EmcCJPyTGH84hE2amTCdGbnSE8
 vaTuqE3VNwZHiK3Dk65yqwV08L+unptlmigoZ3f48shhZHSmLoqODY8vKS0V0EJDfyec
 5jDkwWKX/3fobYVE+exzh7VKPRgqO9uw4twWbs5bE8sJB/xbClVnhrxHtjVXfg2KH3bx
 7Y33u1uZvxnEITYfkq/lGe9jU5pj5IFX0PYF7MGRt1cttXAHMzvygyYERvEd10WInaj1
 PJXK2kgscVbIbsF66hbhbWOKzkWgGOHyTyaWFYGyjyp7qiODMrRO8unm3ZPLMdNhQbtg
 1e6g==
X-Gm-Message-State: APjAAAXCH++2zkTOsqEGEm/sWuSjtUmxhX3GbadSig+ZJZjoo25h1BQP
 IM5Mr0GJTZUwCKuJe9EI/bi71RA1ipyXCbtcjNtqIA==
X-Google-Smtp-Source: APXvYqzngoeZ/r34ebfHnHn3MkbXp29HvsnciD2vYxTBkFVS7UiQq+i0mLCv1JJKPJCI91Pa7RHozJe5TicykUeAq+0=
X-Received: by 2002:a19:14f:: with SMTP id 76mr22938921lfb.92.1568196250647;
 Wed, 11 Sep 2019 03:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062547.13264-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062547.13264-1-rashmica.g@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 11:03:59 +0100
Message-ID: <CACRpkdY1Rk6vPihZkpKC9hya9ixQcqg9PG9rEpM3kSY0kxwsjg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: aspeed: Update documentation
 with ast2600 controllers
To: Rashmica Gupta <rashmica.g@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 6, 2019 at 7:25 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
> Additionally, it has a GPIO controller for 36 1.8V GPIO pins.  We use
> the ngpio property to differentiate between these controllers.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

The changes are uncontroversial (uses just standard GPIO
ngpios and adds a compatible) so patch applied.

Yours,
Linus Walleij
