Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7704CB22C
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87qc5SHDz3bd6
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:21:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MtnSgvQx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MtnSgvQx; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K87qW1mCpz30Hp
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:20:55 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id q4so2513369qki.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IwOBwMpi2OwEzG0VtigJWsM6dutoMlGx5jRzY5Yz/Vc=;
 b=MtnSgvQxlGt5TGIFQMfRkRf4KK1L85s9MA4ZXLuK105X6YoXUOfkr173xoepXU0fiu
 UuhHi/gN1IKGbUa02Oi4DiEVaJZ/yqhWE6k0hILSueUBtPjBk8tj7hvZICj1J1mOVdmZ
 oUIkmayyOSwIO+lHl6kgMI1DLJJXj1VZG2GzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IwOBwMpi2OwEzG0VtigJWsM6dutoMlGx5jRzY5Yz/Vc=;
 b=0eFQJXLn7NABzN0EBOV+Of4F4j2hMvaFkYOQyQjzS2FnNkoZfKhAAbpwjj7ccjtO3/
 miEh3Xz0lunGF6qkHLCOLKNZITbatVJunPEDFsTiiUnMmZ7U7Squ/pycx+eNmNNTFD3y
 xkSMJI01Xj8qXAaLwWBvwLoAIiaM2lSz6+cKl2PA3JvSiaCagNQExzmGLl96eE21kmrz
 MuIyhk59HQsrm5VDStolP3DoTcBrozM8HfbltIUYT4cYYf+pe6KL8kYWtMWuZD0JM+W9
 h6aQ59jefR+2N62qGC42/iQnUke7mXRnIxg8VNVQmFuJWm4bjLBjodWogtRRyqneHMPw
 QaCw==
X-Gm-Message-State: AOAM530WgB7c/E2meHNZQ3i3pwBmE27733mOp9gom77DAkyP++ZalSvc
 o8c6/8Xw0JYa7zOMmtpfhvdLtu1RbRC+OcuUBJg=
X-Google-Smtp-Source: ABdhPJxvmmE3gaxqf1AN8AAcq15J2+/3h1dIbI7rXUBxAE1ecVlQbf15Jy/H6IC8/REhnKs2t2BL89C3wdGw7Mg0B6A=
X-Received: by 2002:a05:620a:2fc:b0:649:a4e:c430 with SMTP id
 a28-20020a05620a02fc00b006490a4ec430mr17818002qko.347.1646259651990; Wed, 02
 Mar 2022 14:20:51 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-4-clg@kaod.org>
In-Reply-To: <20220302173114.927476-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:20:40 +0000
Message-ID: <CACPK8XcWZ6jQEo4-78fMrSxqZW5Cc8ecsNf+j5X7av-HbJwMKg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 17:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 90 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-=
fmc.yaml
>
> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yam=
l b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> new file mode 100644
> index 000000000000..0289a4f52196
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/aspeed,ast2600-fmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed SMC controllers bindings
> +
> +maintainers:
> +  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> +  - C=C3=A9dric Le Goater <clg@kaod.org>
> +
> +description: |
> +  This binding describes the Aspeed Static Memory Controllers (FMC and
> +  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-fmc
> +      - aspeed,ast2600-spi
> +      - aspeed,ast2500-fmc
> +      - aspeed,ast2500-spi
> +      - aspeed,ast2400-fmc
> +      - aspeed,ast2400-spi
> +
> +  reg:
> +    items:
> +      - description: registers
> +      - description: memory mapping
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "@[0-9a-f]+":
> +    type: object
> +
> +    properties:
> +      spi-rx-bus-width:
> +        enum: [1, 2, 4]
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    spi@1e620000 {
> +        reg =3D <0x1e620000 0xc4>, <0x20000000 0x10000000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D "aspeed,ast2600-fmc";
> +        clocks =3D <&syscon ASPEED_CLK_AHB>;
> +        interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +        flash@0 {
> +                reg =3D < 0 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +        flash@1 {
> +                reg =3D < 1 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +        flash@2 {
> +                reg =3D < 2 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4175103e928d..f5ab77548ef6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2925,6 +2925,15 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>  F:     drivers/mmc/host/sdhci-of-aspeed*
>
> +ASPEED SMC SPI DRIVER
> +M:     Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> +M:     C=C3=A9dric Le Goater <clg@kaod.org>
> +L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +L:     linux-spi@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> +
>  ASPEED VIDEO ENGINE DRIVER
>  M:     Eddie James <eajames@linux.ibm.com>
>  L:     linux-media@vger.kernel.org
> --
> 2.34.1
>
