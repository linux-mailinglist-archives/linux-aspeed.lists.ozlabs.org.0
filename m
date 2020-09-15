Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10E26AE01
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Sep 2020 21:48:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrYh73GBDzDqBX
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 05:48:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.194;
 helo=mail-il1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrYfr4RfYzDqSd
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 05:47:47 +1000 (AEST)
Received: by mail-il1-f194.google.com with SMTP id a8so4216253ilk.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Sep 2020 12:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vlMe/O0KpaLLn52vRtI2d+InOdmPVFJgxviIiqo487k=;
 b=iRPspUvPa0MRVc2O4lFwFVViAsXqkJwIC5EL5M/nPnS/fPZWPe/AZZvD9RgXXJ0mmK
 8u7a8AppdTEStzd0q2LlrzWA0WtrVfL4MDAOzkD5zjYVGHFgR70ZHvM+uFe+37YFkPkH
 /MkYlEHOJMBjvOUIdDu98cgNQqcYizGvukhjsCE2NcSduaXOVGWEhtDbnxUYVHVpsGR5
 u5xii/Tha9XhJnSCD0CymsNjRMMC85nHjNYGlitcm1fdkbQbDSPYuDeELLlB/bga6hDI
 GgFsqjO1CzEpbAqEDtLjswppO4G2LDlfWZK3VWf7c1wfcbLF5Mit7gsvpDbmA0aQlLJm
 kCmw==
X-Gm-Message-State: AOAM532axDDR7jbT0bRbAZQAT3vKaPRsmjxE28RJO4SxCX3H6K9DpQxv
 xLtnjRbRMYlZJ1l3t+TAiA==
X-Google-Smtp-Source: ABdhPJyJBucL9yXLzWld+N7C06O44ALNqm0DtTmTngrhGguRJncbPkgBRf60HAkVwNDjrR37f44klQ==
X-Received: by 2002:a92:6901:: with SMTP id e1mr17859827ilc.209.1600199263981; 
 Tue, 15 Sep 2020 12:47:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m15sm7972824iow.9.2020.09.15.12.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:47:43 -0700 (PDT)
Received: (nullmailer pid 2389041 invoked by uid 1000);
 Tue, 15 Sep 2020 19:47:40 -0000
Date: Tue, 15 Sep 2020 13:47:40 -0600
From: Rob Herring <robh@kernel.org>
To: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915194740.GA2385241@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
 <20200910191305.phjtijx2fhkhqavu@akan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910191305.phjtijx2fhkhqavu@akan>
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
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 02:13:05PM -0500, Nishanth Menon wrote:
> On 20:53-20200910, Krzysztof Kozlowski wrote:
> > On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > >
> > > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > > [...]
> > > > +  wakeup-source:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +
> > > > +patternProperties:
> > > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > >
> > > I wonder if "hog" is too generic and might clash with "something-hog" in
> > > the future?
> > 
> > This pattern is already used in
> > Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> > match only children and so far it did not find any other nodes in ARM
> > and ARM64 dts. I don't expect clashes. Also the question is then - if
> > one adds a child of GPIO expander named "foobar-hog" and it is not a
> > GPIO hog, then what is it?
> 
> Probably a nitpick.. but then,.. I have'nt seen us depend on hierarchy
> for uniqueness of naming.. we choose for example "bus" no matter where
> in the hierarchy it falls in, as long it is a bus.. etc.. same argument
> holds good for properties as well.. "gpio-hog;" is kinda redundant if
> you think of it for a compatible that is already gpio ;)..
> 
> I did'nt mean to de-rail the discussion, but was curious what the DT
> maintainers think..

Not really a fan of gpio-hog binding to have another type of hog nor can 
I imagine what that would be.

Rob
