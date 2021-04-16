Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9FE3617DE
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 04:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM16h3kK3z30QX
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 12:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=F1jVfXS7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=F1jVfXS7; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM16f1DMpz2xYl
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 12:55:36 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id m16so19214864qtx.9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suL1dnZ+yJPZCMAJ4Juw2WYLXt8ud7bqHuYeTFy760Y=;
 b=F1jVfXS7MPMczBX9Ht5uH8AxLh6pAd5Su23muuHP3C9tVk7MRtPXI147skyXKIFckd
 HgeAOTGile7OpFTWPexrb7eB5snaT1qtUJ+gMaxkGr21L+WGYWxzZgJX4eZY2evI0o5W
 aOC6o8X4Cva6IL3DucjUIGuXdKTiSz0qLWd5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suL1dnZ+yJPZCMAJ4Juw2WYLXt8ud7bqHuYeTFy760Y=;
 b=iWZsYsBv2D+zdH/tDMq260Ct8Djf2D/e4yUi8PVJf3bOr8cACbZjC0d3GLXZgqCw7/
 XdhZAxWDjqzyaOBVwUnwI2vSsD6PyJ6X74I3lxIwRll5HruQKoA3l2MXeo6fD+ZUHo3s
 zoa+8ah4ZhqFLkEp3c5eeA8miEQYUnePX+GAnIRAK7zt1B/6JvdZiCQW4yrkivj78pie
 qoHid3b3lebjRojF2muu+EaUUUvbD0poPKfpK7Ew1qcfrU+B8Lkb6UjAoM8n/yZ/5IOI
 nDICrix4MZlQQbVD3bqwaKuWtVwkzB6rcmFw3l25AflRFOId3BREWW+uzGeY3pUjH/iY
 WEgw==
X-Gm-Message-State: AOAM5336Aq8YVYz/cDJ6ORtiBCvqE4P1mX8QsZdDS2dOelax73WL0Wmn
 USX4jijoq1FAuED1DDBAcelgQNtIu6tmzn6CSAo=
X-Google-Smtp-Source: ABdhPJwBl5oTwfqjVBgI2UrXXXs/eahKVwoG8bPYGUxhDqljBmSbkoivKoCvbd1/Rw62YcXC9b2FklRA4+mF8+pB6fI=
X-Received: by 2002:a05:622a:589:: with SMTP id
 c9mr5979265qtb.363.1618541733396; 
 Thu, 15 Apr 2021 19:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210415155300.1135-1-aladyshev22@gmail.com>
In-Reply-To: <20210415155300.1135-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 02:55:17 +0000
Message-ID: <CACPK8XedxKUpgtXCzsmdHw7-U+ySzHmvvb8mGE8QJcxQrEMayg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 15 Apr 2021 at 15:53, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Enable all I2C busses that are used in AMD EthanolX CRB:
>  i2c0 - APML P0
>  i2c1 - APML P1
>  i2c2 - FPGA
>  i2c3 - 24LC128 EEPROM
>  i2c4 - P0 Power regulators
>  i2c5 - P1 Power regulators
>  i2c6 - P0/P1 Thermal diode
>  i2c7 - Thermal Sensors
>  i2c8 - BMC I2C
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Thanks, applied.

> ---
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index ac2d04cfaf2f..6aeb47c44eba 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -151,6 +151,31 @@ &i2c1 {
>         status = "okay";
>  };
>
> +//FPGA
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +//24LC128 EEPROM
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +//P0 Power regulators
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +//P1 Power regulators
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +//P0/P1 Thermal diode
> +&i2c6 {
> +       status = "okay";
> +};
> +
>  // Thermal Sensors
>  &i2c7 {
>         status = "okay";
> @@ -196,6 +221,11 @@ lm75a@4f {
>         };
>  };
>
> +//BMC I2C
> +&i2c8 {
> +       status = "okay";
> +};
> +
>  &kcs1 {
>         status = "okay";
>         aspeed,lpc-io-reg = <0x60>;
> --
> 2.25.1
>
