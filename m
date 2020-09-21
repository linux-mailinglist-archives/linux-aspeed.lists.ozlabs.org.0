Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC05271909
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 03:56:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvnbW1TShzDqjW
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 11:56:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=f6Rv0bWQ; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvnbL2L7NzDqcn
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 11:55:56 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id ay8so11248184edb.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Sep 2020 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FRSutOuV565E+jRnFpa4CKJAyMm8/FoxwY0u0XxXek=;
 b=f6Rv0bWQH+N4U4jEUnkVsbTk9f7t3dUXI8NJGDq1+GP3bp5j/GJXcW6LuNPQRclhuq
 xvPTAJPGm7x6wkm+sjCX7awKukknzlZKsxfppG7Op8PDayLAeAQLDSdhYIHBDRQdr5YB
 bIspqWA8Jn2RSPC+TuhZZFcZpSQaXDnISIsu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FRSutOuV565E+jRnFpa4CKJAyMm8/FoxwY0u0XxXek=;
 b=nHt1LTbj+K3Ag2/4qi5cRhEJeK1nLCCR4wWJa0OevFbu+B1fuGUOWghPgZdjcA0rGu
 4KnqM65ceYGhyEGGgnJbhcsawFoWPo8vK0mwOQpX3H4c8gsntyp9IOHcuPdt1IKu6w8B
 LcTHUXidFnAkFCW8mneqY1mbQKXDvJkLT2Gt3QdAFmozGCEEgWr7nZDIGHDBMlONuPKI
 qVa4yMOuKI6+ckvDz6pzfeiJYUi2LR1bZpR1sCpdaEQoA7u+tsFU047PXEyARSAhx1gM
 JKclwOV5ES3pYbLS/HOjl+4MXd2H67AZVijua0AWkaop+ixCEXnNR0JstsIsAtjowqYd
 iUKQ==
X-Gm-Message-State: AOAM533ljwxmv+cX3yI0OuvtUeOlG4gFWVIJoo/2/WghRVML3nHEtgw9
 pp9YeDYm4SSW5JijVVAjHncIuxyVh2kb9j09UBQ=
X-Google-Smtp-Source: ABdhPJxYhnzmUy6gkBPUGsSLBr7eDnoKR5MPKeInPbJPaU8a2Z+lujYCEc6O+c8OBGvvocRKlkZdME1KHowDA0CtHIk=
X-Received: by 2002:a05:6402:18d:: with SMTP id
 r13mr48422410edv.267.1600653351998; 
 Sun, 20 Sep 2020 18:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200916084703.778386-1-joel@jms.id.au>
 <20200916084703.778386-3-joel@jms.id.au>
 <aabf960e-33b3-4094-ad03-8305ca1794c7@www.fastmail.com>
In-Reply-To: <aabf960e-33b3-4094-ad03-8305ca1794c7@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Sep 2020 01:55:39 +0000
Message-ID: <CACPK8Xdgd-PyfW1pTMW7pebLUVGcbco1XAC_=xBAsDfVsYUGUg@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: aspeed: Add soc info driver
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 16 Sep 2020 at 23:41, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 16 Sep 2020, at 18:17, Joel Stanley wrote:

> > +     np = of_find_compatible_node(NULL, NULL, "aspeed,silicon-id");
> > +     if (!of_device_is_available(np)) {
> > +             of_node_put(np);
> > +             return -ENODEV;
> > +     }
> > +
> > +     reg = of_iomap(np, 0);
> > +     if (!reg)
> > +             return -ENODEV;
> > +     siliconid = readl(reg);
> > +     of_node_put(np);
> > +     iounmap(reg);
> > +
> > +     /* This is optional, the ast2400 does not have it */
> > +     reg = of_iomap(np, 1);
>
> Use of np after of_node_put(np) above.
>
> > +     if (reg) {
> > +             has_chipid = true;
> > +             chipid[0] = readl(reg);
> > +             chipid[1] = readl(reg + 4);
> > +             iounmap(reg);
> > +             of_node_put(np);
>
> Double of_node_put() of np.

Good catch.

>
> > +     }
> > +
> > +     attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
> > +     if (!attrs)
> > +             return -ENODEV;
> > +
> > +     /*
> > +      * Machine: Romulus BMC
> > +      * Family: AST2500
> > +      * Revision: A1
> > +      * SoC ID: raw silicon revision id
> > +      * Serial Nnumber: 64-bit chipid
> > +      */
> > +
> > +     np = of_find_node_by_path("/");
> > +     of_property_read_string(np, "model", &machine);
> > +     if (machine)
> > +             attrs->machine = kstrdup(machine, GFP_KERNEL);
> > +     of_node_put(np);
> > +
> > +     attrs->family = kasprintf(GFP_KERNEL, "%s",
> > +                               siliconid_to_name(siliconid));
> > +
> > +     attrs->revision = kasprintf(GFP_KERNEL, "%s",
> > +                                 siliconid_to_rev(siliconid));
>
> `struct soc_device_attribute` declares these as `const char *` and the strings
> are constants in the driver, so is there any reason to use kasprintf() here?

The first iteration of the driver had more complex strings here, so it
was a hold over from that. As long as the strings returned from the
helpers stick around forever then we can do that.

Cheers,

Joel
