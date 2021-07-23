Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D333D3D3831
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 11:58:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWPsl5gGGz30C7
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 19:58:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NGgdq7v+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NGgdq7v+; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWPsj5KH1z2yR2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 19:58:49 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id d18so1156367lfb.6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXuM8D5k6/Yl7ozL3DfM+PVJYiIerLcTEkx5mVID/UU=;
 b=NGgdq7v+o5iqkF3EI+m7OhMam7v6/wLB+PtgVWtPK+zgiAfitTZEjpKoG8KZfnGRZ0
 XJ8xuYkmi14aUj966cwbUP99rci0Pn0csyZhH9ZTUDnuQSS32kadqR3lypzYlQJVtsnM
 M/Ob2kqRn3bnETXtydx4LmnRgUUYyQCgOuGSK3GFT7vITGtGj0rltsuaNPV67aIl2IPE
 bHvysTHvHR7wop3cRkd0567v6cxdtTxGnhtE0ta1ytVcgpKU5CaZP8raw12NEl4CmFcw
 RqAlqSRFEHdmfT39ZgMX58L1/MNwxVvr9JKjOeHcHDvcFn9WS2ZMo7vYxE3BPlFA+Tmq
 I92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXuM8D5k6/Yl7ozL3DfM+PVJYiIerLcTEkx5mVID/UU=;
 b=N8aFJPPvJGVB2LvvIG5ZwBdq5y+uBXNrBDZWpfMoVERFqTIRTxxtQr6+5CRZHiFycQ
 7v7BFB9GQ7ZH2m/2b++5+FrmbZogqoSE+exFyiggjZZ7E74qqBxyo4j1gE+eXJxF1TLZ
 DQ2BjoE/gy8BXSg0lGqYSY9IksYSI56A8d7KKIzWtGGiV6ZJ46+h+BgMIpl8m3Fd3Mv/
 qOJ51BpHvgrwQlxMZLYaBGwA+loV6x0XAZ8NZejyubUcQ35Jhw6TvBBOIqAYmCmwCZzL
 PtQ2Tz8oT+fj1FBMkvwOuOavK2guy4cPFHPmmAlQ1UMo6yH4fy5dnQzkM6dAZ6Oy2U2L
 4+ZQ==
X-Gm-Message-State: AOAM532G7l/0Ikhi8jS9stYjaRmYIA7LHK4XDn3xZASXNFzhK4g5jOtz
 bj3hIGulCmxC+oEBz8Ch8GK1fMTFiTuAs8CSY++Brw==
X-Google-Smtp-Source: ABdhPJzUNSEtuAGq/AntijcVwb7VOysRbc8PRRpm+HrzsTl4s4LzDpYbxtndNsmw3C9e7zr97SPpp9rInqEhXg6DtRs=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr2434778lfr.465.1627034325426; 
 Fri, 23 Jul 2021 02:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-7-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-7-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 11:58:34 +0200
Message-ID: <CACRpkdbKyV_Crw8MS63SZGf=nKztDkKnJgRprLdvXe0u7BmVNg@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] gpio: gpio-aspeed-sgpio: Add set_config function
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

On Mon, Jul 12, 2021 at 12:04 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST SoC supports *retain pin state* function when wdt reset.
> The patch adds set_config function for handling sgpio reset tolerance
> register.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Excellent reuse of existing pin config property.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
