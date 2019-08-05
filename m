Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4273581764
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 12:49:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462DzH1GVbzDqxd
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 20:49:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="p8YZD2U4"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462Dz85WlXzDqwp
 for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Aug 2019 20:49:07 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id t28so78888163lje.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Aug 2019 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyWsXMkk6iYIEgII1oOJY8ugYk5vzPXYCtQlb3UFPac=;
 b=p8YZD2U4JcoxOrifQes9j3JCaAfhm7o6USZZn0949Khu+OleChnYcRfI+39orr96Sv
 pDMdXHaz6fS1XUsCCKp0w4RcDrzKXKl6EOZwrYgE5dQHWk9iigtwULLPoyoG2BMVu9vG
 kvAuL51lL2OoTsLuVwBsGWfCtRbYG7VIc8NDjruo6AMYEtoZd+znBsmmHY2Ll8FcaqUQ
 0OPryf7N8p0erCSYcfVN7ycuF+vhWFALeWbYx0ZZ70eUMFPI/W44qRIj3MyVuOLOpH79
 r0lMZp7KsHkL2CF8P/dByC4r4M0tGxCRfH6gRf5mLdID+8voRToNX5qas9UKKdse0DK8
 vVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyWsXMkk6iYIEgII1oOJY8ugYk5vzPXYCtQlb3UFPac=;
 b=AWjMPpmvzOIj/cXrjYo3yQWKNYUUwWO9KDYLrhUylj2M5ve/IR6YqStWCDJUgeGcu6
 OrgEN2iOn1pAutENGvcGm49tYrKFriJN2k2yQ+S8USBEXlK/VrTc/y/P7PEyNb/Z+DXF
 RSA8B8OnYMqcboSPanq7dDrE1LlTXmS+Y19E5rXen1o7AoeyxRlhBFJgqC06G2YPqI3K
 zBWHgD990owC1NR+B4SeYeaR8IMC3yzs5XM8nAwrxk8hhNLay6b9DIlFJiz/sAwsDNv1
 NXIeudAjFtrfQLQybNbC1i3ZjXQN1FNVb0uRumOoN35cl0Txdu/Pa/faaJELJ2+k/dZ+
 N3mA==
X-Gm-Message-State: APjAAAXTK6XhJ5ZUg7OZJv7pNOJbyIri0EJaKNdnmn4WeHTioMd9Juo5
 e3z3n+ID5j2UqmYDpAJfpswuX+o52f2wgfD6BsrgmA==
X-Google-Smtp-Source: APXvYqwv1epfSf4ijzEUccvR56Qz9qbH+rnx/bhn0Kh+aaPW/inmXM+/zCQxf4A9MHgYUbFT258fn6fea66xtBqoGC4=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr29589680ljc.28.1565002143043; 
 Mon, 05 Aug 2019 03:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au>
 <20190724081313.12934-4-andrew@aj.id.au>
In-Reply-To: <20190724081313.12934-4-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 12:48:51 +0200
Message-ID: <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated
 compatibles
To: Andrew Jeffery <andrew@aj.id.au>
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

On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Guide readers away from using the aspeed,g[45].* compatible patterns.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
