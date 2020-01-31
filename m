Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D014E7B6
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2020 04:56:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4883Lf2PH5zDqdR
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2020 14:56:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=crNbZOH9; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4883LX2cs5zDqcV
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Jan 2020 14:56:35 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id n17so3241267qtv.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jan 2020 19:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=giaaas3saM7ZnV4c4smX1JcgTAL1YeM8DtaRFKtNHgc=;
 b=crNbZOH9Ed0ABdlKTXB1vBiOXKB7+GjFPPrcykjonbeRhA77dU4D95buRmuSb/HrTf
 lhpOiS4cAAUqZgxGlqbJ+h4wqsWTzf2wpwTyEHHJeDGT2l1kYposPBEuTywoKwmbtOj4
 YAfplw+l3R8Uxp67cX3Khtk28NkYrLFgNldho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=giaaas3saM7ZnV4c4smX1JcgTAL1YeM8DtaRFKtNHgc=;
 b=CZ4RaZ+U60K8MmQug6Sw0UB72HbW+fGT424WK+n7s5sXE4z69lElIyY7zY0ynWdxmv
 WUbXR/qSn0980Iw+vXoi+xu75mm4Kl4ivqA0ZVYbUZ+dVMjpWc+3Q6s0WyM2zrbEUk33
 M06LIBIshQjSuzANhac+Pllf9QbClCi/FQ/ZwQk3GeGLq0EHge9PlcYnR5KNf9D0UBRb
 On3na4rnAC+UfNUlWYadoMU5gRR/1RS0M4uhu/A8E9i92PUrboGQH4UwOjnttuyAEh3s
 Sfg4MO6c73zPAt95t/1fZ92B5fPihB+J2PGQQFRX51FvPkCk2gYv6U71gSGdcxJItY1g
 9AQg==
X-Gm-Message-State: APjAAAWPexYLR2QJ4qxfUk9IPM3h7GvNmk4XOzdOzJGhqnCwJ+8doFU1
 VJ09UKg4Qk6JpG4Syps6hF1FENtgQgwbq8P0E8o=
X-Google-Smtp-Source: APXvYqzuY2q7VtjMI43kwIjVulHF6td/oZnRE/hNAX7gUXypAD+c+GinBXcwLLN5Y0oaVYyv8JfSq5V15f8talvX9lw=
X-Received: by 2002:aed:3b3b:: with SMTP id p56mr8919865qte.234.1580442992161; 
 Thu, 30 Jan 2020 19:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20200128011728.4092945-1-vijaykhemka@fb.com>
In-Reply-To: <20200128011728.4092945-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Jan 2020 03:56:20 +0000
Message-ID: <CACPK8Xc6TbHLgWO3p7YXJf+jfzNhiGzGsdDwQsQ56ix8sUQGzg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: tiogapass: Add IPMB device
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Sai Dasari <sdasari@fb.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jan 2020 at 01:17, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Adding IPMB devices for facebook tiogapass platform.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will merge this through the aspeed tree for 5.7.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index fb7f034d5db2..719c130a198c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -5,6 +5,7 @@
>
>  #include "aspeed-g5.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
>
>  / {
>         model = "Facebook TiogaPass BMC";
> @@ -428,6 +429,11 @@
>  &i2c4 {
>         status = "okay";
>         // BMC Debug Header
> +       ipmb0@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
>  };
>
>  &i2c5 {
> @@ -509,6 +515,11 @@
>  &i2c9 {
>         status = "okay";
>         //USB Debug Connector
> +       ipmb0@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
>  };
>
>  &pwm_tacho {
> --
> 2.17.1
>
