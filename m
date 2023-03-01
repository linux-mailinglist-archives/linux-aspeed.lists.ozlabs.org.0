Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3A6A67B7
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 07:48:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRPvw74t9z3cBP
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 17:48:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kOJ3Gvv1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kOJ3Gvv1;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRPvq5Zljz305g
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 17:48:38 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id s26so49601595edw.11
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 22:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rWiH/yfABzHL4ae4C9gVZIzveXFrF1P6maDicDxQmSQ=;
        b=kOJ3Gvv1Fwzz4lmxNclGvUEqUbmXPw2lV8RuCp6rmdyVz52v2fvubX68lsvY9a6se1
         lpheYla/yeWTYz/2IPSSE031pfmPaqRzDvHGSZ9nnXZKpVyMeULKrfmBG4DHP/FARC78
         dCuj3MFioN7+kL1iD/UoYJUJlRoTuTDmJvV50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWiH/yfABzHL4ae4C9gVZIzveXFrF1P6maDicDxQmSQ=;
        b=bmX3pdCqXKT4Ez04HvqiG49FmpnSUJbcFM9FtVplFy4HHSfIVnkdmglyv/wSIaCNPs
         L0e5934Eip48hL1XftsgUa0tJ7WIxh4oFzBulwNPLi7QO3wAxrZ8NsiGUGfhTrvZ6JRy
         tG1V6HitPV/sussF4V6DGgJyjxw/VwrzeqGhJOG9z9MKVc6cwUdzYwKuqK9EDSS1JCLa
         yuNLMqfT9uAmhNjyxmADSaKUolQ4L6lSJrM7QvAWllNKEB5+5Kv47MccDduikTWISBA9
         XklZ3SkI2VVWeCdwZpJbVNOM0a3z0MLJJfQByU23uJfgSnqk8v8VWg/QqlL/ipFi3K0o
         ZZRg==
X-Gm-Message-State: AO0yUKVkoz1dZ1OVZ/lDRPBOv/Zs6YSWYxKBk2MklsPkXSR9u1KQ3RzR
	A80X+PSBzUFT3qgOT3mB38/EwtL0SxuD/f2h6Zc=
X-Google-Smtp-Source: AK7set/sTCJJLaqc0euCySi7vIDxXxrcEU9jaXPxQQR98MSZuPX9L0zhE/D+G0o9T+Y7KVy4e9pW0TJe/EkRga64s74=
X-Received: by 2002:a17:906:1751:b0:8e3:da0f:f9b7 with SMTP id
 d17-20020a170906175100b008e3da0ff9b7mr2749900eje.4.1677653313123; Tue, 28 Feb
 2023 22:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
 <20230228091638.206569-6-jk@codeconstruct.com.au> <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
 <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
In-Reply-To: <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 06:48:20 +0000
Message-ID: <CACPK8XfRg9vHYjC0rco4dr9pNY03vXTrmXaopOGBgdCq09LybQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
To: Jeremy Kerr <jk@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 1 Mar 2023 at 06:29, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> > > diff --git a/include/dt-bindings/clock/ast2600-clock.h
> > > b/include/dt-bindings/clock/ast2600-clock.h
> > > index b4d69103d722..b1c129977910 100644
> > > --- a/include/dt-bindings/clock/ast2600-clock.h
> > > +++ b/include/dt-bindings/clock/ast2600-clock.h
> > > @@ -90,6 +90,12 @@
> > >  /* Only list resets here that are not part of a gate */
> >
> > These definitions are part of a gate, yeah?
>
> Well, no more "part of a gate" than all of the other definitions :)
>
> All the defines in this section are references to individual bits in
> the reset register banks in SCU040 & SCU050; the i3c set are the same
> as the others there.
>
> So I'm not sure what that comment is supposed to signify as to what
> qualifies as a "gate" in the context of a reset...

This is poor documentation from the author of the clock driver, which is me.

We only expose the reset lines in the device tree for resets that are
not associated with a clock line.

This is done because the aspeed docs specify we do a dance when enabling an IP:

 1. Place IP in reset
 2. Enable clock
 3. Delay
 4. Release reset

So we do this with the aspeed_g6_gates array. The rule is: any gate
with a number in the rst column doesn't have that reset line exposed.
That's what this cryptic comment in the header is warning about.

This was documented to some extent in the original commit message for
the 2400/2500 driver:

 https://git.kernel.org/torvalds/c/15ed8ce5f84e2b

We could hoist that out and put it in the source file(s).

Cheers,

Joel
