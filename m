Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61854FE203
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Apr 2022 15:14:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd5ls5ggbz3bXB
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Apr 2022 23:14:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.42; helo=mail-ot1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd5ll46Jnz2yb7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Apr 2022 23:14:10 +1000 (AEST)
Received: by mail-ot1-f42.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so13342368otq.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Apr 2022 06:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=4Hu29V9bbNGQ7NeMGoWiDLgZuDde0wP79E71crt9DdM=;
 b=ewid4F5Q4Jkmz4kKuZraWh4v1QbLBsUe2m3HBlWDC1/HnnjzBbAng7bB74hLQX+u5t
 rLCGT5h0y2QY+s2n2UD1QlezehB3tf2J8JMQthOQ1DjP2Dnb1PwLX93gq7zgB4sDifSH
 L98ZP1DdD6rJxkrwfmD6iJdiSbj4c/K/kcPcr9GvadIj953gfr037Hc2edTXLmrV2Ii0
 az00k73AbJm5Oj6rLfugf/9mHyTjNNpl2YN2pCD5bgFBiF9MXNyaFEQxAON3uVV1ssj4
 YGIUMgDWcdefkzuyEeAFEsC6NDukI9x0YZVdWxyf2TiLItPi8dZIIUgsPEgDwrtSpcw/
 1D4w==
X-Gm-Message-State: AOAM531N1uqiRLt0XeaIsdBeMaVWsvSiJ3vmxD8yI6lQKtil58k23UiE
 2XctcH4jtrHCUBowDVG73KRLMcrr7g==
X-Google-Smtp-Source: ABdhPJy/ZMhWQUc529yUtvgnyCadjBqr7fjsWtZYK6b6y58vnNMwVPuq1IYac7H3Y8QrDWl4AkwVgw==
X-Received: by 2002:a05:6830:2aa1:b0:5e6:cccf:419b with SMTP id
 s33-20020a0568302aa100b005e6cccf419bmr6816302otu.208.1649769246965; 
 Tue, 12 Apr 2022 06:14:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm12947467oih.53.2022.04.12.06.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 06:14:06 -0700 (PDT)
Received: (nullmailer pid 3815484 invoked by uid 1000);
 Tue, 12 Apr 2022 13:14:05 -0000
From: Rob Herring <robh@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
In-Reply-To: <20220412065611.8930-2-dylan_hung@aspeedtech.com>
References: <20220412065611.8930-1-dylan_hung@aspeedtech.com>
 <20220412065611.8930-2-dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: add reset property for aspeed,
 ast2600-mdio binding
Date: Tue, 12 Apr 2022 08:14:05 -0500
Message-Id: <1649769245.688561.3815481.nullmailer@robh.at.kernel.org>
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux@armlinux.org.uk,
 robh+dt@kernel.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 12 Apr 2022 14:56:09 +0800, Dylan Hung wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.example.dts:25.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

