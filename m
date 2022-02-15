Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE054B631C
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 06:51:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVb853p6z3cBr
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Feb 2022 16:51:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dGCZJuIm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dGCZJuIm; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyVb51p4vz30Mf
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Feb 2022 16:51:45 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id n6so16727804qvk.13
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Feb 2022 21:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iytJY9QGZHgK1dR7TRPlRfso2KgivSYIHxmNeKfZdsI=;
 b=dGCZJuImpISwcylMeDy7jztHJX1LTHvxJ/hDdJyyJfEw7baQk+ZA/B+5N5e8pDZRPg
 AunIC0bQysjAao0JMBU6Ps/exYHloD9TOOvF3DIGIWGWt8wcm6FKqTrhgf2wryJuwYFM
 vkn8CDHe0lTFepxz18DqiyMnf2dKQNTEU9th4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iytJY9QGZHgK1dR7TRPlRfso2KgivSYIHxmNeKfZdsI=;
 b=jaTTqV7ijGwDTpAnwjQdtfHFEovQvscW7aTnWhXFWHQVItiMKjxzEsQBo7y7PZHNQK
 iiTncrTFqbWndHWv5LD4s4/IV3vsdTpYLOe61cXNqF8WYXETZf4YBOFcZTFltM2GBR4E
 hYDcfhCaZoTcgA3TBppOoZt4xtfJic8FpwXOlS73d5ZVRuH5wG6qB03rShp8u2+Z1el7
 80ki+EvwFwOMZN/kHJPDv/+nrFcguygixaqxmZxkW1XcuBNgcUNFwZuK7Ivdb12hEfkP
 y0R8w+mWgx8pvdDZZsqyO7iVnXVjk5EHq+5UJev3QT3Zpqxhd2SfMV2TKyyoLZOiDsY8
 tB7w==
X-Gm-Message-State: AOAM530+j7lKuhnfok42xrSpJQwEYv2vuWC+HwQxudBS2dF1W0D/81My
 3P36+eExU5M/31OZzLq503pEoZoQJuDVf0M1gXU=
X-Google-Smtp-Source: ABdhPJyviT6pQp+V6F57xIT2apVk7qMUv7vZUfJEXbd3ulavwnbHnrmHmHTrsCKbBGiomLGp5xGIQpfdT5bWcMLIClg=
X-Received: by 2002:ad4:5dcb:: with SMTP id m11mr1565762qvh.130.1644904301705; 
 Mon, 14 Feb 2022 21:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20220214042538.12132-1-potin.lai@quantatw.com>
In-Reply-To: <20220214042538.12132-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Feb 2022 05:51:29 +0000
Message-ID: <CACPK8Xcs7y2d9AGfizv9+Lr_Ri3gaq2gmwXMFt=04z7s9XmAMg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] update Facebook Bletchley BMC
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
> This patch series update Facebook Bletchley BMC devicetree base on EVT HW
> schematioc design, and rebase SLED numbering to 1-based for OpenBMC
> multi-host.
>
> - GPIO:
>   - adding more gpio line names
>   - include interrupt line in io expander for gpio interrupt monitoring
>
> - SPI flash:
>   - adding dual flash BSM module support
>   - switch to spi2-gpio on spi2 due to unstable signal issue
>
> - Hwmon Sensors:
>   - adding INA230 sensors for monitoring
>   - fix ADM1278 shunt-resistor
>
> - MDIO Bus: enable mido3 bus
>
> - RTC: switch to external battery-backed rtc
>
> - OpenBMC: 1-based SLED numbering
>
>
> LINK: [v1] https://lore.kernel.org/all/20220211014347.24841-1-potin.lai@quantatw.com/
>
>
> Changes v1 --> v2:
> - update the details of new added gpio line names in commit message
> - add battery-backed rtc information in comment and commit message

Looks good. I made some comments on the spi2 patch, please fix those
up and I will merge.

Note that the convention for patch names is:

ARM: dts: aspeed: bletchley: Description with sentence case

If you could update your patches to follow that it would be appreciated.

There's no need to re-send your series for the openbmc tree; I can
merge those once we've reviewed the ones for mainline.

Cheers,

Joel

>
> Potin Lai (10):
>   arch: arm: dts: bletchley: switch sled numbering to 1-based
>   arch: arm: dts: bletchley: separate leds into multiple groups
>   arch: arm: dts: bletchley: update gpio-line-names
>   arch: arm: dts: bletchley: update fmc configurations
>   arch: arm: dts: bletchley: switch to spi-gpio for spi2
>   arch: arm: dts: bletchley: add interrupt support for sled io expander
>   arch: arm: dts: bletchley: add shunt-resistor for ADM1278
>   arch: arm: dts: bletchley: add INA230 sensor on each sled
>   arch: arm: dts: bletchley: enable mdio3 bus
>   arch: arm: dts: bletchley: cleanup redundant nodes
>
>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 303 +++++++++++-------
>  1 file changed, 194 insertions(+), 109 deletions(-)
>
> --
> 2.17.1
>
