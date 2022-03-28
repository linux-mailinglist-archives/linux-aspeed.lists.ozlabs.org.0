Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1AE4ECF35
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 23:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTKy022wYz2ymb
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 08:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=OSqpQCrl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=0x0f.com (client-ip=2607:f8b0:4864:20::92a;
 helo=mail-ua1-x92a.google.com; envelope-from=daniel@0x0f.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256
 header.s=google header.b=OSqpQCrl; dkim-atps=neutral
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRmjx3wcnz2xrc
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 19:55:15 +1100 (AEDT)
Received: by mail-ua1-x92a.google.com with SMTP id 63so5995959uaw.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVsPS/VhdyaBsd9atLVudcFUKqEC9P8EvF6rDaB8yFU=;
 b=OSqpQCrlKuq1ygWxipYT3Of9HBAb88KQ9TOJlYuLb2/hGVpSDprsgb6uWgqbh3hh98
 vsxGCoSmwwbiMb/1jrmEDn1hHoeY6N21aXGTFcL6mzAPwPSpbGdasPKMR7/lx8tM8Dcu
 zDqMOBhm8ZczDMkDasuHpB7m/C5XBna2TilwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVsPS/VhdyaBsd9atLVudcFUKqEC9P8EvF6rDaB8yFU=;
 b=q+dCX7K4eknDvwrADEa95+w2NiuhwHv05ALnrOtK5wDYUD5UFhZFODyLT8rpZ0BbM1
 bW971Nem1zCF48Rt35mzwFf/jsMbALzc8aQ0uBsTv9X+702NTs+0zTjOnbJW228V+42b
 emVDHsT3XddkSeiU+zZx/QXZUwLshkqf8LoLRqpttOBkC8ghApy5TKgaeriUOIlfG8/M
 0mCFCPtFAjYhQP76UVnMbOgsfkLuAxF509grvvqc3joODyk7DwwJ93GoRfGkNptzmium
 LJQ4aIKJi76qIOku6w9kFNy3MstHT7m/x1zOU1CPXzax7bpm2fdtmF36KsilrmenRoqk
 qUYQ==
X-Gm-Message-State: AOAM533WmMkyFWGeWdGcZ3N2PSu7Hwgg7PvKp1KePT+7zHFCBUsn9fNx
 iAfI1Xmqb+UVUVxgxzYFdXUDzQ3SehHnpDuNjrzIJQ==
X-Google-Smtp-Source: ABdhPJyfvYib4PeBvldMr45WaNJUn9d0szw+m4r3gQvhxDYWf7h78gUBTUR4Tz9aV7SCUvVQadsOTy78MLEja6PP/v4=
X-Received: by 2002:ab0:2695:0:b0:352:5fc9:4132 with SMTP id
 t21-20020ab02695000000b003525fc94132mr9194787uao.29.1648457711122; Mon, 28
 Mar 2022 01:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
In-Reply-To: <20220328000915.15041-1-ansuelsmth@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 28 Mar 2022 17:55:00 +0900
Message-ID: <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 31 Mar 2022 08:56:02 +1100
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
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Ansuel

On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Hi,
> as the title say, the intention of this ""series"" is to finally categorize
> the ARM dts directory in subdirectory for each oem.

While I agree with this change and think it's for the good (browsing
the ARM dts directory at the moment is frustrating..) I think
buildroot and others need to be told about this as it'll potentially
break their kernel build scripting for ARM and probably messes up the
configs they have for existing boards.

>  arch/arm/boot/dts/mstart/Makefile             |   10 +
>  .../mstar-infinity-breadbee-common.dtsi       |    0
>  .../mstar-infinity-msc313-breadbee_crust.dts  |    0
>  .../{ => mstart}/mstar-infinity-msc313.dtsi   |    0
>  .../boot/dts/{ => mstart}/mstar-infinity.dtsi |    0
>  .../mstar-infinity2m-ssd201-som2d01.dtsi      |    0
>  ...nfinity2m-ssd202d-100ask-dongshanpione.dts |    0
>  .../mstar-infinity2m-ssd202d-miyoo-mini.dts   |    0
>  .../mstar-infinity2m-ssd202d-ssd201htv2.dts   |    0
>  .../mstar-infinity2m-ssd202d-unitv2.dts       |    0
>  ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts |    0
>  ...ity2m-ssd202d-wirelesstag-ido-som2d01.dtsi |    0
>  .../mstar-infinity2m-ssd202d.dtsi             |    0
>  .../mstar-infinity2m-ssd20xd.dtsi             |    0
>  .../dts/{ => mstart}/mstar-infinity2m.dtsi    |    0
>  .../mstar-infinity3-msc313e-breadbee.dts      |    0
>  .../{ => mstart}/mstar-infinity3-msc313e.dtsi |    0
>  .../dts/{ => mstart}/mstar-infinity3.dtsi     |    0
>  .../mstar-mercury5-ssc8336n-midrived08.dts    |    0
>  .../{ => mstart}/mstar-mercury5-ssc8336n.dtsi |    0
>  .../boot/dts/{ => mstart}/mstar-mercury5.dtsi |    0
>  arch/arm/boot/dts/{ => mstart}/mstar-v7.dtsi  |    0

s/mstart/mstar/

Cheers,

Daniel
