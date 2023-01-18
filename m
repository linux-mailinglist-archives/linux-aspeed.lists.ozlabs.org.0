Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2B6711BE
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 04:20:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxWH14WG0z3c9G
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 14:20:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jhYPbsnI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jhYPbsnI;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxWGw6Z6zz2yjR
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 14:20:24 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id mg12so7755439ejc.5
        for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 19:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8FzgOUe3N6aaG9WcYlJy+T4HQMpFm5yBh2i8Tj448wA=;
        b=jhYPbsnIxrHWZQj/falPBOBFXlgFF9aBZZYvuLYD55LhbnYoeDIV4uRhgDAcVq7dI6
         9yOp2fPT5trimwTR0KCVpNJWkH3AWE5ctEySeyHVVAkPBsAaexXLaBpDbSRjC0yz9+hS
         juoEpJfv2521BVAXNKkkfWW5l3ho/1EuYdC3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FzgOUe3N6aaG9WcYlJy+T4HQMpFm5yBh2i8Tj448wA=;
        b=Buh+2PDfIPk6AhUJa4IwC9QzOPWOjTRjwxWnbmZxUbJ+cRGtzZfDSLv7/ohkngVBS9
         oYQpX6GHEa15Nk6OWZ0dF8DMRdkv618G5IqfaxFodX3nFSrrogcKe2URB+LCE5SaIF/h
         20nwZb421SGTrwEoTTRMzG9IsYD91cYmywezgkhL86H/csTEcztyMrY/ul8HpYzIPCnc
         /5dZ2vIGOeVVHkRxifEToEPZxXRaoliRblPthSrOyj+4nQw4swRzxqy8sdOm/YehpIkX
         YaFS+WlDhybU1HH/IgivkAa5d76fRfl5xWWnw/dwXyAdbQc9ZkBi+nGY+g6vhEn2b7uY
         fBWw==
X-Gm-Message-State: AFqh2kqk3OAIPOC/I2e2KRBoh43g3G4rOnXZQ7bLIMJQIu42sgD2PJ9e
	u9QBUEvrXUOw590TRqWQVyNKRGO/Ohr6Jq+V87U=
X-Google-Smtp-Source: AMrXdXvJg7JrQ0tQpOiGpYa3Hc2tprQvleaQu13cmOeI6UjvDDfMyHMpwohsZsAvZq+uHsMty/a3nlybLbMFu/LNHGs=
X-Received: by 2002:a17:907:9541:b0:84d:3532:eca9 with SMTP id
 ex1-20020a170907954100b0084d3532eca9mr479621ejc.394.1674012021802; Tue, 17
 Jan 2023 19:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20221025055046.1704920-1-potin.lai.pt@gmail.com>
In-Reply-To: <20221025055046.1704920-1-potin.lai.pt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 03:20:09 +0000
Message-ID: <CACPK8XcgzVPkmKLim7FTbsAn7W4h+d_DMnrpwHHRdWau3qcrYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: aspeed-g6: add aliases for mdio nodes
To: Potin Lai <potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 25 Oct 2022 at 05:52, Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> Add aliases for mdio nodes so that we can use name to lookup the
> bus address of Aspeed SOC.
>
> For example:
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio0
> /ahb/mdio@1e650000
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio1
> /ahb/mdio@1e650008
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio2
> /ahb/mdio@1e650010
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio3
> /ahb/mdio@1e650018
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Thanks, that's better I think.

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
> LINK: [v1] https://lore.kernel.org/all/20221025024145.1561047-1-potin.lai.pt@gmail.com/
>
> change v1 --> v2:
> * move mdio aliases to aspeed-g6.dtsi
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 0cc92874caa8..6f159ef1efbc 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -36,6 +36,10 @@ aliases {
>                 serial4 = &uart5;
>                 serial5 = &vuart1;
>                 serial6 = &vuart2;
> +               mdio0 = &mdio0;
> +               mdio1 = &mdio1;
> +               mdio2 = &mdio2;
> +               mdio3 = &mdio3;
>         };
>
>
> --
> 2.31.1
>
