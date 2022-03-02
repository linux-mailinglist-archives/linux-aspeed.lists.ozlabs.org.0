Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E742E4C9BCB
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 04:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7fG46kFWz3bnd
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 14:08:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LmkJ4nzw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LmkJ4nzw; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7fFx4yFMz30gk
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 14:08:36 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id f11so546651qvz.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Mar 2022 19:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQqrwFMPY5plGbddCnC14E9lxWyrfbG5ICWPNwpm/RM=;
 b=LmkJ4nzw/MELoRSNtv7sEIw35ccww6Tr7FyTGDd77VlakAkiEf6KMriBzFgjV3Dh9Q
 ut5EUs7nLlaXU+ZX7vCFbfbG67wFgGQivXloO/LKKkeV+6+Gx/XzBcFDm/J8GRFK6Sgj
 0DXOgdx/5jCtBgbbAvUzH5vOYvFSe71JlODdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQqrwFMPY5plGbddCnC14E9lxWyrfbG5ICWPNwpm/RM=;
 b=VjuNA8fF251mDjCwVVB4CDAMhG+GTWpz0RF2AIMfcgu6JRgXQgno/UJrXbswh7OzCF
 TQdpl1pHmlPffnVLsGLtfz9JH1NEfVmIp0ehdHoo8c6hDtd2e5l8aFNPAzaWKogPktmF
 PbYwcmRR01pZlQMOoDWVa0pzD1slcxK73PNM+MFM4V3HDmEsIC6wmOYCSJGiHYrEVZ0g
 IehRyM15ZRRrPrJ2m+YJADaCRMmPkq6FYJFSln75TbtmsuiTttPreODq1EsJXzfsxSB5
 nJYzsjxFv+lddAKPSqoX1jK8bTpm3dDf1wyHVccUqa3E18vQ/oo1+a/lC2Unp9YcBsZ2
 da+Q==
X-Gm-Message-State: AOAM533UqDV88850CfHL0ycdyFzD9iIl6OlUiJVndQKvuFd4zU5ozIBD
 dbx4dtCKCuXDfvBFx5UHx8VX/J1qnazhCJX/ZsA=
X-Google-Smtp-Source: ABdhPJztD0vIx1Wl0A9xT1RwV7lGsUr0ZEEv3QSKFr9EnK8lyK9xuR0wpsW6Xg66ZqVBWQ9OL8JSmp1eGkx1vZcag5k=
X-Received: by 2002:a05:6214:19c4:b0:432:8bd1:d8d7 with SMTP id
 j4-20020a05621419c400b004328bd1d8d7mr19678222qvc.65.1646190515132; Tue, 01
 Mar 2022 19:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
 <20220302024930.18758-6-tommy_huang@aspeedtech.com>
In-Reply-To: <20220302024930.18758-6-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 03:08:22 +0000
Message-ID: <CACPK8XcsLBrJo7W5y3sE_jGy9j4e6MPNcB26bJ4SB1ZhVuka+A@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] ARM: dtsi: aspeed: Modified gfx reset control
To: Tommy Haung <tommy_huang@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 02:50, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> Remove the ast2500-gfx from aspeed-g6.dtsi.
> In the AST2600, the ASPEED_RESET_CRT1 is replaced by
> ASPEED_RESET_GRAPHICS. This is no differnce between these two reset
> behavior but reigster location is changed. The HW controller states
> and FW programming resgiter will be reset by CRT reset controller bit
> (SCU040[13]). And another part HW controller will be reset by
> Graphics controller bit (SCU040[26]). These two reset bit need be
> de-assert then the SOC display will be active.
>
> Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>

You don't need this patch; the change should be part of the patch that
introduces the node. I'll fix that up when applying.

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index e38c3742761b..7cc99bc68558 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -352,7 +352,7 @@
>                         };
>
>                         gfx: display@1e6e6000 {
> -                               compatible = "aspeed,ast2600-gfx", "aspeed,ast2500-gfx", "syscon";
> +                               compatible = "aspeed,ast2600-gfx", "syscon";
>                                 reg = <0x1e6e6000 0x1000>;
>                                 reg-io-width = <4>;
>                                 clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
> --
> 2.17.1
>
