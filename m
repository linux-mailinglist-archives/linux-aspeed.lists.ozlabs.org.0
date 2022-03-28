Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D22CB4E9818
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 15:27:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRtlw5M3gz3c29
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 00:27:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P+Xah39W;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e;
 helo=mail-ed1-x52e.google.com; envelope-from=ansuelsmth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P+Xah39W; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtlq5tTfz3c12;
 Tue, 29 Mar 2022 00:27:18 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id r23so16946020edb.0;
 Mon, 28 Mar 2022 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PJXGZlpigjTh6H9JMMa18nQ2vBOjy1Eubx2lpLSUCN4=;
 b=P+Xah39W4u3PaDSAqPLufO5/H/K2gU2w/d2wFaGX2dVMn3ptW0NhEHGwzIdwRpRl/0
 z1FSOdPVtx96dA5F7FeFqr/xM+E7aaBMX+Jrr4ATSqkcDJ6ByLiqoci0ikB8zblEPzRr
 AgfVgEhpKJPDuyJpnsbMs0owuaCWieQCxknWTP5AisVim3x2oWgpvZspTe1rCjJ71yEY
 k1XEvY3EOHeoQH9GnIpyLgDu0KacloeGCU6qlaS6y84XNz0XNDoFZ24ZhfgNJ0IJhypy
 Itw+T2ZDe09wzSYH9OizIncV+P60OAXYspmhj2dwWHF5nT/b4EcIUOf1ZGBuS6ErOxv8
 XOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PJXGZlpigjTh6H9JMMa18nQ2vBOjy1Eubx2lpLSUCN4=;
 b=ghcv45S8WWrbp0zIz6Ic+7ng8BES+boiUhC3vEbPOfKpFx788wIGt+tgArCKqF6GSg
 7JEPfcdkFt3u2dINPUiiux9btg/N8IIU+A3W1YbBwrJNKtAIBpi92wvJ7WUEUhIso34o
 P2oMl/dfcWZMKFabptC+MluIzH2Vo1mJOgDOfzE+zWrLxiso3cy90iqTHOA5yl5aMhgV
 1SCEyxMzdDG7s0mtwE270G69kgrjwxXHilTMYMySpQ4lFPRhTA/ey6U5I/XbNg0UNXtZ
 P/uz8PjoGQfM5Ie85i7K45G5DmF5mdpr4U/r++o9EQ24Z6jKX4J3HuQKce9n2ru/k7Mi
 JFag==
X-Gm-Message-State: AOAM533gkBR5fCKZVZ7oc6zxEqF0G/7Xv+dRymbPpkbJU05QbK+YB9oR
 7YDqHSDsMMwkI3ManTe2ssM=
X-Google-Smtp-Source: ABdhPJzfZMouNxSUPChSrobO0DmZY1dpjyjoJXynXzykI+ox1dAeHmzyb365QAjutoruA3M7o01bCQ==
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id
 c16-20020a05640227d000b00419518458aemr16315076ede.314.1648474034597; 
 Mon, 28 Mar 2022 06:27:14 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 y16-20020aa7d510000000b004197c1cec7dsm6986648edq.6.2022.03.28.06.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 06:27:14 -0700 (PDT)
Date: Mon, 28 Mar 2022 15:27:13 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkG3sQ3MDhVoW8l4@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
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

On Mon, Mar 28, 2022 at 03:21:08PM +0200, Jonathan Neuschäfer wrote:
> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> > Hi,
> > as the title say, the intention of this ""series"" is to finally categorize
> > the ARM dts directory in subdirectory for each oem.
> [...]
> > [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> > [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0
> 
> Nice idea, thank you!
> 
> A few notes on categorization below.
> 
> 
> >  create mode 100644 arch/arm/boot/dts/broadcom/Makefile
> >  rename arch/arm/boot/dts/{ => broadcom}/bcm-cygnus-clock.dtsi (100%)
> 
> Or maybe bcm instead of broadcom. Not sure which is preferred by
> Broadcom people.
> 

In arm64 they used broadcom so i assume the full name looks correct.

> >  create mode 100644 arch/arm/boot/dts/dove/Makefile
> >  rename arch/arm/boot/dts/{ => dove}/dove-cm-a510.dtsi (100%)
> 
> Arguably part of Marvell.
> 
> >  create mode 100644 arch/arm/boot/dts/edac/Makefile
> >  rename arch/arm/boot/dts/{ => edac}/ecx-2000.dts (100%)
> >  rename arch/arm/boot/dts/{ => edac}/ecx-common.dtsi (100%)
> >  rename arch/arm/boot/dts/{ => edac}/highbank.dts (100%)
> 
> Why edac?
> The most obvious name I can see here is calxeda.
> 
> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
> 
> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.
> 
> >  create mode 100644 arch/arm/boot/dts/kirkwood/Makefile
> 
> The Kirkwood family should probably be sorted into Marvell.
> 
> >  create mode 100644 arch/arm/boot/dts/layerscape/Makefile
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-moxa-uc-8410a.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-qds.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-tsn.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-twr.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a.dtsi (100%)
> 
> The Layerscape family is part of Freescale/NXP.
> 
> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> 
> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.
>

Considering it's really just 3 binding IMHO it should be just dropped
and merged in other dtsi... But lets not extend this too much.
This is really just a simplic link and armv7-m.dtsi is placed in dts/
I create links in each oem that includes it to skip any changes to the
dts.

> >  rename arch/arm/boot/dts/{ => nxp}/lpc18xx.dtsi (100%)
> 
> Here we have the NXP LPCxxxx family, which is AFAIK unrelated to the
> i.MX family (and thus the bulk of the Freescale legacy).
> 
> >  create mode 100644 arch/arm/boot/dts/vybrid/Makefile
> 
> Vybrid is another chip family of NXP, with a good deal of Freescale
> legacy in it as evidenced by the "fsl," prefix in the devicetrees.
> 
> 
> 
> Thanks,
> Jonathan

Thx for the hint hope to get more comments about the dubious
categorization about nxp and freescale.

-- 
	Ansuel
