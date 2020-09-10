Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8275263ABA
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 04:42:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn38P0T99zDqbG
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 12:42:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mWO6yxyl; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn38H41ZCzDqY5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 12:42:39 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id l63so4705786edl.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Sep 2020 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IV24EMooKIdI1/XvCM1HiUrz4TlPj+AnTpwU1/6j+Fs=;
 b=mWO6yxylw5PrvytFJ8u0boPEDxdTeiaoYmRzeT/uCBQ8/QFlbRfV1kV6i9EY6Z4BEd
 QRREVP9cHw0qx5Cq+pWhmbmW1yobRKr1CllHpkaCfuhaNnn0UI3I5hNUVU4z86QyqE0e
 f9k/LXU/j+MhEp69BBWsqcmKrKNP/Q/mpzRK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV24EMooKIdI1/XvCM1HiUrz4TlPj+AnTpwU1/6j+Fs=;
 b=T6Fnki9QzNKMRy6D+nfqAx3nP/HsTfSW8kd3n+3n91F9IfIIM2nfUS3iix3pm0/oIG
 s3kB9Uw/nYD3Gf881S4HChbujON0qeAOlfUlVfDg9n5GcNQV2LGPIzZERgqxe9+uJXgq
 8Fo7nUKXGVozjPatDGmKoX8VbKS60szTHaTuebU+90vk5nnY7xPmo4h1OzFBQbiD18K3
 ulMQzDZtgeI0NgzPYo7cYKtD9PIuWmpS6bVBa9B5tLhgUXFSX6gx9hcm73oMeKRFt+Hp
 +dMtiOMTqh241ArQsHDzxBBK8VWFcv1XWEI2M7P+KuJHyKm9BmUhK6pqmq7Yzx/kwGcF
 +a4w==
X-Gm-Message-State: AOAM531LJBDWmaMRyNF/WHIvMxuo6NbycP9k/0wuCmsyEKmP/DOtcMbC
 MOqSxlP1JcmhlALpRKEHQr1c8XdnYW6870Q+MP0=
X-Google-Smtp-Source: ABdhPJwTM4O5O5xRMECD/ml4XHGuaZA2V4he+MJw7w757tMECPm75d0txtkWrhCsL/3ha/ISqjZVL6egBSM4IlbTHrs=
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr7091704edb.260.1599705755811; 
 Wed, 09 Sep 2020 19:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-6-eajames@linux.ibm.com>
In-Reply-To: <20200909203059.23427-6-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 02:42:23 +0000
Message-ID: <CACPK8XeWS23xdBKs7Ge+MWqHr4HANTVeC4LSLqEujcp8eG=auw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] ARM: dts: Aspeed: Rainier: Add IBM Operation Panel
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

On Wed, 9 Sep 2020 at 20:31, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set I2C bus 7 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to the aspeed tree for v5.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index b94421f6cbd5..50d528444f5d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -4,6 +4,7 @@
>
>  #include "aspeed-g6.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
>  #include <dt-bindings/leds/leds-pca955x.h>
>
>  / {
> @@ -698,6 +699,7 @@ eeprom@53 {
>  };
>
>  &i2c7 {
> +       multi-master;
>         status = "okay";
>
>         si7021-a20@20 {
> @@ -831,6 +833,11 @@ gpio@15 {
>                 };
>         };
>
> +       ibm-panel@62 {
> +               compatible = "ibm,op-panel";
> +               reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 2.26.2
>
