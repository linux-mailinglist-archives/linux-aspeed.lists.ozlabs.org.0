Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F52B3CDE
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 07:14:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJgp4tqQzDqLf
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 17:14:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fP6vSsOX; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJgg5BcwzDqQ1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Nov 2020 17:14:23 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id o66so2546517qkd.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Nov 2020 22:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gviu029IUTZcefVLfZeomA1jSzTP/vwpt9wwXVnDh54=;
 b=fP6vSsOXqHI5ONHbB/LAyl/UeyOobLvy0HI1/nScnj3DBmvVynFilN5RwNPIGKujsc
 8eEF/Q2hMYTN2F6B7Exk29xz7Kvic69142n2eZb49oyGvwJe724tOBDruBkS//jFrfMa
 c+YheYtF1HSLHaEAlwtvqDHMhluXFRYVwTLPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gviu029IUTZcefVLfZeomA1jSzTP/vwpt9wwXVnDh54=;
 b=cOon78UsEyZAW4vh4kCwgSksBpCBpUwf9i65h/igqKyfLmI8ZHK9ahQarDVSs0Ui9G
 eAC2aRJRkKg+Aq4JSG4jIrhYp9OJGhlIi7evGZfAWn4g9/vL59mr6oTFE6j0Y4ot3X0T
 ciz5jEhEmxEZkHJcnTht9jo2jSnscMIJjY3SbhA4jPJCYQFY19WFamrybg8XdHSgoZLk
 ZXRj+3jBaBw2U1XEjEqEIkOsuk42S3mTND9VYNjfqILdaoIHPUkvBRhH3vf2u+C6kFQJ
 UhtvoxTzJNhPNOnQONS779/alfmN7AydNivTynOPc7BHFgDOPobaj81GYQ+GTQvordJb
 phxQ==
X-Gm-Message-State: AOAM5301ZAnFJY8ApPACi6Qqqjz9N9DWsNo9Qq3Uwo+883xszc0kBL2d
 qgz5YnYJyYviN+WaUbkoehKKmRm+TVo5+ZIHnYg=
X-Google-Smtp-Source: ABdhPJxHOxp6ldhR04za+G01MZh65Kwl3vECb6VAUk6UeqPvhFMIiZ5iyvG5qQhxKlB/nhuRZ8M1UXk4FMhMslivTcA=
X-Received: by 2002:a05:620a:7e8:: with SMTP id
 k8mr12692677qkk.273.1605507261007; 
 Sun, 15 Nov 2020 22:14:21 -0800 (PST)
MIME-Version: 1.0
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 06:14:08 +0000
Message-ID: <CACPK8XchiV5OO0zLAUm9VPbOXNLQnKy-0=zj4=juLx2HS=BTZw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: dts: aspeed: rainier: Add Operator Panel LEDs
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
> These LEDs are on the operator panel and are connected via
> a PCA9551 I2C expander.
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 21ae880..64d8748 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -122,6 +122,38 @@
>                         reg = <3>;
>                 };
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               /* System ID LED that is at front on Op Panel */
> +               front-sys-id0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System Attention Indicator ID LED that is at front on Op Panel */
> +               front-check-log0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure Fault LED that is at front on Op Panel */
> +               front-enc-fault1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System PowerOn LED that is at front on Op Panel */
> +               front-sys-pwron0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 3 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> @@ -838,6 +870,56 @@
>                 };
>         };
>
> +       pca_oppanel: pca9551@60 {
> +               compatible = "nxp,pca9551";
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
> +       };
> +
>         ibm-panel@62 {
>                 compatible = "ibm,op-panel";
>                 reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
> --
> 1.8.3.1
>
