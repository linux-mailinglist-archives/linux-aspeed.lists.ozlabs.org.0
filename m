Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4831B26C1F4
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 13:09:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bry6K4zwYzDqNp
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 21:09:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bry6C3NB2zDqNp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 21:09:23 +1000 (AEST)
Received: by mail-wm1-f65.google.com with SMTP id e17so2369169wme.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 04:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wXAbzU7xs3GHOx4VbALatUig0WdQIdhicYVb4LS021Q=;
 b=MWJOZDda/8qDIeZpL+yJUBpDs7Ext0CZjUQ7uNPF+y9nxgAV8uG+R6bzbYrdKO7j3/
 ekXEQnGJjCv64ZhrA7XHBSf2/9myjnMHdnJmOgzNzfyQrQA55FYtabvf7VK5GOYt5p+t
 7HOMF3retqDfnJbG70jEMe4tTdXO0UKuf8LhKdykKPZnI2QSN3r8PhqQUJlNoq3CamWS
 ix/QJExQPyjweCFdWcH8SK0hcaiTFE4pgObLv8HrrCAau1019xlw36VWNY2zN/6o4aam
 b+TKF+pbtLXe8FrMET2E5pMW4X446m6pbTLMVmA8CG1ZBYgU+lWzvCEr6z624G+M7Prr
 R4uA==
X-Gm-Message-State: AOAM531z6DqJ8vRh+vuNMfA3P/rlGpkYBux5CcOq5J18nDC7BNHoky1b
 aWSqO0qmpgJ2TpXATE7gCFM=
X-Google-Smtp-Source: ABdhPJz6nAcPpzE0Afvi4kc8Wd3d/N2pmOcJi2+gV9N28HTCz/M5xCuuIuDYCxyhmfn+uomSVR6/sQ==
X-Received: by 2002:a1c:152:: with SMTP id 79mr4146687wmb.90.1600254559712;
 Wed, 16 Sep 2020 04:09:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id n2sm4944652wma.29.2020.09.16.04.09.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 04:09:18 -0700 (PDT)
Date: Wed, 16 Sep 2020 13:09:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200916110915.GA17710@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
 <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
 <20200916061511.GA5719@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916061511.GA5719@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 08:15:11AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Sep 12, 2020 at 11:58:22AM +0200, Linus Walleij wrote:
> > On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> > > Convert the Maxim MAX732x family of GPIO expanders bindings to device
> > > tree schema by merging it with existing PCA95xx schema.  These are quite
> > > similar so merging reduces duplication.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > Can I just apply this one patch to the GPIO tree?
> 
> No, this requires the previous one (1/15) because it merges the max732x
> into pca95xx.
> 
> Although now Rob reviewed both so you can pick them up.

I found now one comment from Rob so I will send a v3.

Best regards,
Krzysztof

