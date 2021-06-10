Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9293A25CF
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Jun 2021 09:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0x3b4qLRz307M
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Jun 2021 17:50:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AdvT/igY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AdvT/igY; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0x3W1NjSz2yyG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Jun 2021 17:50:29 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id r198so1692659lff.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Jun 2021 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BV0mX6VHU5X8dHAexL1PQHyIj2OEzudYmOcUzeY2MX4=;
 b=AdvT/igYobAKGf9/uDLDpNApWa3Pq6oV7rSkMR3xAYpt3CF1g7hBOIQXtIQnQnfLcg
 V9MCCOKKAbHgP6RiOfevPWvrGybrM0Uisq1KLDzOUrRYmAiMGJf4xjX8wG0zGPaKrC2H
 YtjNivLvnvqdYnnpF5TPK9UmUlmTSguPrDj30cheFYhIeKrdcGvDUn0VHt1DjPqlyISP
 wivifzrYIDWZN+HQJegNQQgvR6Yf9NxaB2YBqkfqwbHZjfXWNuu+wZQ120m3N83COajN
 pMoqB3XHUVSNPnWkV8KMdiR6S4l1UuE99hUPw9UX7pd7CLJj6lSgNilo0vQ6pn76sXTS
 eiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BV0mX6VHU5X8dHAexL1PQHyIj2OEzudYmOcUzeY2MX4=;
 b=q7O9sr54ouUR0w7s+gPVG/WqMr79NzHRM83agyiBiHsB7m6jI6K3K84/E/tq6i8k1w
 qQ+yJ3qKHg3BTkibHmot6k0PSgESIuPI/Lg9Idq5RIdcCJXsZ3E2y6Ir1XFoS244p8bj
 KN/2g2VUFwlWoq3zDjFHQtOXjhRlDoL8q5FPci8FC6e8uOlJkVPmf07kxDzzFD+zu2Wj
 zs3EtgjGwfkjb6twa8EqREEPAR5jN85sSgi1RMUvFob1WiocH8n9Na85sCF9882E50rR
 7ZopKhEJ1iK9lg9mr5kMFmD9E1mxukyUraPMeJdmT9GL0wjetWuxtq3fRszu/t9jRzrv
 IItQ==
X-Gm-Message-State: AOAM532EhDH6lJHSK2FgG7JD39M2JIKTd63p1QPgbyg3NUlyUFZlIhx2
 GStdnPZbCb25Br/e6eGgk4T4Pc80A05pq+TJeuR63A==
X-Google-Smtp-Source: ABdhPJwXgej17X2Hq45GoFUg6Fkxs282tt7kcgRz+7nJDajhBBMWhiNOQrCm3BSAzecuEcF6CuKi3ff9MxykHNNR6SE=
X-Received: by 2002:a05:6512:20c9:: with SMTP id
 u9mr1074510lfr.291.1623311420585; 
 Thu, 10 Jun 2021 00:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <CACRpkdZOStr+K9U9QTkAcsk4NxuSqBRVv_-9_VkGJbT69iSxmQ@mail.gmail.com>
 <20210610022416.GA27188@aspeedtech.com>
In-Reply-To: <20210610022416.GA27188@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Jun 2021 09:50:09 +0200
Message-ID: <CACRpkda60eB6i2+2MQFyhqYn4Q0WRGPPs91cu9K-g1maov61+w@mail.gmail.com>
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

On Thu, Jun 10, 2021 at 4:24 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> Per the comment in the following mail
> https://lkml.org/lkml/2021/6/9/317
>
> I was wondering if I should prepare v6 for the currnet solution or
> I should drop this patch series then prepare another patch for the
> new solution(piar GPIO input/output) which breaks userspace but is
> better than the current solution.

I would say just go ahead with the new solution. AFAIK Aspeed
has pretty tight control over what kind of userspace run on these
systems.

BTW please influence Aspeed to use the GPIO character device
and ligpiod
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
if you are doing any kind of userspace GPIO control (which I
suspect that you do).

Yours,
Linus Walleij
