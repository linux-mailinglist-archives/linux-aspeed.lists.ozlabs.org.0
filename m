Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1526BD7E
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jul 2019 15:44:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pdlb5pmSzDqXN
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jul 2019 23:43:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="u9xbWDZZ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pdkz4fYNzDqLw
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jul 2019 23:43:22 +1000 (AEST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2529221841
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jul 2019 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563371000;
 bh=b+x+b4NCqFKQ+1PNG6IM4VpJY3IU3W3bJdwBExP8rdA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u9xbWDZZC5YP0yalQ3negtPPV6BVZQ7wi56ltY7eHOOf0YgpNzBzoxcBwtzW7mOmx
 WgxFC+nSg1y8MCnUwLtH2v+vmN1vTtdlMQNxWqrBKBKlMD9Z7XKDDL71WWbQa2P2OG
 GvIirxmMJMNfM0J/46BHFApAo/Kj0P/Bk+RoUxgw=
Received: by mail-qt1-f181.google.com with SMTP id k10so23394659qtq.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jul 2019 06:43:20 -0700 (PDT)
X-Gm-Message-State: APjAAAUfQ+L4TFVLoNg+ph289rmj19f3CV6lAjvfZQ6JTo16+cEZb+zO
 VFMF9KTiGu4hnf5ts1eNtet/yUB8uVeejvhi0Q==
X-Google-Smtp-Source: APXvYqxemI43ftnjQzG6EZtYAR1PGmByDgQ7cM1LN44uorEnKyt8XBd/ehLX6DVgzgxWIxy+3Uz0PjttXYb+ejOST8U=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr29346792qvc.39.1563370999272; 
 Wed, 17 Jul 2019 06:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190712033214.24713-1-andrew@aj.id.au>
 <20190712033214.24713-2-andrew@aj.id.au>
 <CAL_JsqLkOtsAxj9NvNB=EEkH00k-dtNedNY042uuntSmcjhDhA@mail.gmail.com>
 <3fe55ea9-b949-48a0-9eab-90ad3bc1ee2a@www.fastmail.com>
 <CAL_JsqKMo_uv4Ur-D4NaUXk94hGJeRt5fg+0998dDjJCTgumGg@mail.gmail.com>
 <e7b472a8-73ae-4f39-a3e4-9e2d9dbcd01e@www.fastmail.com>
In-Reply-To: <e7b472a8-73ae-4f39-a3e4-9e2d9dbcd01e@www.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 17 Jul 2019 07:43:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKYL5yv8E=aKD1fJwXx1LLdUAs_ZFrc5k1dHsB9u+2ing@mail.gmail.com>
Message-ID: <CAL_JsqKYL5yv8E=aKD1fJwXx1LLdUAs_ZFrc5k1dHsB9u+2ing@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: Document Aspeed SD controller
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2019 at 9:58 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 17 Jul 2019, at 00:27, Rob Herring wrote:
> > On Mon, Jul 15, 2019 at 6:36 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > >
> > >
> > > On Tue, 16 Jul 2019, at 07:47, Rob Herring wrote:
> > > > On Thu, Jul 11, 2019 at 9:32 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > >
> > > > > The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the
> > > > > SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> > > > > data bus if only a single slot is enabled.
> > > > >
> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > > ---
> > > > > In v2:
> > > > >
> > > > > * Rename to aspeed,sdhci.yaml
> > > > > * Rename sd-controller compatible
> > > > > * Add `maxItems: 1` for reg properties
> > > > > * Move sdhci subnode description to patternProperties
> > > > > * Drop sdhci compatible requirement
> > > > > * #address-cells and #size-cells are required
> > > > > * Prevent additional properties
> > > > > * Implement explicit ranges in example
> > > > > * Remove slot property
> > > > >
> > > > >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 90 +++++++++++++++++++
> > > > >  1 file changed, 90 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..67a691c3348c
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > > > @@ -0,0 +1,90 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: ASPEED SD/SDIO/eMMC Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Andrew Jeffery <andrew@aj.id.au>
> > > > > +  - Ryan Chen <ryanchen.aspeed@gmail.com>
> > > > > +
> > > > > +description: |+
> > > > > +  The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the SDIO
> > > > > +  Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit data bus if
> > > > > +  only a single slot is enabled.
> > > > > +
> > > > > +  The two slots are supported by a common configuration area. As the SDHCIs for
> > > > > +  the slots are dependent on the common configuration area, they are described
> > > > > +  as child nodes.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum: [ aspeed,ast2400-sd-controller, aspeed,ast2500-sd-controller ]
> > > >
> > > > This is actually a list of 4 strings. Please reformat to 1 per line.
> > >
> > > On reflection that's obvious, but also a somewhat subtle interaction with the
> > > preference for no quotes (the obvious caveat being "except where required").
> >
> > It wasn't something I'd run into before. I'm working on a check, but
> > unfortunately we can only check for quotes not needed and can't check
> > for missing quotes.
> >
> > > Thanks for pointing it out.
> > >
> > > I have been running `make dt_binding_check` and `make dtbs_check` over
> > > these, looks like I need to up my game a bit though. Do you do additional things
> > > in your workflow?
> >
> > That should have thrown the warnings. If you aren't seeing those, do
> > you have dtschema package installed (see
> > Documentation/devicetree/writing-schema.md)?
>
> I do have it installed, but as mentioned previously there's a fair few
> warnings emitted currently by the Aspeed devicetrees, so it might have
> got lost in the noise. I've started to clean that up, though probably need
> some direction there too.
>
> Separately I'm currently trying to track down an issue where I get errors
> on the Aspeed dts cpu nodes about failing to match the riscv CPU
> compatibles, it seems dt-validate isn't finding the ARM CPU compatible
> strings. It feels more annoying to track down that I'd like.

There's a fix in today's linux-next for that and it should be in
Linus' tree in a few days.

Rob
