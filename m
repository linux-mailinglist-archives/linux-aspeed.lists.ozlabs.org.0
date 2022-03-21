Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BD4E27AB
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Mar 2022 14:35:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMbGS0rRnz30Q9
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 00:35:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.49; helo=mail-oo1-f49.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMbGL3mHzz3036
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Mar 2022 00:35:21 +1100 (AEDT)
Received: by mail-oo1-f49.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso19074691ooe.6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Mar 2022 06:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5UU4N1/jkwKIKHDgJE8Xaunth0Jq4iesYl4vSjdvP6Y=;
 b=Q+5UkznWYnT8NI+yF/6YON+EUpNV4fcaGUGketzwj0zF1edR+pjfgCXVwQ3wfbpGPy
 TTzdiqgSFHaAZJ8ns2g6ybLxHJdOc8KOZEKGlA533mnTMmzyBcTIeaWrNtZWwtAJlBev
 DoO+ijfnjy672V4epk3ZBx//3/XuzYPPhdwM7cg/0AmcLbTlGwRaheLphpDBqJOyivrX
 RxCKHXGlZOkO3EdbH3vXg/xXGfAmEezXchMMcEo2la8hPva3JCVGGXwnGHJbNCqbIONO
 TnQWuHdYURe07bdpkGdqbeTKFVeQL4gvZ0oZSPq3Cv8FqlVQqaY78BtxiEeWTK3/fiLX
 qtmw==
X-Gm-Message-State: AOAM533KkohSxDILt+hDcJNCbLbI5GXdOOepYCEJXoQsow2csZy8Nftx
 ANZ0AwBi/iCXMFu4883uvA==
X-Google-Smtp-Source: ABdhPJzfmSYuwsV67ZwxyLb5RUYtTVRmT0EHgTTZezQLdru8b+cuGc6RlbeGCMx5yctS3/FrA95Q3g==
X-Received: by 2002:a05:6870:3112:b0:ce:c0c9:62b with SMTP id
 v18-20020a056870311200b000cec0c9062bmr11623640oaa.125.1647869719305; 
 Mon, 21 Mar 2022 06:35:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056808158f00b002e331356c87sm7572522oiw.39.2022.03.21.06.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:35:18 -0700 (PDT)
Received: (nullmailer pid 4125326 invoked by uid 1000);
 Mon, 21 Mar 2022 13:35:11 -0000
From: Rob Herring <robh@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
In-Reply-To: <20220321095648.4760-2-dylan_hung@aspeedtech.com>
References: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
 <20220321095648.4760-2-dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: add reset property for aspeed,
 ast2600-mdio binding
Date: Mon, 21 Mar 2022 08:35:11 -0500
Message-Id: <1647869711.893197.4125325.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux@armlinux.org.uk, robh+dt@kernel.org, p.zabel@pengutronix.de,
 BMC-SW@aspeedtech.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 21 Mar 2022 17:56:46 +0800, Dylan Hung wrote:
> The AST2600 MDIO bus controller has a reset control bit and must be
> deasserted before the manipulating the MDIO controller.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Cc: stable@vger.kernel.org
> ---
>  .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1607671


mdio@1e650000: 'resets' is a required property
	arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml
	arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dt.yaml

mdio@1e650008: 'resets' is a required property
	arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml
	arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dt.yaml

mdio@1e650010: 'resets' is a required property
	arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml
	arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml

mdio@1e650018: 'resets' is a required property
	arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml
	arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dt.yaml

