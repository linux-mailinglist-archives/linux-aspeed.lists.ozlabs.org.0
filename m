Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BCCA9709
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 01:22:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P0Gd72yszDqM1
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 09:22:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VbaQzcW7"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P0GT0Yd6zDqDP
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 09:22:24 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d10so284580pgo.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 16:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=AczQNysYCDySei8X72/Dbg6e5rvNwR4UInmP+X7KiIU=;
 b=VbaQzcW7ZrQCe2trZID6XMUuX2GRHqIMz3cOd+SQkOSMHqcBaXEthPefBEdHGNiEz9
 CKQgTtlcemjBjTEsorjKd1bCvXlD5jsRU6nSa1wq71JCWPn7TIuKJpQkSlN6RkGGVulh
 JCEwTYHJArlHOVZncxwELRcyaRPvvFSmvgswRiAzSMcDMOgPAo2pAQjo5O1fhHH0A1Oy
 yC+R1zfZgCca/uxL8LRTRb5v3Crb9GNpC2cabxGumvLJxq1GLDXNBYD6C6MEUwPPdndC
 7uryL8utdveXv0F/f4TzBrvA2AMfQeIj90M1R4jyp38fffyqAEYzcMAGb15BZwbJQ1TC
 wHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=AczQNysYCDySei8X72/Dbg6e5rvNwR4UInmP+X7KiIU=;
 b=EncSMMeJDjSXMNnSG6ZI7zlrCdy6H0WlH4QEEzgX0iSirjn2TvDGMCID5qhcXqGkCi
 5IVltBEZOKFD3YuzcEUDLulp/053snu4RkON6HbzFSxxaFrvUS98OvtZmxf1SKpZ6lNe
 S6owWMUAF/NjZWO8YM75zqFIB+rZR7CSbGY3f6sXDPcNUJPWpaicHNt60uGc2+TYjjqj
 IrmsGQviUyl+8DUZn/oO/sgkn0AlKx5m7VYTqpBcqbWMmtbeDH1YZa35xEyscAlp6ttq
 bCXY+KAlaz33lNMvzZHKvzey/lvvdI6AIE0gJXSPPD9GS0uRbjvn6pg7XWc7PCyjad1U
 ZJ8A==
X-Gm-Message-State: APjAAAU1SisneXSFi4+fZGs9j69wG+vt+CsrDeOUcdedPpodLwwXg2QB
 wC0nGNAqxsgd34jDGYIzQZs=
X-Google-Smtp-Source: APXvYqxcvm6k+WghPJeCu8cmhvNiDCNjL6T36Tcn/FxcrqBrhes1vvgrWkh6iO9bxdvQqYko4UUPKQ==
X-Received: by 2002:a17:90a:2182:: with SMTP id q2mr756708pjc.56.1567639341013; 
 Wed, 04 Sep 2019 16:22:21 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id f89sm116682pje.20.2019.09.04.16.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 16:22:20 -0700 (PDT)
Message-ID: <8fdf5eb4fda343d0c4919436490df9935fbfc34d.camel@gmail.com>
Subject: Re: [PATCH 4/4] gpio: Update documentation with ast2600 controllers
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 05 Sep 2019 09:22:14 +1000
In-Reply-To: <CAMpxmJUGm3Zs8VHwHnXTQ2cKnpF0caR=7V4bBi1_sy1U2mWc0g@mail.gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
 <20190904061245.30770-4-rashmica.g@gmail.com>
 <CAMpxmJUGm3Zs8VHwHnXTQ2cKnpF0caR=7V4bBi1_sy1U2mWc0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-04 at 09:02 +0200, Bartosz Golaszewski wrote:
> śr., 4 wrz 2019 o 08:13 Rashmica Gupta <rashmica.g@gmail.com>
> napisał(a):
> 
> Again, this needs a proper commit description 

I figured as similar patches have gone through with just the one line
and there isn't anything more to say that the one line message that
this would be ok.

>and the subject should
> start with "dt-bindings: ...".
> 
True.


> You also need to Cc the device-tree maintainers. Use
> scripts/get_maintainer.pl to list all people that should get this
> patch.

Must have missed that one somehow.

> 
> Bart
> 
> > Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-
aspeed.txt 
> > b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> > index 7e9b586770b0..cd388797e07c 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> > @@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
> >  -------------------------------------------
> > 
> >  Required properties:
> > -- compatible           : Either "aspeed,ast2400-gpio" or
> > "aspeed,ast2500-gpio"
> > +- compatible           : Either "aspeed,ast2400-gpio",
> > "aspeed,ast2500-gpio",
> > +                                         "aspeed,ast2600-gpio", or
> > "aspeed,ast2600-1-8v-gpio"
> > 
> >  - #gpio-cells          : Should be two
> >                           - First cell is the GPIO line number
> > --
> > 2.20.1
> > 

