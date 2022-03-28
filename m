Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261494E961C
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 14:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRrq80J0kz2xf9
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 23:00:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NVOXoLAv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=ansuelsmth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NVOXoLAv; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRrpn6zkpz3c3c;
 Mon, 28 Mar 2022 22:59:45 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id j15so28101463eje.9;
 Mon, 28 Mar 2022 04:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ze/m2vpSHnRCFApl36JFy8UvWyMkN8Q8xJDfS9/vOsQ=;
 b=NVOXoLAv+phJR/OXqllZcD5b1Fb56JYg3bpa9CyubfWoBO1WHvjfTDV45sk6lAT8Fy
 7t009RHWxiiHqBKnz/OeQuqQmXSCOcVYaXqLTiGiASfhycyiNyEFoUiPQZUsxarV74gK
 EhdNs8Ll/Sv/A7aqkcPJrL1WXaa/SyK4WORC78JxBpCteMPOv8tFjbmuBOhaI2hiioYQ
 zlTctUJcXcIcVntfbCHEOJXr8PjiDoUyFKlkig+4SFg2C13BlGNwT+QPFNe1swUJVUQi
 ECSzsfOHlRzKZo6tPYChgj4YND8eh2r+yggI6cBl6P8sqPujf7WDxjSttAM5bNwcqPqT
 xGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ze/m2vpSHnRCFApl36JFy8UvWyMkN8Q8xJDfS9/vOsQ=;
 b=j2AjMb80rs/OvoyaOhESkhS4AoM2y7bIee3bbGO5IXwpGI/X3bqxf0WHlBWJ35V9pp
 7w13iIN87/oSp9AikoUDusm3pfjZW+fdVtqPfI4a5442cgxFnNN3oLwaZiYMiDEplgZv
 qYlZN3q/o3GpQxr1uMjzDKnOY0E9C2m5qpYRFpwhxFkrfA2fp4NTUk/ZbFZs/eUjnd+7
 062YPWegGhEJpZ+a92yg8L1B6JwWXyR/Iq+fCO/3OhnQ+VIln8XuUCdGeq9vmQcVSiez
 Y7HNjsAgDSVVADmGsKduaUUZh37e6i5040Ux266Q7xdfZXomv4+yilHHjS2X97PZrjAD
 Labw==
X-Gm-Message-State: AOAM533TlN4gDdetcSTn9h1KTmHuTDdXjQ7czakj1Jlx/nyRLVni/ERZ
 bkjHoMglP4Vtg1Bu91FMNOs=
X-Google-Smtp-Source: ABdhPJyPqxtkyOhDlzlQWoqBpr2/PWiXxO8oiWRGFKkhtuHhlxy5u1G+w790Mbqi41xojqATEHav1w==
X-Received: by 2002:a17:907:2162:b0:6df:ec76:af98 with SMTP id
 rl2-20020a170907216200b006dfec76af98mr17316920ejb.314.1648468781204; 
 Mon, 28 Mar 2022 04:59:41 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 j9-20020a170906534900b006df9b29eaf1sm5867876ejo.8.2022.03.28.04.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:59:40 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:59:40 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [Linux-stm32] [RFC PATCH 1/1] ARM/arm64: categorize dts in arm
 dir and fix dependency in arm64
Message-ID: <YkGjLPN7tjVeckEO@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <fef4e5dd-d843-ea37-7701-bcfac9d1c9b5@foss.st.com>
 <238c6d7b-a61c-d09e-9377-8f49dad40eeb@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <238c6d7b-a61c-d09e-9377-8f49dad40eeb@foss.st.com>
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

On Mon, Mar 28, 2022 at 11:20:00AM +0200, Patrice CHOTARD wrote:
> 
> 
> On 3/28/22 11:09, Patrice CHOTARD wrote:
> > Hi Ansuel
> > 
> > On 3/28/22 02:09, Ansuel Smith wrote:
> >> - Categorize every dts in arm directory in subdirectory
> >> - Fix Makefile to address for the arm subdirectory
> >> - Fix any arm64 dependency
> >>
> >> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > 
> >>  create mode 100644 arch/arm/boot/dts/st/Makefile
> >>  rename arch/arm/boot/dts/{ => st}/spear1310-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1310.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1340-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1340.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear13xx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear300-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear300.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear310-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear310.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320-hmi.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320s.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear3xx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear600-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear600.dtsi (100%)
> > 
> > 
> > All SPEAr device tree should go into stm sub-directory, as this platform is a STMicroelectronics one
> > as STi or STM32.
> 
> Just got an internal discussion, all STMicroelectronics platform should go into "st" sub-directory, and not in "stm" as indicated in my previous e-mail. ;-)
> 
> Patrice
>

Noted will do the change. If you notice other wrong categorization, feel
free to write a big list so I can fix them. In short merge stm in the st
directory. (arch_sti and arch_stm32)
Aside from that they are all correct right?

> > 
> > Thanks
> > 
> > Patrice
> > 
> >>  create mode 100644 arch/arm/boot/dts/st_ericsson/Makefile
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8505.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8520.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db9500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-ab8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-family-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-stuib.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r2.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r3.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href520-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-stuib.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-stuib.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-nhk15.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-s8815.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-stn8815.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-snowball.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-codina.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-gavini.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-golden.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-janice.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-kyle.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-skomer.dts (100%)
> >>  create mode 100644 arch/arm/boot/dts/stm/Makefile
> >>  create mode 120000 arch/arm/boot/dts/stm/armv7-m.dtsi
> >>  rename arch/arm/boot/dts/{ => stm}/st-pincfg.h (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-b2120.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-family.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-b2120.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-b2260.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-b2199.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-b2264.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stihxxx-b2120.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32429i-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32746g-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f4-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f7-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f769-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f769-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h7-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h750.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h750i-art-pi.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp131.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp133.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp135.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp135f-dk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xc.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xf.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp151.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp153.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp153c-dhcom-drc02.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-avenger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dhcor-avenger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dk1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-edimm2.2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-iot-box.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-pdk2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-picoitx.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dk2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ed1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emsbc-argon.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emstamp-argon.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ev1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-lxa-mc1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xc.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-drc02.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-pdk2.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-picoitx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-avenger96.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-io1v8.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dkx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-osd32.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxaa-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxab-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxac-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxad-pinctrl.dtsi (100%)

-- 
	Ansuel
