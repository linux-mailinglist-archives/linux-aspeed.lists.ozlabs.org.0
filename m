Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439F26AE3C
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Sep 2020 21:57:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrYsd2vcHzDqSQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 05:57:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.66; helo=mail-io1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrYsX4J4yzDqKv
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 05:57:03 +1000 (AEST)
Received: by mail-io1-f66.google.com with SMTP id j2so5511813ioj.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Sep 2020 12:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fnB3WXd3CVX86l4oOXnRMqvub51IFEMuC66CQlN98to=;
 b=HDZB5A6KtgMS/bXH+sFGeZ/iSQvshzK3T/FkhGl+JwH80duPnlqr2Sj+FEgAifJ6n6
 vBV50t1vCOw6FQw+DHZ31KbiBXWIN46oFY2bUPj6o6becPM2Uw+uA56jr7ZKoYntug7l
 JUCqBYMbWxUJKCQmJm/Kslgf4SL5M709hTJ6/P6QJSNTuOKk5Visx9RbikPFEJyZaJCD
 iHjHHkoJnCE0GOs5KqzNkSReVo+xUZ70V8KHD0R2bbctlNmZ3C4thMi3DIgxnzxqD4jJ
 lX00IZzXidegJ+zyptoz6IkGmycq/pYecODJ9DWk1VUGpaojtQYDrzuJMGRQLtJuM6dk
 Vuzg==
X-Gm-Message-State: AOAM533JKdS7FaCjYJSDo/cjNkU3XTmT93+0yi9aqEEVMMxeS6lZiXVN
 nBPUMULqSI9MkY6epizV6Q==
X-Google-Smtp-Source: ABdhPJyXC7MAHBd+l614l66gdacLiXXbyiJ4NpMgA0JFmeY2XbfsqSS7arJJq3e+Rj2HINzyPMBI/w==
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr15689559iow.42.1600199821359; 
 Tue, 15 Sep 2020 12:57:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 64sm8345119iob.36.2020.09.15.12.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:57:00 -0700 (PDT)
Received: (nullmailer pid 2403540 invoked by uid 1000);
 Tue, 15 Sep 2020 19:56:56 -0000
Date: Tue, 15 Sep 2020 13:56:56 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915195656.GB2385241@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
 <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
 <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree <devicetree@vger.kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Jason Cooper <jason@lakedaemon.net>, Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Sep 12, 2020 at 12:07:59PM +0200, Linus Walleij wrote:
> On Fri, Sep 11, 2020 at 11:54 AM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
> > More over, there is already generic schema for gpio hogs: gpio-hog.yaml
> 
> Where is this? I don't have it in my GPIO devel branch for sure, and
> it is not in linux-next either so not in Bartosz' tree.

https://github.com/devicetree-org/dt-schema/tree/master/schemas/gpio

> 
> I did suggest that I want a gpio-common.yaml file which includes the
> hogs.

Already there, but not wired together ATM.

> > Originally, gpio bindings were defined without restricting gpio hog node names and,
> > generic schema follows this.

Originally, almost all node names were a free-for-all even for classes 
defined 20 years ago. Now the names are getting enforced.

Rob
