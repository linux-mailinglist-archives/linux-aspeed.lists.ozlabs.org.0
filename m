Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43963445F04
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 05:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hln3D1YhNz2xCN
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 15:05:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=b2i5CsEm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=b2i5CsEm; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hln3807jxz2xYN
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 15:05:07 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id bu11so6719990qvb.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 21:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hOpqec9HAj9jc/h7EYjL2E/xFemoSEaVzq55rh5h1G0=;
 b=b2i5CsEmawrSp4+08EqRBkecvPNVR4RFKQpGU+0Xf9aHlg/iULVccpTMYT3/fxZUdO
 RYbQ+GQ/SzrwAAd5mNxwzunTf5QJBAclDgGGX6Yjemfz3hgwpoyIR+Ak6bqa9jWZI/w8
 6N0fSSQqaB5Wbkfn9TmARxFrBBiWszl/2RmNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hOpqec9HAj9jc/h7EYjL2E/xFemoSEaVzq55rh5h1G0=;
 b=C24UssegI+BN0Mdd2GdqVz1p8swQc0LQwlxcnkqVSg1eiv2X/nDrWX/l6kOQl6/vDo
 m7ipHBq84V4TK+yAD/GdnedzDeSWb2QuzHRALDT0K5yeDwYfmS1hsUWtc/jagbYo9vt3
 cdalTDLTGevhzErn8AfYyzY2/pH6aFbuE66MyuyAF8lR+UobYg4j2/x9k0yqQLKKjnkG
 JgkVsNOUKGa5ADT/TFAPvWuHQiVskZo/fbo1mqKMm2rqFqoaXGCQsGIR/GHa9XXekW4W
 Fnyrkwou2dSJm1eluEPRROW3iFaz13NUG2V8loAXhLfvj7MXjPK/2JgRFSmES3QqJ99V
 QYcQ==
X-Gm-Message-State: AOAM533h6wuwVxjY57EQV+GeBJAPwo0QMom5o3kkMsOAUhIw3F6r2IlD
 2XuO89vb8w1Dc115y5P/paFlMSK3BBHKIE0ehzI=
X-Google-Smtp-Source: ABdhPJwnces3XhrDwJCHcodu8Tn5LZ7tc0hq7XiLObCwHwZeJEuNgABrBIX1YSlCefqP2MTsmdykYniAn3Xcchnm9bk=
X-Received: by 2002:a05:6214:f2d:: with SMTP id
 iw13mr4449053qvb.13.1636085105549; 
 Thu, 04 Nov 2021 21:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211105032910.446492-1-osk@google.com>
In-Reply-To: <20211105032910.446492-1-osk@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Nov 2021 04:04:53 +0000
Message-ID: <CACPK8Xc7SAVamBrCgptiWgV7r52ysrWjtRCkOmgKu_5AWPrG9w@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
To: Oskar Senft <osk@google.com>
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 5 Nov 2021 at 03:29, Oskar Senft <osk@google.com> wrote:
>
> This change updates the configuration for the nct7802 hardware
> monitor to correctly configure its temperature sensors.
>
> Signed-off-by: Oskar Senft <osk@google.com>

Thanks, applied.


> ---
> Changes from PATCH v2:
> - Add missing address-cells, size-cells configuration.
> - Add missing new line between channel 0 and 1.
>
> Changes from PATCH v1:
> - Removed superfluous "status" from channels.
> ---
>  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> index 68f332ee1886..60ac6d3f03b5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -213,6 +213,30 @@ &i2c0 {
>         nct7802@28 {
>                 compatible = "nuvoton,nct7802";
>                 reg = <0x28>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               channel@0 { /* LTD */
> +                       reg = <0>;
> +               };
> +
> +               channel@1 { /* RTD1 */
> +                       reg = <1>;
> +                       sensor-type = "temperature";
> +                       temperature-mode = "thermistor";
> +               };
> +
> +               channel@2 { /* RTD2 */
> +                       reg = <2>;
> +                       sensor-type = "temperature";
> +                       temperature-mode = "thermistor";
> +               };
> +
> +               channel@3 { /* RTD3 */
> +                       reg = <3>;
> +                       sensor-type = "temperature";
> +               };
>         };
>
>         /* Also connected to:
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>
