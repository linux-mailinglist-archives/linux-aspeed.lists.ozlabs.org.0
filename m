Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0062D162
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Nov 2022 04:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCPpb0mYvz3cMJ
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Nov 2022 14:02:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=C2jhk9al;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=C2jhk9al;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCPpP6Pk7z3cLF;
	Thu, 17 Nov 2022 14:02:03 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so706540wmg.2;
        Wed, 16 Nov 2022 19:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oZNyOtjou7UGJa2BliLM3P7z/CgeMGDCK77AaNy+wyQ=;
        b=C2jhk9alJDbZ5zE2SEo1NUOVF583b2PxjyxmXI5EDaCEimWEeZn2/rHcTvHgV2DaGt
         WDY4CH0W4wb0jqG3tSeTV2vcZjeTa9t/iKjPs/MGiKk6C+ZYPelvaw1l5GJE16xIcmIz
         KCxTB43Hz/DU5YZXIkjtjitro4guGbjADT4YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZNyOtjou7UGJa2BliLM3P7z/CgeMGDCK77AaNy+wyQ=;
        b=W2Up6WE2tiEXCmG+qOfSPNzDb16Dbb3ckBZXaGg7fO9nHMwGnwZGymORABwWviVubu
         eub0BiHWESTFS+F49Egci0gDgn8Y7II/KmDxqjVvwap+pXLKTc6H4Xe00Hvuc9NTxQxT
         rOVUHQC2dg5J+/pjD1ApIQ52BeQhrSd6qprEg3M3vjNZIEPhOzldu6kp4WnDQ/Ls/pwN
         FHYPaZxX4dnDOZqiXbsHmlkuysJMlMdjAjt2sO3ruvyvpts5lpJ8JG8bja64+yxPQnSn
         RXZnjokR/V4iDV2m9BNB4TgfOAwKM401HeIkrnYzM8AM4GHKBRKq0PEEZH+VSsXwJG0P
         7iBw==
X-Gm-Message-State: ANoB5plIrHWZkErdr+0cqzRm1QLou+XfCEuxhiQp0thMNz0fY7Hb5FdI
	rKIC3FpljxpbeTaaw1KR7UAPWLZd5mHVIzZsZB8=
X-Google-Smtp-Source: AA0mqf5i0jUWFC4j+cDibzi3Vs644huDdFdGP0IPBdvtnKtWfTcCOdK582I2KflVIQxdgy1oF4QmbhOO9vJplBbSQxc=
X-Received: by 2002:a7b:cb83:0:b0:3cf:96da:3846 with SMTP id
 m3-20020a7bcb83000000b003cf96da3846mr3757718wmi.10.1668654117812; Wed, 16 Nov
 2022 19:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20221024081115.3320584-1-quan@os.amperecomputing.com> <781ea7c7-b33e-f054-71eb-d760f7a01301@os.amperecomputing.com>
In-Reply-To: <781ea7c7-b33e-f054-71eb-d760f7a01301@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2022 03:01:45 +0000
Message-ID: <CACPK8XcCKK_o0hBA82k0CEcpbHXbHcUii3bgoGvHaGvtw2Q_Ww@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade,mtmitchell: Add BMC SSIF nodes
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 16 Nov 2022 at 07:06, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
>
> Just a gentle ping about this patch.
>
> Thanks and best regards,
> - Quan
>
> On 24/10/2022 15:11, Quan Nguyen wrote:
> > Add BMC SSIF node to support IPMI in-band communication.
> >
> > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Applied, thanks.


> > ---
> >   arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 4 ++++
> >   arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 4 ++++
> >   2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> > index d127cbcc7998..353359822d7b 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> > @@ -342,6 +342,10 @@ &mac1 {
> >
> >   &i2c0 {
> >       status = "okay";
> > +     ssif-bmc@10 {
> > +             compatible = "ssif-bmc";
> > +             reg = <0x10>;
> > +     };
> >   };
> >
> >   &i2c1 {
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> > index 606cd4be245a..4b91600eaf62 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> > @@ -445,6 +445,10 @@ &i2c9 {
> >
> >   &i2c11 {
> >       status = "okay";
> > +     ssif-bmc@10 {
> > +             compatible = "ssif-bmc";
> > +             reg = <0x10>;
> > +     };
> >   };
> >
> >   &i2c14 {
