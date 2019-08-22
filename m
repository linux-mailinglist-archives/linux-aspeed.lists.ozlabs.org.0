Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A6A7357
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:14:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGpG5BYGzDqr6
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:13:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::a44; helo=mail-vk1-xa44.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="rBGmCN2T"; 
 dkim-atps=neutral
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dk4L3BfTzDrPy
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 22:14:58 +1000 (AEST)
Received: by mail-vk1-xa44.google.com with SMTP id z67so1497992vkd.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=001ZjFQMxb/zCLk3zcyFqNqBIiCvp+5VqdO2trNiRjw=;
 b=rBGmCN2TSFf+woRq1U6/8fgdOQP55ndxj6XdO2EdMKOeGV2MrzU8rvwexXqn72Xj03
 3I8c//L8dMyqiq7nE5jvcTkI4B0Rx7q0EtsmX/2Txly9jCIZd67IEQR3P8FwpE8V6W7z
 mwvCR8G9OPcGTa1Ajb3KI7CPl5HDZbPsyHblwWWMZlR920QJ1MQiljgf68A6WiMzYKL5
 ZWH+8SZqMK3Z3Z8weGjBTh1dxKZVJpQB00Y1CPBOii/AhCl4uzkCyBotPMpyvY8X0PJ+
 uWvN0QpzLt2ack1QdKqeFGY5rKmZfI65PQ16PC1MYg/rHNriK/R+nUSHHC/SbdEksOn1
 y2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=001ZjFQMxb/zCLk3zcyFqNqBIiCvp+5VqdO2trNiRjw=;
 b=W2GQKGHvA3RFi3sgclu6x0t00FE7DQOdG4NFy2+RqQhlUpR+5UVnX1LTPtBUpBxUKr
 /hkAnkT6/yQtJAxudi1rRXEa7ErJ9tQSSQgOttG5SFC78yKCtavrqVCIzRB2PMevkJvA
 16Fe7vung5AoCAEyVr8vpc/2sVpDnaONV11//nRRoEpYdLZyiRtfMGacrCFJ8Y4B0qeK
 eHMalTG25dkmSeYFG5QiJXlDHusVjcUmJXV5HlICEVYnezB95x9m65MAKn/sKUb7lP0I
 zaWQnjE8idvNwFaSmP7QGr63dXH703njm9jRNyocme3HwxSmeoMR+imQOgFTEIAk9jZp
 ScMg==
X-Gm-Message-State: APjAAAUqfiC5yZJ0Tjw80Hd1P26+p0GjYkYUNP3Jz3c7c9IhWatO6Pej
 XQouMY6iLFCCqaV5kda8ZAJzmBoDUtVvblMsymh/+g==
X-Google-Smtp-Source: APXvYqwOUeGGRRhaJGbVZ+SG70B06PdKeEzkxHgHaunrpKDQKwl27GuCbI2yR22beKWFZus69SGWNY0cH93dmwthMeg=
X-Received: by 2002:a1f:5602:: with SMTP id k2mr9999325vkb.36.1566476093048;
 Thu, 22 Aug 2019 05:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190807003629.2974-1-andrew@aj.id.au>
 <20190807003629.2974-2-andrew@aj.id.au>
 <CACPK8Xe6Zp1uOqEffEc0b6oGa7portEAifGPRqb876HmA+oZeg@mail.gmail.com>
 <6c94aada-9c4a-4f55-9a43-349282ad12af@www.fastmail.com>
 <CAPDyKFrDPxFMm710Z25i-euOT2rrgCNXVa4na-fye0xamMXq_A@mail.gmail.com>
 <c78d4c45-477b-4078-b269-aec72571c8cd@www.fastmail.com>
In-Reply-To: <c78d4c45-477b-4078-b269-aec72571c8cd@www.fastmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Aug 2019 14:14:16 +0200
Message-ID: <CAPDyKFrWMjaqv8z6HnmDn12c2SsjU6fEzjZesxj=nwbP9YRiPw@mail.gmail.com>
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

On Thu, 22 Aug 2019 at 13:55, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 22 Aug 2019, at 21:15, Ulf Hansson wrote:
> > On Thu, 15 Aug 2019 at 07:37, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > >
> > >
> > > On Thu, 15 Aug 2019, at 15:06, Joel Stanley wrote:
> > > > On Wed, 7 Aug 2019 at 00:38, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > >
> > > > > The ASPEED SD/SDIO/MMC controller exposes two slots implementing the
> > > > > SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> > > > > data bus if only a single slot is enabled.
> > > > >
> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > >
> > > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > >
> > > > Two minor comments below.
> > > >
> > > > > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > > > @@ -0,0 +1,105 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > >
> > > > No "Copyright IBM" ?
> > >
> > > I'm going rogue.
> > >
> > > That reminds me I should chase up where we got to with the binding
> > > licensing.
> > >
> > > >
> > > > > +%YAML 1.2
> > > > > +---
> > > >
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/clock/aspeed-clock.h>
> > > > > +    sdc@1e740000 {
> > > > > +            compatible = "aspeed,ast2500-sd-controller";
> > > > > +            reg = <0x1e740000 0x100>;
> > > > > +            #address-cells = <1>;
> > > > > +            #size-cells = <1>;
> > > > > +            ranges = <0 0x1e740000 0x10000>;
> > > >
> > > > According to the datasheet this could be 0x20000. It does not matter
> > > > though, as there's nothing in it past 0x300.
> > >
> > > Good catch.
> > >
> >
> > Are you planning on sending a v6 or you want me to apply this and you
> > can post a patch on top?
>
> Yeah, sorry, I wasn't very clear there. I was hoping just to do a follow-up
> patch with the cleanups if you're okay with that?

That's fine. V5 applied for next, thanks!

Kind regards
Uffe
