Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E69A7341
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:12:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGmk34QYzDqlQ
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:12:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::e43; helo=mail-vs1-xe43.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="rDszp6GW"; 
 dkim-atps=neutral
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DjR25bY6zDqHj
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 21:45:59 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id c7so3604678vse.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 04:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ias0hnNTQ1W0WLMJ9Tw+pF62AvhAzndWUOgIreZptR4=;
 b=rDszp6GWldYKXV1jR5X0tVPwOQUmi6CxIEOrbjVQUz3WhkU6oYTxYzX8HxeY8leOeh
 zvTSuAERxKEcn8Yv9UsDjeKMrhx6DkoMarSTEZkDd68+2mj+BgZXGGtNWJI9+EFQuVQ+
 CyB4j3oAVf1Sm05kBVhXT8wjbkRr6SC4LyvEcPVuhYxovbmtuhHVcIXOTHLmpwk200KN
 3vWaa4ABGDhxySRoMd9bnoJjE/MwJ0QN6JNQuGkCtgyDw1T5WZeR3j0ywN5yzX6IjAZ4
 bp1uABpaYaWvwa4Z1bgZ93PENPx4XxOkKWdZY7cjBXyOAlrgPcwG5by4QPTERiNSTm/f
 90+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ias0hnNTQ1W0WLMJ9Tw+pF62AvhAzndWUOgIreZptR4=;
 b=NXk0lDMW7deym7e0Soaa/pNlAIAok8udo5p9XylEWbCWcDdM4o96kImANaxEqVnB8u
 Zbvv21hZZhpxEP0rJrnOW+3fl5zE8LwgnDaKMkXWdVSDiXElThFFdpduqgTBACnYcY1w
 V6o0G3w42b6JL5rg3PUGDEInpYRWKj981fuWSnl9pKv3wAmD4TVJ20mZSKV1MKqf/4T6
 WWREBsVCh7zrnNiz5DXFxePGDlJmqewpqXSmI124ae/WwYarEiRNIOg8CMKaI5mdpudp
 0xYXPWJWWnGwuZIL/JjJ29j2WoFyPeeBf+FBeHhol3SWVV5vF9mkRZllgHtLlikWDy7d
 CrBQ==
X-Gm-Message-State: APjAAAV7+4wD5wFOy8JJzw1Zqng5IM1jVG6aTTRJbHXgtjfB5BTcZtaQ
 TFGew+poKuY3jwd9jjc+/6+Fer1FZCKQAK6KZJMOHA==
X-Google-Smtp-Source: APXvYqwpurVmREw1NCNrWD/HWUqNVjMRJbQbiiRPPhDel5CxOBrosK7SYbiXJVV66QIkSwppRQHrHqUJ1UD4Wg1NEeE=
X-Received: by 2002:a67:e287:: with SMTP id g7mr23784378vsf.200.1566474355983; 
 Thu, 22 Aug 2019 04:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190807003629.2974-1-andrew@aj.id.au>
 <20190807003629.2974-2-andrew@aj.id.au>
 <CACPK8Xe6Zp1uOqEffEc0b6oGa7portEAifGPRqb876HmA+oZeg@mail.gmail.com>
 <6c94aada-9c4a-4f55-9a43-349282ad12af@www.fastmail.com>
In-Reply-To: <6c94aada-9c4a-4f55-9a43-349282ad12af@www.fastmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Aug 2019 13:45:19 +0200
Message-ID: <CAPDyKFrDPxFMm710Z25i-euOT2rrgCNXVa4na-fye0xamMXq_A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Document Aspeed SD controller
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:11 +1000
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
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 15 Aug 2019 at 07:37, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 15 Aug 2019, at 15:06, Joel Stanley wrote:
> > On Wed, 7 Aug 2019 at 00:38, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The ASPEED SD/SDIO/MMC controller exposes two slots implementing the
> > > SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> > > data bus if only a single slot is enabled.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > Two minor comments below.
> >
> > > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > @@ -0,0 +1,105 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> >
> > No "Copyright IBM" ?
>
> I'm going rogue.
>
> That reminds me I should chase up where we got to with the binding
> licensing.
>
> >
> > > +%YAML 1.2
> > > +---
> >
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/aspeed-clock.h>
> > > +    sdc@1e740000 {
> > > +            compatible = "aspeed,ast2500-sd-controller";
> > > +            reg = <0x1e740000 0x100>;
> > > +            #address-cells = <1>;
> > > +            #size-cells = <1>;
> > > +            ranges = <0 0x1e740000 0x10000>;
> >
> > According to the datasheet this could be 0x20000. It does not matter
> > though, as there's nothing in it past 0x300.
>
> Good catch.
>

Are you planning on sending a v6 or you want me to apply this and you
can post a patch on top?

Kind regards
Uffe
