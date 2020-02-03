Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80015044D
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Feb 2020 11:32:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B3zh6FDDzDqNJ
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Feb 2020 21:32:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B3zT2xWCzDqMd
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Feb 2020 21:32:04 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id k11so17244211wrd.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 03 Feb 2020 02:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NFuh06mCbIFHLnWl/yp4KwHBKhZRCL1Lbf1jiW0JM98=;
 b=QnXmg5C4Gbcx3K9cmZh6CMTOm1O1xLhMUUyzYpHqWs9LHweojR2LRlqCTdh8MYE8Ma
 NSeV1eEmoMR0HRP0y+G+1zyzvNbyp0UgeyqBLcnCi081ZQWABhIUnJqfQ3/H5i2vahfG
 QoJS3F5E8MN5ggApwozE5e18V9MiC5mE5QHN0Wj2SriapwZllAtLEtaswXw0CvY2jhTU
 hmU1R1YPjU8aWSNpPIlNLO7cMaNwAQAOMTOK8WOdyfq+Khenbj/BcZyktfFFo3nKz4fd
 EdcX9xTInafgZ5/AZ/SYcqpVn95RFudKLW56rsdRE350TrCgCyuQf9mBxND+GjcwL17H
 qvCA==
X-Gm-Message-State: APjAAAVix7YNDWFeUCFR4+YJ1z2j/JNhN875LIKPJWROI/u6geSQDExF
 b56wsmGJXJ0YxN9Csd6BSg==
X-Google-Smtp-Source: APXvYqyQJyScAUAfc7hRV/ni9Ov1rrCOL/vQpSraOmoLvu0hd1vpN6CEC4XJZDRuzYtupTLkxa0YGQ==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr14473037wrw.244.1580725921100; 
 Mon, 03 Feb 2020 02:32:01 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
 by smtp.gmail.com with ESMTPSA id t131sm23233901wmb.13.2020.02.03.02.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 02:32:00 -0800 (PST)
Received: (nullmailer pid 31847 invoked by uid 1000);
 Mon, 03 Feb 2020 10:31:58 -0000
Date: Mon, 3 Feb 2020 10:31:58 +0000
From: Rob Herring <robh@kernel.org>
To: Oscar A Perez <linux@neuralgames.com>
Subject: Re: [PATCH 1/2] hwrng: Add support for ASPEED RNG
Message-ID: <20200203103158.GA9276@bogus>
References: <20200120150113.2565-1-linux@neuralgames.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120150113.2565-1-linux@neuralgames.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jan 20, 2020 at 03:01:08PM +0000, Oscar A Perez wrote:
> This minimal driver adds support for the Hardware Random Number Generator
> that comes with the AST2400/AST2500/AST2600 SOCs from AspeedTech.

This patch is not a driver. 'dt-bindings: rng: ...' for the subject. 
(Plus, 2 patches with the same subject is never a good idea.)

> 
> The HRNG on these SOCs uses Ring Oscillators working together to generate
> a stream of random bits that can be read by the platform via a 32bit data
> register.
> 
> Signed-off-by: Oscar A Perez <linux@neuralgames.com>
> ---
>  .../devicetree/bindings/rng/aspeed-rng.yaml   | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/aspeed-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/aspeed-rng.yaml b/Documentation/devicetree/bindings/rng/aspeed-rng.yaml
> new file mode 100644
> index 000000000000..06070ebe1c33
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/aspeed-rng.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/aspeed-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +
> +title: Bindings for Aspeed Hardware Random Number Generator
> +
> +
> +maintainers:
> +  - Oscar A Perez <linux@neuralgames.com>
> +
> +
> +description: |
> +  The HRNG on the AST2400/AST2500/AST2600 SOCs from AspeedTech  uses four Ring
> +  Oscillators working together to generate a stream of random bits that can be
> +  read by the platform via a 32bit data register every one microsecond.
> +  All the platform has to do is to provide to the driver the 'quality' entropy
> +  value, the  'mode' in which the combining  ROs will generate the  stream  of
> +  random bits and, the 'period' value that is used as a wait-time between reads
> +  from the 32bit data register.
> +
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - aspeed,ast2400-rng
> +              - aspeed,ast2500-rng
> +              - aspeed,ast2600-rng

Just:

compatible:
  enum: ...

> +
> +
> +  reg:
> +    description:
> +      Base address and length of the register set of this block.

Drop. That's *every* 'reg' property.

> +      Currently 'reg' must be eight bytes wide and 32-bit aligned.

Currently? Is that going to change? Are things going to break if the DT 
has a bigger size?

> +
> +    maxItems: 1
> +
> +
> +  period:

Needs a vendor prefix and unit suffix.

> +    description:
> +      Wait time in microseconds to be used between reads.
> +      The RNG on these Aspeed SOCs generates 32bit of random data
> +      every one microsecond. Choose between 1 and n microseconds.

Why would you pick something more than 1?

> +
> +    maxItems: 1
> +
> +
> +  mode:

Needs a vendor prefix and a type reference.

> +    description:
> +      One of the eight modes in which the four internal ROs (Ring
> +      Oscillators)  are combined to generate a stream  of random
> +      bits. The default mode is seven which is the default method
> +      of combining RO random bits on these Aspeed SOCs.
> +
> +    maxItems: 1
> +
> +
> +  quality:

Needs a vendor prefix and a type reference.

> +    description:
> +      Estimated number of bits of entropy per 1024 bits read from
> +      the RNG.  Note that the default quality is zero which stops
> +      this HRNG from automatically filling the kernel's entropy
> +      pool with data.
> +
> +    maxItems: 1
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - period
> +  - quality
> +
> +
> +examples:
> +  - |
> +    rng: hwrng@1e6e2074 {

rng@...

> +         compatible = "aspeed,ast2500-rng";
> +         reg = <0x1e6e2074 0x8>;
> +         period = <4>;
> +         quality = <128>;
> +         mode = <0x7>;
> +    };
> +
> +
> +...
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
