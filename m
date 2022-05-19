Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2852D3B8
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 15:16:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3r2s04pPz302W
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 23:16:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ExHb+cFq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ExHb+cFq; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3r2j5jL3z2xXS
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 May 2022 23:15:57 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso5024116wma.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 May 2022 06:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pp2u8adaeiVjAOQPo7uviaRpGC989a2Z1dhW4/bgQQE=;
 b=ExHb+cFqw/V7KxYvQxunB9ssbGzkJEkN9HDCfEsGMGljtEJ4yZyNaZ2oqfJv9FjbaD
 lmTEhrgAVMmUv7tvcr8yF2RONlTPix//ON0GPv4iK/+ugRfJN3F4yTb3JjHEM6xjhvQt
 5Mw+SxC5kqJPvIqGtoQiAcxyQpD2PCX0VBwdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pp2u8adaeiVjAOQPo7uviaRpGC989a2Z1dhW4/bgQQE=;
 b=aCaWAglQCqnDomFNTCb4kNpkg18N8aqF2VZ1WiL/xbk+E4qtVdrD+w26VPJXsNaPmT
 4Koj2J8U0Cu4vB1F+rY6Ck42CAbQ/moHNp2mqkS5/9D+51djz22DOoy2wIhuyFoajYsd
 dTJPRkSTUzB3W6411QcJ94xCDlFBryzJgUulK3vTkUHzuDwi6MEBhcqSicKbS3z+ICu5
 UKCsSBTvq7iiYkYNguYb9bZ+q+Sfs2S4crV/VJYKFCiXvqct0BchIWXIC6TU20Y4sYJe
 iGNzlg0FB7Klj9gukFZgTwWxVqzabJu7nlXBrS54HF6AoI04bTEBs5KTd8yrjpp15HR6
 bW2A==
X-Gm-Message-State: AOAM533K5H3V2oumVCmJRR9M2iqCKUQ07kTM3IFY5oTarmvEZRZgZgju
 v64wJMjRHQUk22lVFgo2EXcyvjuRxib7bb8022oQGG7YCLo=
X-Google-Smtp-Source: ABdhPJyARNN9JGSBx0lw6/N1VuA9RmZVUqBJDIG99T/jhQsAgNiWljmPf8WtCPtRbG+p4MrHeMq+oKFUA4a7VGMnMkY=
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr3658957wmj.171.1652966152666; Thu, 19
 May 2022 06:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR06MB23155E8A6193118544A7DBF3E61E9@SG2PR06MB2315.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB23155E8A6193118544A7DBF3E61E9@SG2PR06MB2315.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 May 2022 13:15:41 +0000
Message-ID: <CACPK8Xev-AYtrWzZyMGj8eBkTP2YXjnX=M+4UUGgfRZYeGMPtA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: aspeed: ast2600-evb: Enable virtual hub
To: Howard Chiu <howard_chiu@aspeedtech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 29 Mar 2022 at 03:24, Howard Chiu <howard_chiu@aspeedtech.com> wrote:
>
> Enable Aspeed VHub for HID emulation
>
> Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 158b88f38d2c..b98cdad86e90 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -314,6 +314,11 @@ &sdhci1 {
>         clk-phase-sd-hs = <7>, <200>;
>  };
>
> +&vhub {
> +       status = "okay";
> +       pinctrl-names = "default";
> +};

When booting with this patch applied we see:

[    1.596377] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: pin A4
already requested by 1e6a1000.usb; cannot claim for 1e6a0000.usb-vhub
[    1.596678] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: pin-252
(1e6a0000.usb-vhub) status -22
[    1.596947] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: could not
request pin 252 (A4) from group USBA  on device aspeed-g6-pinctrl
[    1.597238] aspeed_vhub 1e6a0000.usb-vhub: Error applying setting,
reverse things back


> +
>  &video {
>         status = "okay";
>         memory-region = <&video_engine_memory>;
> --
> 2.25.1
>
