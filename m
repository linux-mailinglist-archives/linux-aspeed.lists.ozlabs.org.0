Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62927190F
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 03:57:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvncf4bzqzDqd1
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 11:57:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=J3hEekJX; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvncV5dKFzDqcn
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 11:56:58 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id nw23so15454094ejb.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Sep 2020 18:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UeTzI4uVYH/vYLkwgTbCwzqXh8Lw+bS92P+X6TjXjZU=;
 b=J3hEekJXwZUgBmdyB4dH5XbYZHQeAUIx9H5GT6K4iUfMDrdVRxJj+Gl19+j7xzEcpa
 WdMexe0oNnBFQ6Wc4cKmsZjv2K3harGfV3vzniG3GuslPDK/cTs7gXSy8nRJxgoY2S09
 YXe9p6X6FzQHU4TeqL8sa097Sv3Vd0yZ3c+5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UeTzI4uVYH/vYLkwgTbCwzqXh8Lw+bS92P+X6TjXjZU=;
 b=nmVAYea/+xADRhbXzsE3V8sSpH0r6RUZTI+tvDiDVUQf34Hm8I8DRIwPAGMq1zu5G+
 LRgdJgVM7t2XKeACNfkkSXZ6MHiq1RKpZCHg3rjd/70BfNcAM7/IEJtyb2XJxEsqSdoT
 4kpVieiZg53h4YvPnRmUp8/PxbjRClLvG/vNnkE5A3Xgb/XsWqf4attLm4BFZxeqKP+6
 JfK3S7783ZhZi2jJWBEBsQSzUpBsO7XwZ23sYlSxV6vzb/lMJMfw+uPYeKWbOXEaig+5
 DEZ8WU6IXytTt8Uo5AkxYt/SMOaqgN5s6TVZxgtmjWCscoAlPoQ2fTt/Q917LS8yjOPa
 ZTOw==
X-Gm-Message-State: AOAM531y/vCPbiHJXD7cD34L52iq7fcvV+brNUfGl4KuQ5cUxRribsrh
 63OioZ09tuz7MaYFJFJl4cB38nEunNg4HYs/9dY=
X-Google-Smtp-Source: ABdhPJw1pD4Cp9XmxoUz99frP3Byccq0PNYXkW+2ubBgmRcwwXEhnMjOzsBwb12eyGevuKx6n3t/4NyJYSWiB2sxYeQ=
X-Received: by 2002:a17:906:fcc7:: with SMTP id
 qx7mr49730767ejb.254.1600653414014; 
 Sun, 20 Sep 2020 18:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200916084703.778386-1-joel@jms.id.au>
 <20200916084703.778386-2-joel@jms.id.au>
 <644a9acb-e1a6-4077-ac15-15dad58144dc@www.fastmail.com>
In-Reply-To: <644a9acb-e1a6-4077-ac15-15dad58144dc@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Sep 2020 01:56:40 +0000
Message-ID: <CACPK8Xc1wjjH1ki1hwhT3L=s8rrPyzcxZNfOQy72UwDM-SvbSQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: aspeed: Add silicon id node to SCU
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

On Wed, 16 Sep 2020 at 23:45, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 16 Sep 2020, at 18:17, Joel Stanley wrote:
> > Different Aspeed families have various unique hardware silicon
> > identifiers within the SoC.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  .../devicetree/bindings/mfd/aspeed-scu.txt    | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> > b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> > index 4d92c0bb6687..fff3151f06ee 100644
> > --- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> > @@ -20,3 +20,26 @@ syscon: syscon@1e6e2000 {
> >       #clock-cells = <1>;
> >       #reset-cells = <1>;
> >  };
> > +
> > +Silicon ID
> > +-----------------
> > +
> > +Families have unique hardware silicon identifiers within the SoC.
> > +
> > +Required properties:
> > +
> > + - compatible:               "aspeed,silicon-id" or:
> > +                     "aspeed,ast2400-silicon-id" or
> > +                     "aspeed,ast2501-silicon-id" or
>
> aspeed,ast2510-silicon-id

It was supposed to be 2500. Good catch.

>
> > +                     "aspeed,ast2600-silicon-id"
> > +
> > + - reg:                      offset and length of the silicon id information
> > +                     optionally, a second offset and length describes the unique chip id
>
> What about chips with multiple silicon ID regs? I guess we just pick a sensible
> one, though given recent events maybe we should make an explicit note for the
> 2600?

I will add a note saying the 2600 should be the unique one, not
useless backwards compatible one.

Cheers,

Joel
