Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987A263AB6
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 04:42:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn37n4j4VzDqY6
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 12:42:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SzbeO7Oa; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn37h28P7zDqY5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 12:42:06 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id r7so6411820ejs.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Sep 2020 19:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqwpRLg4PT44jhpT//Uf1w2MoxgHWm0NwZNCgoTWYaQ=;
 b=SzbeO7Oa0OQJSMhsqoY5ZVWwaerWZtBxMvU91a4ZbLSIjrnT/wA/jxzt9sw1LWMGWg
 MR13QS591LgNNIInj50Q+kz8yNMCRw08k0PnyEa0ts12t7O+VSo9CsnK1c9akMFFkMSu
 C3JuOqI5xeP4ZEbgA+ikOy3PHSXgtGgZU85ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqwpRLg4PT44jhpT//Uf1w2MoxgHWm0NwZNCgoTWYaQ=;
 b=L153jyCUa5jVEnVGhB/M9FDYkzchFHACNXh6Gk4QIloscId/vGjMOTRv4DwfTAqPtE
 JdlJNxUG7KdcvAmDLPFXh5Y4ewJ0q0Omv54zMoAUTyz551Y9lSlxpCgWkITrXRG5xKEa
 OeeC35NOJFOKdwDlzz/GbqPjCXyM1NXv496SxKAiew4OvCb5ab3xN6o7v0FW05fB9+2V
 iASWkhvc0mdXyBMDgsccnjiujQQapDOnGCfcZcunu3Z6hsvtqZq+Bq8E/95J+HqRibf7
 mzTIw/KsNSk6osnDg0mMS1OdxdbLBchy7yPPwoCCSZX47EtvTapgwlL+Xfw3ExJrZYcP
 IQsw==
X-Gm-Message-State: AOAM5313g5U8hGOZavCkT6SEdAm4R2XC3cxYBL4YYj4Q41Zsk7bgK8r3
 r++vRfBXNvzRPgcaWWPiJSJLkWMYUE8eEs5pmgw=
X-Google-Smtp-Source: ABdhPJwcXluGz3hInva1gKy4bM6y+M5N5Gn1vQaAuMY9KP0ILDgfzMQslOJeSPPJbmHsAfiiGjCmfeI9GQntCW6JJLg=
X-Received: by 2002:a17:906:e918:: with SMTP id
 ju24mr6428814ejb.442.1599705722453; 
 Wed, 09 Sep 2020 19:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-5-eajames@linux.ibm.com>
In-Reply-To: <20200909203059.23427-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 02:41:49 +0000
Message-ID: <CACPK8XdSUAiShnY2CZOb8_6YfaMxXnbUg0k=mWctYbRWEUpyBg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel
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
> Set I2C bus 0 to multi-master mode and add the panel device that will
> register as a slave.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to the aspeed tree for v5.10.

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
