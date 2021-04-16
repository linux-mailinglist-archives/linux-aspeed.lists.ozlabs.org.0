Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8423617E5
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 04:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM17n2sqWz30QX
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 12:56:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=O+Z3IpOW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=O+Z3IpOW; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM17l6Rwqz2xYl
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 12:56:35 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id f12so19879883qtf.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 19:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnkm67rG/2HcFfj+lsSeDL4hn/hfKuiZIPnLkwTSDlk=;
 b=O+Z3IpOWsKS5ISWSN18gt5XrPXPcHuFe+UtxG5eFnqYsgu5ngJ7gGJTk0UaiAQ0F/e
 OOPRR51hflQzxcuYTf3wOLFCvV8coI0aQjLapQBWS2ADxk622pl+lRdRc26rAF5lT3MY
 v0oC522LX1NDpOOxLY5aO3QAZXv1KC8uWla3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnkm67rG/2HcFfj+lsSeDL4hn/hfKuiZIPnLkwTSDlk=;
 b=SrJNTyqWflJYJAP/hfyGjbquPc9JjJby0X0R/jXF2Xegx0q7M06rpjbqpecOM857IN
 ZBz6ETsXs8mlrLXCw8O34yTVBAbbE3o8t7EpzeEZPfGpE00Z8pKJqoPDbsr3r4rcJmq5
 SevF8JKUMRPd8tK7bnbOmvImW9OZtKs8+ZCFBisNRO3yd66pJsRQMADyUkE8Rujmuhov
 caF8VEH5huPQ0WKL78k3K8SBDBYH3TZa76YtQvisFPUdusjhiH32GFlX4IsP8Ka8U+o1
 wqfIe1WDGfJaSEfRZyTEUlZI63p+pN8e70/J08Kl4RaqI0Qlb8+tSUfnAOxfVITjAWEk
 +4Bw==
X-Gm-Message-State: AOAM532G1wSMN5BQyNx7Z71up2UVxpWCHltK6AlzGkHoQd3m3feszK5Q
 mxYw/lWiNQvQfYJBupmgFfgvZq13m6JOdI2h7Nk=
X-Google-Smtp-Source: ABdhPJwFIt3wjYFboTIvXYmV9ErYew+4zrMSmwJwwWeusCEXWE8ryNdMaN8pfdSl/vhlCW6ZUgTbG1XGmasTQrvwkdg=
X-Received: by 2002:a05:622a:d3:: with SMTP id
 p19mr5901374qtw.385.1618541793208; 
 Thu, 15 Apr 2021 19:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210415140521.11352-1-fercerpav@gmail.com>
In-Reply-To: <20210415140521.11352-1-fercerpav@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 02:56:21 +0000
Message-ID: <CACPK8Xft_59tCyYnMqx10ZcSnMFZjd1MWCEEr1XYcfX-zMcV=w@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed: tiogapass: add hotplug controller
To: Paul Fertser <fercerpav@gmail.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 15 Apr 2021 at 14:05, Paul Fertser <fercerpav@gmail.com> wrote:
>
> The ADM1278 IC is accessible on I2C bus and on both Wiwynn and Quanta
> Tioga Pass implementations a pair of parallel 0.5 mOhm resistors is used
> for current measurement.
>
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>

Thanks, applied.

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index 3cc2004fa2f2..500661956dea 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -591,6 +591,11 @@
>  &i2c7 {
>         status = "okay";
>         //HSC, AirMax Conn A
> +       adm1278@0x45 {
> +               compatible = "adm1275";
> +               reg = <0x45>;
> +               shunt-resistor-micro-ohms = <250>;
> +       };
>  };
>
>  &i2c8 {
> --
> 2.17.1
>
