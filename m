Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F7262784
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Sep 2020 08:57:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmXrj2KGMzDqSr
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Sep 2020 16:57:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mYuIK7PT; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmXrX6hMqzDqQY
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Sep 2020 16:57:14 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id a12so1472435eds.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Sep 2020 23:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aucFnAaA6n54SqN2ylDW2Uq1+nK592raJ0MmLzBKiSs=;
 b=mYuIK7PT4ChKZXdBvVrAd7YKq7i/4lwweyhypREg+ye6C6cYuYWQo2zLiWiUGH+tWe
 6q6Clmjyx92I7Ed1bHBx7IQzZQc90V8ILbwtoZk/4SAT8ccv3Jo/4cM6wi8z41LJ4v3l
 DSWkf02+8QQ86flhs7lTLOQvzv0X58zrRLhLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aucFnAaA6n54SqN2ylDW2Uq1+nK592raJ0MmLzBKiSs=;
 b=PxPgszl6vESCidPIra4kUDLBWTEINXljoejqceDqWAFZG0Ztxj5B2dhMq20GgE78gp
 QOeK5LuCPq5uwzF3wuNKgVoMjGaH15k5DdttnzbzDrN/91qF/h2ND3XGhctN+yU26Swf
 uxM3uXQgw9fSSCIgi4VOigarYtnjWno+lDLCKSaRd8KGNNVzK0QV7H0Z2olJG104vfUL
 ulO4L0GWBCccPFMFipdUs1fMINcrg9IjnybWnjgCQg3/Zj4fJ2HBAGb/jB0m0Kgp9Dh2
 WTbDsafwsd04pA8lTRZRL3lkQQIg3LBe0K0bUE93CHhEnBTPiA+C2+4evXPJK53zbKzJ
 EbmA==
X-Gm-Message-State: AOAM533P/16KerbxTiL6U+UDDTjIpZ7tlkNBaCEJ2DMclvuh48H8iEs0
 v0aVDDmm3ccavQlaPsuKyoDYZXT1TjUBTR13W1o=
X-Google-Smtp-Source: ABdhPJwPlzh1DnLGo9MSTT8J/yrnEnx7UmuC9FQVeFtz+arOOvvLH5XkI0R9H39kuPOE/iZLcwtZShJUK72WQR+TAXI=
X-Received: by 2002:a05:6402:ca7:: with SMTP id
 cn7mr2599331edb.143.1599634629657; 
 Tue, 08 Sep 2020 23:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200908200101.64974-1-eajames@linux.ibm.com>
 <20200908200101.64974-5-eajames@linux.ibm.com>
In-Reply-To: <20200908200101.64974-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Sep 2020 06:56:57 +0000
Message-ID: <CACPK8Xf0z4kz9JkTWPKveQsmEpKq0YtEQ+1Jracndu9g9UW7ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel
 I2C device
To: Eddie James <eajames@linux.ibm.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, dmitry.torokhov@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, wsa@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Sep 2020 at 20:01, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set I2C bus 0 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I will take this and the rainier dts patch through the aspeed tree so
we don't get conflicts.

Eddie, when you send v3, you can omit them.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 5f4ee67ac787..4d070d6ba09f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -4,6 +4,7 @@
>
>  #include "aspeed-g6.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
>  #include <dt-bindings/leds/leds-pca955x.h>
>
>  / {
> @@ -438,7 +439,13 @@ aliases {
>  };
>
>  &i2c0 {
> +       multi-master;
>         status = "okay";
> +
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
> +       };
>  };
>
>  &i2c1 {
> --
> 2.26.2
>
