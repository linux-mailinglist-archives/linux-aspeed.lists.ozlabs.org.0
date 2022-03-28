Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7E4E95CA
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 13:54:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRrhW3Jxbz3c1q
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 22:54:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kw5U/JCm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=ansuelsmth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kw5U/JCm; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRrhR5H5Qz2xf9;
 Mon, 28 Mar 2022 22:54:13 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id p15so28103075ejc.7;
 Mon, 28 Mar 2022 04:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
 b=kw5U/JCmxslxZizV2jLlmOBcIGssYEKq78XpVjnkGPlQXwgkdWAeFftd0yoAS+p3Es
 6bwRaMEB8Zw0+KWXTqe5xSm+v3FtPxgM1RwYnyrFhzLni/EoCXXr2a4ZaW4d9wU25zbe
 eoniOgU5G4dswNrq9JJELqXGcHi7pVp1q2vyKzlG9qqT6TMzxJDxKEKbi/+Gm1DeYjXV
 3UGggeaDhqV9rH/7fzTDT4rvoqsZCz8BOdcAeH6/X0BclpVxtXas1+/6ml1BvWFhOWRe
 yfEvE0l/ifZkZqpd8ktCUvFEOWyKT3gPWwBAnqgNkhDVlu40OBzAA6dNTFKzBXUmZGp/
 emUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
 b=1MeuFwuIeRzOXy3xAsp15xyS0yU8Y4mpAyM1sk44Dtep0hczq7NPSLZAYiaoQ4Hn/6
 8CX5BBWvTQVjK+fyvDYdByHBGs+aVLG08SG1ZZZ9w2G3J1FoIo9JIVCNqEsrWVmeNaok
 yzrvvnfdXg9gJiYTNKpWaflE4hy20amRcH6pWYf+5K7PAp0S7nKjd29Zy4eBBLKv4mqr
 /8rbNdRoswsIwr0Ew6fzo/sEXiHhsgywjM4LRSgzkWaw6OtwBws3/1rZEUqPgaDN/Ir+
 fEbY4quZbuCjr7PDhdzQGuWoYTTcNF4eBHRejWNc+JSSqi0OKs84i7RhBDxNL3W4hT2p
 Fkng==
X-Gm-Message-State: AOAM531nyB+Hm2C5KFDDUlT+1QbMmlZaMoEu2FOq2p3DR84Wu/9m9FZM
 UVjnnn8Jjgv4eHnQC4JdoeI=
X-Google-Smtp-Source: ABdhPJxnuIkGxnuYGLZsxAfTPmW5TkGf54BmupZ2me5Tuu+k4VyUkun2Hg1gMwbCB0fty6ZgA/O4mQ==
X-Received: by 2002:a17:907:3f18:b0:6e0:df2d:c76a with SMTP id
 hq24-20020a1709073f1800b006e0df2dc76amr12117312ejc.55.1648468447864; 
 Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfdfdac005sm5850462ejc.174.2022.03.28.04.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:54:07 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <YkGh36h03EfUd3/q@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 12:47:46PM +0200, Matthias Brugger wrote:
> 
> 
> On 28/03/2022 02:09, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> [...]
> >   arch/arm/boot/dts/mediatek/Makefile           |   14 +
> >   .../boot/dts/{ => mediatek}/mt2701-evb.dts    |    0
> >   .../boot/dts/{ => mediatek}/mt2701-pinfunc.h  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt2701.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6323.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6580-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6580.dtsi  |    0
> >   .../mt6582-prestigio-pmt5008-3g.dts           |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6582.dtsi  |    0
> >   .../dts/{ => mediatek}/mt6589-aquaris5.dts    |    0
> >   .../{ => mediatek}/mt6589-fairphone-fp1.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6589.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6592-evb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6592.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623.dtsi  |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-emmc.dts   |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-nand.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623a.dtsi |    0
> >   .../mt7623n-bananapi-bpi-r2.dts               |    0
> >   .../dts/{ => mediatek}/mt7623n-rfb-emmc.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623n.dtsi |    0
> >   .../boot/dts/{ => mediatek}/mt7629-rfb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7629.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8127-moose.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8127.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8135-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8135.dtsi  |    0
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Would it be possible to also script a fix for the MAINTAINERS file?
> 
> $ git grep "arch\/arm\/boot\/dts" MAINTAINERS |wc -l
> 
> 101
> 
> 
> Regards,
> Matthias

Totally forgot about the MAINTAINERS file! Yes will add to the script a
check to fix also that.

-- 
	Ansuel
