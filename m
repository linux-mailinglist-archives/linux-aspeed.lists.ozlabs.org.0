Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F15265668
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:09:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd1m427NzDqjy
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:09:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=nm@ti.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=yl4BPTxd; 
 dkim-atps=neutral
X-Greylist: delayed 4266 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Sep 2020 06:24:36 AEST
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnVjc5jnwzDqb0
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 06:24:35 +1000 (AEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08AJD8rM024418;
 Thu, 10 Sep 2020 14:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599765188;
 bh=wVHpXIuoo9L0dFhVi0aJ08O8whODuj4HNYWrOX4NFVw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=yl4BPTxdastirBjKVIUEbYlKhJVs+eC45YfSESLfNSGpRaj5H77Wldw4r+pESKZsA
 GdjSwevWbvMm9fEk+EOkbjovsCE08XrltrwJ+zugtJRJRX9XUlJZ7oALrK6tDZdhKW
 ZKzX5baYKc4I7S2SLccZUq0PnF4UKdn5S7ybT5/k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08AJD8s5064725
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Sep 2020 14:13:08 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 14:13:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 14:13:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08AJD5v2030041;
 Thu, 10 Sep 2020 14:13:07 -0500
Date: Thu, 10 Sep 2020 14:13:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200910191305.phjtijx2fhkhqavu@akan>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 11 Sep 2020 11:07:01 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20:53-20200910, Krzysztof Kozlowski wrote:
> On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> >
> > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > [...]
> > > +  wakeup-source:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +
> > > +patternProperties:
> > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> >
> > I wonder if "hog" is too generic and might clash with "something-hog" in
> > the future?
> 
> This pattern is already used in
> Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> match only children and so far it did not find any other nodes in ARM
> and ARM64 dts. I don't expect clashes. Also the question is then - if
> one adds a child of GPIO expander named "foobar-hog" and it is not a
> GPIO hog, then what is it?

Probably a nitpick.. but then,.. I have'nt seen us depend on hierarchy
for uniqueness of naming.. we choose for example "bus" no matter where
in the hierarchy it falls in, as long it is a bus.. etc.. same argument
holds good for properties as well.. "gpio-hog;" is kinda redundant if
you think of it for a compatible that is already gpio ;)..

I did'nt mean to de-rail the discussion, but was curious what the DT
maintainers think..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
