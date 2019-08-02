Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E87EC81
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2019 08:15:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460H2f31z2zDqhb
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2019 16:15:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PgP7focY"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460H2Y4g7qzDqWK
 for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2019 16:15:14 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id h18so72833630qtm.9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2019 23:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NJK0vgby3QC9u2a5qKlpfOibBVA+YhLUqRUYNCsX67s=;
 b=PgP7focY6IphrJ0Ka6VBAFp34SGs4AFVlbQ8h+T5hEgGjrsGAtyfS5VtWYxuf1fB3m
 G+G/whb1JuWvP8jS5gKDkp8csr8jyEVbEGfMgycCRW987rpX71qlDCuF5C+foPZpnr8s
 eFjM9tysfTKhL3Cuoj+drO25SsCwBeC4Ja5tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NJK0vgby3QC9u2a5qKlpfOibBVA+YhLUqRUYNCsX67s=;
 b=BrNu7ax+L2rPx41/n0ZOaR9SC8+FPNU//0VLimGzFnEf6PXEQ/4/aK5dudz1YZqrtN
 FEq12WILzmwrqWnN/kZPRh8jyVyDkDgOPllsrN6suV2/YuyAlxinobnmwLJv0zBFW+0U
 n9enQsGUUlCw0/plUg9eHuHSjjAAMGRnDacRczAvBwveNgQA40rC6564RzQ+wtFcHZbG
 f2X3GaY4TgNPbqpLZGMfyiwEwGskPwEE6wzXNNlUAy9F6PFMfJhEnBIQhGUvpxrhcG9m
 n/mDcUtbPkQ0QuXhEEF0vtkdIH1QZl482vjLLeMPj8/h4SO7lTJFTtPH5QSy2Xye2b9w
 9eIQ==
X-Gm-Message-State: APjAAAVn+dfES7wdRVUmOMfif4Xfqp15Jk48PwTWcb7oyFY4ufGS9Zws
 Sv86omCT2UC+Dmtx7WLUJ6xynuEOV6Q6vk6DCe4=
X-Google-Smtp-Source: APXvYqxWVuZjhzsME6hUNKy4bA2amIPVfDbn9cMpQvV9ctZBzTD1Uxuckz0CHPM+oREl2o6o08TXkm81e59OxjE6k6I=
X-Received: by 2002:ac8:1887:: with SMTP id s7mr94164225qtj.220.1564726512547; 
 Thu, 01 Aug 2019 23:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au>
 <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
 <9d0f2b20-e6f6-419c-a866-c4a0dd92aa63@www.fastmail.com>
 <3691f6cb-2451-43f7-9f00-d5693071ba59@www.fastmail.com>
In-Reply-To: <3691f6cb-2451-43f7-9f00-d5693071ba59@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 06:15:01 +0000
Message-ID: <CACPK8XcWK9Gf=pW5ds=3muoXHAWnyYfHcVSVh+anaTigtMO8yA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
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
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 1 Aug 2019 at 05:45, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 30 Jul 2019, at 10:27, Andrew Jeffery wrote:
> >
> >
> > On Tue, 30 Jul 2019, at 07:23, Linus Walleij wrote:
> > > On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > > It's probably best if we push the three patches all through one tree rather
> > > > than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?
> > >
> > > If you are sure it will not collide with parallell work in the
> > > pinctrl tree, yes.
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > (If it does collide I'd prefer to take the pinctrl patches and fix the
> > > conflicts in my tree.)
> >
> > Fair enough, I don't know the answer so I'll poke around. I don't
> > really mind
> > where the series goes in, I just want to avoid landing only part of it
> > if I split it up.
>
> Okay, it currently conflicts with my cleanup-devicetree-warnings series.
>
> Joel, do you mind if Linus takes this series through the pinctrl tree, given
> the fix to the devicetrees is patch 1/3?

It depends if you plan more changes to that part of the device tree
this merge window :)

Linus, perhaps the safer option is for me to take 1/3 through my tree
and you can take the rest through yours?

Cheers,

Joel
