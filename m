Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67ABDFCF
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2019 16:15:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dg7x6wVkzDqcG
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2019 00:15:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="dkyOATx9"; 
 dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dg7g4vJ6zDqKS
 for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2019 00:15:26 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 7so5842025ljw.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2019 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XtbzG/PDHB0nH5tZZmEfWG24IcMxbyIbMNZVj9/BKQ=;
 b=dkyOATx9lmLDnncl4zJtlo91Zp1bUtwDHjOBbv+9Jc7LYTOR8Hkjbqp50+n1wBonB5
 ClhTg+OdoJIJx9VdXt/7VqNmmlYCx6QtqyfdTNik7dNQWKUG6FSLcpMO4yKBK590HxjA
 reoI/EKWfyj90vAwRPeHcQXpLWf8PbwrCiY2Ba5l0TFx755VvOTVm77s1nT3pPxaBntj
 jVieeyMvQajnZc1yOum7bJWAoChkF4UKjkXKF+Ag9A1gze2n6fD5JMFAU9w5DZLXPkHB
 7suYRia+8rXVe9n5ovdTt8ikQh2Qlz9UW0ak8CJyLlCeMqFIg+KseoisDnkO4Yy2qRPx
 yPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XtbzG/PDHB0nH5tZZmEfWG24IcMxbyIbMNZVj9/BKQ=;
 b=ulZqmYAyVoVfc/a5qzVYIu1uh31csUYHntDAinYpPoj3XJME8QrgDJEUcnHbD2eJGu
 YDNfWSBxhN7F5pNVjfCl+BJ4gBsz34zqFIOfEw/I+pI+VMvUZzbBtn3lTVwNO4CouG9z
 +LShAsomFVyMnCmVxrFb6JS7iFjLMlrq9iTEQ56nZBmxQwOSGBHAC+uFi4eFX2CjreDO
 kL8DelA+klhZhovUfARoHrP1sHXjiF6An4r0fLdUKBhtWMNnsG9sfHR0zZqFrHNSQPBM
 6gITCUQ2/rV0LmuK9K+B1+7+/c/HNCUIo5N6EOf2ubvwNJ+U8Yz8rR8/fJqV8qh5A9m4
 96eQ==
X-Gm-Message-State: APjAAAXl3OhuuuO7IjLs1qZSy8h+xm0K6G+FMpDw+3AIBOYMXhfpuTbA
 S/nWQeC+xPPuaUlfrrfWdDk/cMV72uI0CewTWS1/Uw==
X-Google-Smtp-Source: APXvYqxqBaZ48HccCc5sICcI0U65KHSoI3B+0Ywyekxx11YaVBb03nxxrNJEQk9thhAS/288MMxOqKisdSKl5/WQMvg=
X-Received: by 2002:a2e:9ccb:: with SMTP id g11mr6533141ljj.62.1569420921560; 
 Wed, 25 Sep 2019 07:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Sep 2019 16:15:10 +0200
Message-ID: <CACRpkdbhRo62inQS96OfFO4iWkLn2+P+w1+6g+Y=HFvVyVnXAA@mail.gmail.com>
Subject: Re: [v1, 0/1] gpio: dts: aspeed: Add SGPIO driver
To: Hongwei Zhang <hongweiz@ami.com>
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
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 9:02 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> The related SGPIO driver has been accepted and merged into v5.4:
> _http://patchwork.ozlabs.org/patch/1150357/

Oh what a mess, it didn't add the necessary code into Kconfig
and Makefile, also names it sgpio-gpio.c when everything
else is named gpio-sgpio.c.

I guess I have to fix it up. My fault for missing.

Linus Walleij
