Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A50E3D3842
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 12:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWPw26pjQz308f
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 20:00:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t0VfOY5D;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=t0VfOY5D; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWPvw6vTLz301k
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 20:00:42 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id u20so720578ljo.0
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 03:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55qDSs4WDIz8l0MaQDVpOoMRLPHxzbPjJoCBzhMJJ8M=;
 b=t0VfOY5DOKMdO4UZ1wz28sycelxsa11TOCksLBsdZvZvMQczDIGKtx8a1UoVG9f66L
 HD9XcjArtzwd4DkawwmM7Ns3/zOmBlp9BjoCfp50P0tPCluAXaDENmo+OdXQaKFZr+nk
 F/H4rNK4st+nQz7TOK2RYbI371Yf8TSV1jwBbtTGiDXTBUmFgS2Nn0HsAFdxxjvU6pgQ
 cbal5cDj8lzKLeh6gxijirLZ1zrY/XRiSczqnT7AwxoX9rcErjkjEMqa0vpOhEe0jxnp
 WhCE+9N9OH2OFjzTMp7OJ/es6gvK7YIqqfWWyFRHxn5cjSOaAwP37M/kgQXO70hdNT+U
 M7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55qDSs4WDIz8l0MaQDVpOoMRLPHxzbPjJoCBzhMJJ8M=;
 b=F0lB7NCY98m7BFmHPDJda0VDAZ/cbzi0K+H3NCMScDk4kMhlWxB4inQdcCh4rza8q7
 qKy0o3+x/SFUqTZgzvr2krF1YFY66GheTBrUZncTEIZs39E63iFS35wLc2cFganDKqfh
 jbzU6pgKgH/VwaFHDO+Wdk3za2E0bqrwoXWaB6QKwVGL5FxRAB5/uLheFj9SVz3bj2jo
 c9WpiD3yXCPGNrRnez+9DEClidTHHRffiS7QVmveoEDlKRpe7ILJNfU7owkVh9+ZaRUb
 9OngoP1CV+T9sXErzwnPFM4+E7adptZVbYqe+xjF2ucab3c8bggQb9KsxS8q95oBQT5f
 YfTQ==
X-Gm-Message-State: AOAM531N0HDUGjBafDj6IaDXAjVoC0UgkIZ8q/RjCgTksxsqJXDPNNjr
 QLUDkvlKHnJ4z+0GwQP6dEmoFpBAVC2FuT2Ysb8V3g==
X-Google-Smtp-Source: ABdhPJwmAzTPEt47e7H6MBHXMnZLqcBXHqbxHBeC/SzF8xZtLU2Y144wU08Unv3L6vzEGejGY0moi+vwH6czk+js7FU=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr2854482lji.200.1627034439330; 
 Fri, 23 Jul 2021 03:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-10-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-10-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 12:00:28 +0200
Message-ID: <CACRpkdZkcQyN-JuNF24gHkNOx3uk9PEWD18-0k49fV-UO=ZB2A@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] gpio: gpio-aspeed-sgpio: Return error if ngpios is
 not multiple of 8.
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

> Add an else-if condition in the probe function to check whether ngpios is
> multiple of 8.
> Per AST datasheet, numbers of available serial GPIO pins in Serial GPIO
> Configuration Register must be n bytes. For instance, if n = 1, it means
> AST SoC supports 8 GPIO pins.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
