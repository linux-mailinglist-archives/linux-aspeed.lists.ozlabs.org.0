Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C814B6316
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 06:49:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVWv3dDQz3cBl
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 16:48:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IcAfk0jc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IcAfk0jc; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyVWp4nCwz2xt0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 16:48:53 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id o25so16421540qkj.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Feb 2022 21:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bieAi62cXnjDaF9+psLIoa3qnNdCxk47hpRhQbwd4wU=;
 b=IcAfk0jc1uGalEZyNKcu/DnhhORNIOmxpzX7ZDMzgsIdfu1L91dKVfT0TFxsmYkPwd
 mf2VfdVvDtCJNrcolCauEeoaH8aavJnzW19a3oD31qX0GpWYzKUBKgO2PyVgjY/95y4A
 rLKsi0/g2XXR1Nh6Z/2VojL6qmfmS3iNzZw84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bieAi62cXnjDaF9+psLIoa3qnNdCxk47hpRhQbwd4wU=;
 b=riA4yae7AE8cNhqeCWw2jFr34cAA7G3d+BuqrcxdqE/FrqDfGnfc2nGa1QEKQkbNUB
 ZFcVY7FIqM/X2DgcFZeXX3wLCsvOZs1n4qJChKquyRR+Rmlcc3k8/g4O1mVmqyanq/Z4
 G+KRgwus3i5vvrERkgSpYMDBGapSbSZIjb0cGoffHWeXU1Hq5KLwSVWh+yh0uFp9W3iq
 KvdSyclo9iGgYcUkEJL1+6v78J9eHWENeLOxXrq1Nol/kpFrmdT/smZbw32UkQmqBhH7
 B7NbCr7l7pJ5WGoLZNZJZNqcPSQRMpfu7xQNez7wSsEL4f7jq+LbfqXoBBevecW63w83
 cZMg==
X-Gm-Message-State: AOAM533u/EAahIE1G4RDkWD8v4iXwIZCg2RtjAVCPJqcXjK9OXOZMu7/
 N0efLZVJQfws8m2QkeQW1yPkYsRZoniuZPjd+2E=
X-Google-Smtp-Source: ABdhPJy0ddCs9WvjiZC4lM/FmWkHalSgAFzYH2nlatPRqwypfGD87kBmI2t4pz4vDpeqbPGkslg0MS8a2lVsbnJXbNs=
X-Received: by 2002:a05:620a:44c7:: with SMTP id
 y7mr1245865qkp.347.1644904129664; 
 Mon, 14 Feb 2022 21:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20220214042538.12132-1-potin.lai@quantatw.com>
 <20220214042538.12132-6-potin.lai@quantatw.com>
In-Reply-To: <20220214042538.12132-6-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Feb 2022 05:48:37 +0000
Message-ID: <CACPK8Xf5W4h=dcBg_Pe1zjXUK73h8YH1tfL4RvoxV3DVsCL90g@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arch: arm: dts: bletchley: switch to spi-gpio
 for spi2
To: Potin Lai <potin.lai@quantatw.com>
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
 Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 14 Feb 2022 at 04:26, Potin Lai <potin.lai@quantatw.com> wrote:
>
> Switch to spi-gpio driver to avoid unstable signal issue with EVT HW
>
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> index b01f1e7adb81..3c54e4a892c9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> @@ -227,8 +227,16 @@
>
>  &spi2 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_spi2_default>;
> +
> +       compatible = "spi-gpio";

This is a bit strange. You're effectively rewriting the node with a new one.

It would make more sense to leave spi2 disabled (the default), and add
a new node:

 spi {
   compatible = "spi-gpio";
   #address-cells = <1>;
   #size-cells = <0>;
   gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
   gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
   gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
   num-chipselects = <1>;
  cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;

   flash@0 {
       status = "okay";

etc.

Your new spi node doesn't need the pinctrl or clock properties.

> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
> +       gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
> +       gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
> +       num-chipselects = <1>;
> +       cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
>
>         flash@0 {
>                 status = "okay";
> --
> 2.17.1
>
