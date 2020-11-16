Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629F2B3CDD
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 07:14:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJgj2d2KzDqLh
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 17:14:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AKi1im/N; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJgY4TF8zDqP4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Nov 2020 17:14:17 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q5so15890424qkc.12
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Nov 2020 22:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A0WUX4g4NY4uKueayHkcXzqCRIBlv3Wwx1A5Wv5T3KU=;
 b=AKi1im/N8HmsEEuquAQbf+zczPV7Li1vDssMcBSSGJieaUcHcKqA/GJSShaZnfSQt1
 Y1LUR1l4emwXjNttNjoqzyichTMVUBSMoNu+mdu7ocx0PCHKd5tjol0FCEgkI6YAbc9Y
 tKb1r916IOx99xQ1Nb6jTdsANZGOGFTnT6Ov8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A0WUX4g4NY4uKueayHkcXzqCRIBlv3Wwx1A5Wv5T3KU=;
 b=Ojod8IWj18D27afM233Q5M6P7Q10MHfkuyPsq8cv6XjW9piYYQQGe35b9sz4wlnA6N
 N42FtFr3+7OqoCDQbnObGR/yl+wtrYVRZ3HhLG1AVHz4MzYnHCnRUuq7fb3NrzQNmVNF
 C4I9+o2vTSaT5GQ8NYx68D1nkmVCbCLoWuyaqsOFo0qiNnK6tqnm1XOi8VR9Ogyar4II
 QXcoz/4MrdhfvvR74eIvCBfGQUDiCoanjyLONwKOX6oILONli4FwJsgx4LPutuQw4QBR
 K5CYsd+5GKytWCbTpDQkHTmUXNhcFo7clbX7744eamg0LkzjZVyHFcoA+W8FWDWpRP6D
 H/eA==
X-Gm-Message-State: AOAM532+sIJ9HF+2JkRTSRxy/ZSqgV9ZG1inRSGNXiaS4qUUeVqlwhkK
 6Z21Tw465gQE/JRCKtpT3SV8K9/DGlBB5Fmp2F8=
X-Google-Smtp-Source: ABdhPJzEk2sISyDAO75ptzfftXj/wFl6HlJ2oKhoGPesAzFw+FTP2IrHrT/YMYLD5mj9fE0/6BV146zRojjp54P54Rg=
X-Received: by 2002:a37:4a4d:: with SMTP id x74mr13150131qka.55.1605507254426; 
 Sun, 15 Nov 2020 22:14:14 -0800 (PST)
MIME-Version: 1.0
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-5-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1605247168-1028-5-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 06:14:02 +0000
Message-ID: <CACPK8XfzTzDDvoEqLW3YEspqHYuFz15zoeCaMbkzsEq87dXbVA@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: aspeed: rainier: Add leds on optional DASD
 cards
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 13 Nov 2020 at 05:59, Vishwanatha Subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
> These cards are not hot pluggable and must be installed
> prior to boot. LEDs on these are controlled by PCA9552
> I2C expander
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 426 +++++++++++++++++++++++++++
>  1 file changed, 426 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 88fefc0..67c8c40 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -540,6 +540,162 @@
>                         gpios = <&pic4 15 GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       leds-optional-dasd-pyramid0 {
> +               compatible = "gpio-leds";
> +
> +               nvme0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme3 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme4 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme5 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme6 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme7 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 7 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-dasd-pyramid1 {
> +               compatible = "gpio-leds";
> +
> +               nvme8 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme9 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme10 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme11 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme12 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme13 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme14 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme15 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 7 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-dasd-pyramid2 {
> +               compatible = "gpio-leds";
> +
> +               nvme16 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme17 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme18 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme19 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme20 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme21 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme22 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme23 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> @@ -1885,6 +2041,96 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> +
> +       pca2: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
>  };
>
>  &i2c14 {
> @@ -1894,6 +2140,96 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> +
> +       pca3: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
>  };
>
>  &i2c15 {
> @@ -1903,6 +2239,96 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> +
> +       pca4: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
>  };
>
>  &vuart1 {
> --
> 1.8.3.1
>
