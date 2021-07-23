Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBDD3D3825
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 11:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWPpk3NBNz30C7
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 19:56:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mBol1gdn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mBol1gdn; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWPph2Rx4z2yR2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 19:56:12 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id l4so1021309ljq.4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CkR8wUqEbTCkDMFp55npGJ8Or66e381+fs8zfOqDe30=;
 b=mBol1gdnCW9lQ+lz6XAteY3lI3csu9WMtA0hENo95F4qrMNJqguZTw5jECZQaT68PD
 OOnFjsx/N/QVdfKiwzFo0+GSF0AwVPd73eGapGPy4z0z5DjcjTFQN1SbSF1o40P6wuOG
 5TqQm6w+ywesAzGsFrXN9BQfdL7ngQzcAg3co2oYzUwTXqwekOyu/xFam31KBEBUaghW
 c0dLwaXCiG1gM0ESk5NmgaBHhfOS1vaMGx253sVy8bVkxE4ZcSAsnx1jzs4RLdvaGuWu
 RomuFfIXZrKCS/8p9TE2My4H6xvgY+vI4SgKN/9wQVBT2HTm7MWZkbO6cEouLJv3jVb9
 zf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CkR8wUqEbTCkDMFp55npGJ8Or66e381+fs8zfOqDe30=;
 b=peMODdp/2LzIPvfZulYCCqNd8u86Lc4fU0O7i/JlTjHkVNOLXMCYguCgwYUrfFboXy
 1Ypdibol9AV5AVdRAlFnA8R2S9RJBd3Qu4h4MU00+QkTxHviR1BYycvZYkayl2KTHyWY
 EAiTyGt0yWEcrUSQugLuidHUkYfs4+2IVOg+a3f3JGMSkFlInNe9RYWMAqCvAouIhoUY
 Ia6hilmCfzLvGj7brpQUcSlzxqziW1ojnIwHmzPSHgszyQMnisxjkJEBsoeNX2+Gy1mD
 F5C9RgryKKM/mezCLMgqEh87zjXKusGBdPEk7NMVvsJlRfJ69dfxrV0JWfR94YL6UqbD
 moWQ==
X-Gm-Message-State: AOAM531CaGsUjPMIAhQbPMUdXYHuNjHIF+Bx6i7ArBNWb0X2BBeIPffg
 15FL7B9JARern2k/aQ8k12EWwyOjvP3rZ/oNzfrByA==
X-Google-Smtp-Source: ABdhPJxnM2vPTMe/QERI1wzVFNT+EmxMDa0ooWJyC5d5IaGRNdU8tc70qB6aI0GBFYtqfCAwt6+jzUSnai8uPaJBxyg=
X-Received: by 2002:a2e:950:: with SMTP id 77mr2791047ljj.438.1627034168552;
 Fri, 23 Jul 2021 02:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-3-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-3-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 11:55:57 +0200
Message-ID: <CACRpkdbwR_TKB9r0CpMRrMybF=SpHN4shw5tiwZf6v=ZzTgG+w@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] dt-bindings: aspeed-sgpio: Add ast2600 sgpio
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

On Mon, Jul 12, 2021 at 12:03 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins. Add ast2600-sgpiom compatibles and update descriptions to
> introduce the max number of available gpio pins that AST2600 supported.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
