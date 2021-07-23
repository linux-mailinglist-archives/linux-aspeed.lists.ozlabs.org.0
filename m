Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848323D3840
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 12:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWPvM2ZClz30C7
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 20:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ANJjpl7N;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ANJjpl7N; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWPvG5FSkz2yR2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 20:00:10 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id f18so1125479lfu.10
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q3A3wcg13DZEjlCLDewUoUp2VK6us3A/bBxLiSdBb/g=;
 b=ANJjpl7NzOK7kQfV2NofKZZL6aTJrGWvKTTPloBDHHVg3B6xAG714RqD03hWe6uq80
 PZNZOc/PjOZiuE9PetDORTDVnG3p8lN5vcySRm8QT4m7XaqVt59XbrpVvbjykfeeihcd
 tmd3chqjQbdHk91ZhJEWKqMhKpii+6mnHI+qbDM4dwA9zF/FuIzNg/Zhxdhg+Tc7UOI/
 46uWhyLPz2bH8AOCjs3QfgQe/+cFANBWXdSnHP5jd/fR9iIbaso43z5GHNvfo3ZtozNb
 vC0yTCteUH9OcxwnTQAASPULIljFvOkiPjQK6xTxu/o3ssRUOckAatfnSPggS+LVfQul
 ef9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q3A3wcg13DZEjlCLDewUoUp2VK6us3A/bBxLiSdBb/g=;
 b=eiXtAuQyVzmCPgzNmxcn70mUuOr2i4Y2uyRhIhK9BZYLmdOoqQUKhoxvDqjr3epSbV
 eE/sKSjkfq8/rMzPdXn86ArPYDdQweZAW4VzJsUyvBGyVKuLzHk2KbmP5KmbVmKG43y6
 QiZjWJOmO38idcIvQPiCTou8+ZtvkqOyUNG4LdNp0rfZoB0gQ5+qMhiXnUqP2NBF+4uA
 f+oxx8Ws3+RUer3sQB7imUfZciLg1Ri9vEqIFaxigRbaBzK2u1CUp2/Xm/GOjj19dHss
 SK+xqRp7mNUgej7dugkNWVJT1IyExEwImOQV+he+hfRGBNNPgrFn2hFNRR1TGW/jSZgc
 cfmw==
X-Gm-Message-State: AOAM5333m3uVFthWeiA1ZNBPLHvQmnwGsY3V3D2NxD3jaaLCh5nTy6RO
 14QUXow8qXY2O6BaySWKUoQp0nMnKCpAHioI3mUIXw==
X-Google-Smtp-Source: ABdhPJxcpwkaKCEEng7O+N0rUtzYgwgekwY+aOeUQQrJkKShW042z4cuNAEJbb1Pn6WghT80XUFEIu8S0GqeR9yEIfw=
X-Received: by 2002:a05:6512:169e:: with SMTP id
 bu30mr2459661lfb.291.1627034406022; 
 Fri, 23 Jul 2021 03:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-9-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-9-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 11:59:55 +0200
Message-ID: <CACRpkdZa696HyQvOssrUK=KiiJGVfvCZZ_7zyOWGoEaB-R_BkA@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] gpio: gpio-aspeed-sgpio: Use generic device
 property APIs
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

> Replace all of_property_read_u32() with device_property_read_u32().
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
