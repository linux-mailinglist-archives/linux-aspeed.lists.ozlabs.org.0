Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C978CEA8
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 10:41:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467jjw5nmgzDqJB
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 18:41:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="r2pSn+Kr"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467jjp3L0tzDqHX
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 18:41:32 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id c19so78770753lfm.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KzpALMQhsAYiuMs6y6iJLV3dLZWeIJlGmnisMykIAis=;
 b=r2pSn+KrIj0p/r1Jh1Qa8oRX30gNZzgGkBpwKkDEJNczG7E+VnEvwitjkTtXDi+iiY
 4quGEaWmppl+rGwEtCxpw/UZ3hBqlm+OVntmnenzCFo/I6+LXJxNE7F5nzZUYPGfUZiM
 xiG/6RYIi+mV1854OvRiWUXHkXNDPIzy+8pHNKtKmSgN6mwGISjCmBFoX1/xBh582HPF
 0rE/0WduaDy2igRu2LN3eXNSIweY7DEhtBe8nqhlALJP8Xv3yu9U1R/0vGBigFAmvlLa
 PAsFJPhwguzevp0v5g/p6gMTOOiq08hxCCU/MhScC+UZSJVOlkN0kzs35xo7Oo+fvBp+
 LgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KzpALMQhsAYiuMs6y6iJLV3dLZWeIJlGmnisMykIAis=;
 b=jysurIVGfdYrIoAIOOjL5ttCwGhmvwB6caVyehwlzcVOPasNLtixOQu9I+XltZTGV1
 pOBVx1LEFCJGLwMCBQeQ3r1qtgWQmQEaR7EBlToOU0tM9iVXwbh6IXSxPQfmYH4aok9c
 52I790EqVQNhdoErUWtdiJV1SXtnrCVKqPVIwjJoks0zP2xGQ+iEgwgwq6w97t2yo1/4
 KsDfszZ1/gPx6SPEx9aFHtAKLkWF7SJpF14PayqL+CmkDdXgDFaS6HTP7gkc8nyYks2p
 WUF6F6T0v8bJpGL8zdDLBANdJMW92ebvo/o3eeSsEfvPCqjntJXLZwGcn5QoJP+QIA0f
 NHkQ==
X-Gm-Message-State: APjAAAXF1NFAkdKuW3woF9km7V5IUDdXwxghs9v+9LWxRs3nWaKMTgT3
 7KrakN4hzUDWldmH/7YvnukvbsoNsuopoYycPUgcMw==
X-Google-Smtp-Source: APXvYqx5nqnXeVYMCMOMXqQ9fV6cH2bSPFPCrhICg/SdR9VyEVww1xueQTgGw2t8u9djOnijC0ljUID4vf6sSeDgNCQ=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr22886155lfq.152.1565772089303; 
 Wed, 14 Aug 2019 01:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au>
 <20190724081313.12934-4-andrew@aj.id.au>
 <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
 <20190812101504.GF26727@dell>
In-Reply-To: <20190812101504.GF26727@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Aug 2019 10:41:17 +0200
Message-ID: <CACRpkdapA_-yp4ihY3S+CHMmDMKU2b0u=sj2UhJ-cvv39Dji_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated
 compatibles
To: Lee Jones <lee.jones@linaro.org>
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
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Aug 12, 2019 at 12:15 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 05 Aug 2019, Linus Walleij wrote:
>
> > On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > > Guide readers away from using the aspeed,g[45].* compatible patterns.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Patch applied to the pinctrl tree.
>
> With my Ack?

Sorry no. :( Was I too trigger-happy?

Usually I take Rob's ACK as authoritative for anything under
Documentation/devicetree but if you have concerns about the
patch from an MFD point of view I will revert it pending further
discussion.

Yours,
Linus Walleij
