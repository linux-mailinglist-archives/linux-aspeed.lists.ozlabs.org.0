Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A8A81754
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 12:46:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462Dvy4PVHzDqZR
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 20:46:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="gaWYUfwJ"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462Dvq49SrzDqT9
 for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Aug 2019 20:46:13 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id i21so78895095ljj.3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Aug 2019 03:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=azjj3TFeiqdmOl8nmyercmf7iB34KF89eZoGG/R6Zs4=;
 b=gaWYUfwJYyttQBMe2nY+8yFL/8R5jK6AQk8xvuMDqQn5mcexQfU+ZUUBmyu+uJP9FD
 AmKll1bIV4/biJ6Qu5g1juCqirMX0AA9Y7O0FMduDj8D0GDyQdzizwqMTlzy5Bu9gjWv
 1HnI+DOVGuN2KsQjDbjg/5PnQh5CXxe8LbU1I1jgmfyS4ER7mB+VkEGz9UWTkkKnvIDb
 AE8kGu/a+T/WRFmIyQppd735PPaioAy1djy1ixvflToH7U7NTeqAlF3eQ9nOCL1KN0gH
 0asNpJXWqNkEs/u5hVmU5YZuz2wSW0AKsmclxTy6HUY95ONFEY6k/YlWjvb91w9mQ4xa
 GrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=azjj3TFeiqdmOl8nmyercmf7iB34KF89eZoGG/R6Zs4=;
 b=RLN1YdeWm6iMXo7uC6nWM6taOlk6dp8FeCJQLfWFe9k4C5wkQtD76eL49+GOc0BiiI
 flldGxVGcXd3iwtv6BYO+/7f4WEowJKAaRijR/jtPar7YSZhyTHk7zn2T/i2vKbCjVYd
 duFUWuuyiM+Z1fpZyc3WK9ukXjeZw/jn69nNO6HvOBcmS98uuOo1YQJkW0E7O9J4SNrf
 nW1tqXMdgt+N6hNliJrKJN2Cxn+/l+ehR8DHPUv60ieydgp5fuFIFY3LP2TLLwreen4T
 eKpjSAXT0c200XXktN0amyUcO+r9S4KPMKl6sbY6l/aC0BOLnxw/QHTP/rOok03Bgd8b
 Fclg==
X-Gm-Message-State: APjAAAUW4KrY2Vu8Tp9X3ng7B4U5jE97+mxgXdhzKGVKPrkIBoaXsGPG
 4H5WgULQ0EFCercoFo7ItDQuZjJRUYzUH3cxxpCYWA==
X-Google-Smtp-Source: APXvYqyclUQUuvXpJI3a3I9xyKZ6YIBTCazGIgPNcBnTvtEx+0Gv4bfEuR07MD49TkWuHW7hIeykHmoPhEdmQSSmqjQ=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr29583690ljc.28.1565001969218; 
 Mon, 05 Aug 2019 03:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au>
 <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
 <9d0f2b20-e6f6-419c-a866-c4a0dd92aa63@www.fastmail.com>
 <3691f6cb-2451-43f7-9f00-d5693071ba59@www.fastmail.com>
 <CACPK8XcWK9Gf=pW5ds=3muoXHAWnyYfHcVSVh+anaTigtMO8yA@mail.gmail.com>
In-Reply-To: <CACPK8XcWK9Gf=pW5ds=3muoXHAWnyYfHcVSVh+anaTigtMO8yA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 12:45:57 +0200
Message-ID: <CACRpkdbb9OFnnG6rN0fL-qA7vBsGze23GgOifAHqxhod=0kRpQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
To: Joel Stanley <joel@jms.id.au>
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
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 2, 2019 at 8:15 AM Joel Stanley <joel@jms.id.au> wrote:

> > Joel, do you mind if Linus takes this series through the pinctrl tree, given
> > the fix to the devicetrees is patch 1/3?
>
> It depends if you plan more changes to that part of the device tree
> this merge window :)
>
> Linus, perhaps the safer option is for me to take 1/3 through my tree
> and you can take the rest through yours?

OK let's proceed like that.

Yours,
Linus Walleij
