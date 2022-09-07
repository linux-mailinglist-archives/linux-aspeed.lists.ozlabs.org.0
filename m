Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D045B0E94
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 22:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNDt75y7Tz3bcv
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Sep 2022 06:50:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.44; helo=mail-oa1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNDt44CSRz2yPm
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Sep 2022 06:50:36 +1000 (AEST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1278624b7c4so20811666fac.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Sep 2022 13:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XpaMqgzQduMkVaFdjS8sZuoWxamJB73mDfIYxsQEGzM=;
        b=GYMPHicVXh6w5l4ExF4/nfln/h2v8vUwcImVWA2KlPw94IRGDs9nTOH/no4pnEftnN
         70nnIp8W/v3NnZvDGhh6Q94xDGEw0oAKkJDGe2amU8OtZUT8CUqTIEyGDZGe+PupoDrd
         sjGbulubq84ULmfBot1FYRNLw47uJXmLSjtkUHCfSZr0WVwZyiQZyxuxH/i9OZIRFhfn
         72ZQH5aBTR6bFMdVPBWwHQA0PU3lZzQH4O5Te5MD8SLJAnY5Dc4J6TGLDSvsrYpdOws+
         lm4+gpPvCD3Z2ZTkk9Gl6wYcvooKk56HU2esY60ALo9XlTahMPYt/J4d1sf/LReOUOvX
         4Y3w==
X-Gm-Message-State: ACgBeo2felM7mCKHZwD899uGFxjeqGRwfMULU/hZ9jDTWzRjMYBtirQA
	OicTZMVj4BjZtjPVcJKPkA==
X-Google-Smtp-Source: AA6agR4y0lnUCMGP5KqdujGB7vvUBgedIl3yykVGAFTXJQtN736AfICOgzZNv2SREifIEOY0hIcY6g==
X-Received: by 2002:a05:6871:96:b0:11d:ca1b:db19 with SMTP id u22-20020a056871009600b0011dca1bdb19mr180703oaa.74.1662583834165;
        Wed, 07 Sep 2022 13:50:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g12-20020a056870c14c00b0012644cc4feasm6349515oad.55.2022.09.07.13.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:50:33 -0700 (PDT)
Received: (nullmailer pid 320445 invoked by uid 1000);
	Wed, 07 Sep 2022 20:50:33 -0000
Date: Wed, 7 Sep 2022 15:50:33 -0500
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v1 4/4] dt-bindings: bus: add documentation for Aspeed
 AHBC
Message-ID: <20220907205033.GA317033-robh@kernel.org>
References: <20220902060012.3758637-1-neal_liu@aspeedtech.com>
 <20220902060012.3758637-5-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902060012.3758637-5-neal_liu@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 02:00:12PM +0800, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed
> Advanced High-Performance Bus (AHB) Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  .../bindings/bus/aspeed,ast2600-ahbc.yaml     | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
> new file mode 100644
> index 000000000000..ca09eb531666
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED Advanced High-Performance Bus Controller (AHBC) Device Tree Bindings
> +
> +maintainers:
> +  - Neal Liu <neal_liu@aspeedtech.com>
> +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +
> +description: |
> +  Advanced High-performance Bus Controller (AHBC) supports plenty of mechanisms
> +  including a priority arbiter, an address decoder and a data multiplexer
> +  to control the overall operations of Advanced Highperformance

High-performance

> +  Bus (AHB). AHB is the main system bus for ARM CPU to communicate with the
> +  related peripherals.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-ahbc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ahbc: bus@1e600000 {
> +        compatible = "aspeed,ast2600-ahbc";
> +        reg = <0x1e600000 0x100>;

Shouldn't devices on the bus be child nodes? 

> +    };
> -- 
> 2.25.1
> 
> 
