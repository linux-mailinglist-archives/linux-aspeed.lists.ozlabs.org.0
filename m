Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6565808
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 15:45:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ky3n1cQMzDqKM
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 23:45:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="wm3vRlDR"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ky3N4ZPdzDqJQ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 23:44:47 +1000 (AEST)
Received: from mail-yw1-f51.google.com (mail-yw1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98E2C21670
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562852684;
 bh=N++HA0Suxx9LUIKShRqQi/IZ1Ui2WkJNndBcpnjBMgQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wm3vRlDRGdEMSG3YtunRhi4IwGasCq6s62I9XVvLUlflydXVQb4uCmAgGGwUAIUTO
 MRtqyRKB01l40QErOdJ6ZbMzyh4eFCISYn5EpeNl60+hwRuAIbKG6Rd/y+J+7MnblI
 tbYQ8LE1IDxamvLGwLvxw9xlEzxS+HX8LUFIAe80=
Received: by mail-yw1-f51.google.com with SMTP id f187so3592063ywa.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 06:44:44 -0700 (PDT)
X-Gm-Message-State: APjAAAWPTppg3vkjglqU5hk7zGsUTC6wyR24DW14tF4tAYmjbkT3U7Az
 UBhrS0oCY9NRFNsGw5pFmV7jDLE8n2iWK9pqHw==
X-Google-Smtp-Source: APXvYqxXUf3DmAR2oJ8qhbFdfBnqovYOtOVQp9haN7U8g9xuxsnLzHC/CIkpCDNwFGMb0ePtFNApL5FEFuQ81Vj3Beg=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr2268749qth.136.1562852683872; 
 Thu, 11 Jul 2019 06:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190710141611.21159-1-andrew@aj.id.au>
 <20190710141611.21159-2-andrew@aj.id.au>
 <CAL_JsqKrYcUbn_02z9GQO6U4rz7k=p3kB7_G0tKmv25MMZZNQg@mail.gmail.com>
 <3b0788cf-eee4-48b2-901d-d2ab6716ab1b@www.fastmail.com>
In-Reply-To: <3b0788cf-eee4-48b2-901d-d2ab6716ab1b@www.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Jul 2019 07:44:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+mAd=US3cbNQexFGrLxhkSyqi2XyGetyHrZV6QMd69EA@mail.gmail.com>
Message-ID: <CAL_Jsq+mAd=US3cbNQexFGrLxhkSyqi2XyGetyHrZV6QMd69EA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: Document Aspeed SD controller
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

On Wed, Jul 10, 2019 at 6:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 11 Jul 2019, at 01:20, Rob Herring wrote:
> > On Wed, Jul 10, 2019 at 8:16 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The ASPEED SD/SDIO/eMMC controller exposes two slots implementing the
> > > SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> > > data bus if only a single slot is enabled.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  .../bindings/mmc/sdhci-of-aspeed.yaml         | 91 +++++++++++++++++++
> >
> > aspeed,sdhci.yaml
>
> Ack. Previously I had separate documents for different compatibles, wasn't sure
> how to tackle name one document covering multiple compatibles.
>
> >
> > >  1 file changed, 91 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml b/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
> > > new file mode 100644
> > > index 000000000000..e98a2ac4d46d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mmc/sdhci-of-aspeed.yaml
> > > @@ -0,0 +1,91 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> >
> > The preferred license is (GPL-2.0 OR BSD-2-Clause) if that is okay with you.
>
> I should poke people internally again, I had asked, just haven't got a clear
> answer. What was the justification for the preference (just so I can pass that
> on)?

To use schema in non-GPL projects. *BSD, Zephyr, etc.

Rob
