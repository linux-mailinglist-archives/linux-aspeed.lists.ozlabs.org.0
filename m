Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001054FED01
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Apr 2022 04:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdRWF2h3Bz3bVc
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Apr 2022 12:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MiGg6bcA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MiGg6bcA; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdRW56QXmz2xfT
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Apr 2022 12:34:23 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id g11so434307qke.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Apr 2022 19:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MqB+e2xT6Yv8MpPTnOJ+2E7n6YyjIMzpIJ4iHfGOxzQ=;
 b=MiGg6bcAs91xkbp2RAUHsNccXGOyhvPuMSn82Wa1gSKILPMKoQG5P3Nl6kIPR+N5J+
 zVXOLkNpjaDHn+waq32rztY1uH6Ltt+sjAJ0nV2d/w1hp6PgqHrypZf+6wnGN6+VoZhA
 Gqm9ac5gX/HqIda6RlWEEWZA5aB3xxReNhoT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MqB+e2xT6Yv8MpPTnOJ+2E7n6YyjIMzpIJ4iHfGOxzQ=;
 b=csBu2JlA7/pS0PwKY58uUyBmfsPvSiDwRrkGh5kvIUQXZ43KT0S4jLA4V7R1GYIBY0
 YvjhFYw3fX4bKpFUvv6Ao6fxd6zHpTzsdegcToJhqFeWs+EMwnaXZwYU8LXAyMYyRQJC
 cDFv6bpOKxndOTOuaivJEnIMnE0IjFOcdH62PWQoUc9ywqtxutxokV7RfbsenbgVdZGx
 KWHAQihr5Mpaa5y4cJg3Vjey0OGqGTnRTsgnzEi0+wvdNsxVuVai9YPMwbN/AFNXwIyR
 EE11KsoEnJfv4c5igyuvaO4kYSmvcqfJwciDIxejlK2olqV6StOLg8G7WsJQtmp/w8F6
 jwIA==
X-Gm-Message-State: AOAM53182sij6yqBA/A8MYebH1YBL2DLMwcMS3GHVkmqMEWtERHMTJ/Z
 jM0e0y5tMfRU2ZNNv3gGZyA+eblMrx7nhS075pQ=
X-Google-Smtp-Source: ABdhPJywZYFb5Kxa0f4hpEMdUjYMwcNEQCHYq0m2mmEOdorMP1FM/4Q5J9SAQdd/0fyvytzb+Axet0s98+c5ArMZPco=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr5261283qkj.666.1649817259877; Tue, 12
 Apr 2022 19:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220412065611.8930-1-dylan_hung@aspeedtech.com>
 <20220412065611.8930-2-dylan_hung@aspeedtech.com>
In-Reply-To: <20220412065611.8930-2-dylan_hung@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 13 Apr 2022 02:34:08 +0000
Message-ID: <CACPK8Xd0gh5pDafP3ysu7odhnP=YPNSYPV9u36CEoMPDtQxEJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: add reset property for aspeed,
 ast2600-mdio binding
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 BMC-SW <BMC-SW@aspeedtech.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, pabeni@redhat.com,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 12 Apr 2022 at 06:55, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> The AST2600 MDIO bus controller has a reset control bit and must be
> deasserted before manipulating the MDIO controller. By default, the
> hardware asserts the reset so the driver only need to deassert it.
>
> Regarding to the old DT blobs which don't have reset property in them,
> the reset deassertion is usually done by the bootloader so the reset
> property is optional to work with them.
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> index 1c88820cbcdf..1174c14898e1 100644
> --- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> @@ -20,10 +20,14 @@ allOf:
>  properties:
>    compatible:
>      const: aspeed,ast2600-mdio
> +
>    reg:
>      maxItems: 1
>      description: The register range of the MDIO controller instance
>
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -39,6 +43,7 @@ examples:
>              reg = <0x1e650000 0x8>;
>              #address-cells = <1>;
>              #size-cells = <0>;
> +            resets = <&syscon ASPEED_RESET_MII>;

You will need to include the definition for ASPEED_RESET_MII at the
start of the example:

#include <dt-bindings/clock/ast2600-clock.h>

You can test the bindings example by doing this:

pip install dtschema

make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml

Cheers,

Joel

>
>              ethphy0: ethernet-phy@0 {
>                      compatible = "ethernet-phy-ieee802.3-c22";
> --
> 2.25.1
>
