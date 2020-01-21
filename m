Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71014356B
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jan 2020 02:53:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481s5J6rWHzDqTW
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jan 2020 12:53:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IUMcFpRQ; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481s590C2rzDqQC
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jan 2020 12:53:32 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id q15so487120qke.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jan 2020 17:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLwWB53t6sz09f9B1uK0zwEN9SxdL7h+I/vAqzXh1rs=;
 b=IUMcFpRQ8vz/Oz098DsJ/MlfrAlkASfp0SYSePY2V0VNezU4rSDADZWDuogLY83ITE
 6qOiftcsBHTGequV+QapUdKtSjbKt+Lu/mUFk4ZyU+XNjiuz67a5JUmyh7cgP3cDXB4u
 h3CtmwJqCqQUK9zrwgIefdFvbNJZ8pnnLyo0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLwWB53t6sz09f9B1uK0zwEN9SxdL7h+I/vAqzXh1rs=;
 b=LkvRdLV6nhn+ls7sSY917LOgGuAajoww3Z5xR1uPpYrzQJOXb97yu9e2DXONodhViN
 DhTuuAPIxkOW/GmbSMqWthU0t/cbbj8+abdABYlP1U0o6nH9cilk7V9VNTTBXcYDm92g
 mWc6v1WXYXi4yMSrAxCVb2EmjRSXoYZItBZuOy5ntw4wg4WAcSNNZXBvSXiqCMhAwcB3
 TLcVS508ILtgSG29wgGANILRPQnjGApUn67qoPwB73oeqLpj5u05Rz2WR57t5usgFslP
 b1y1dLTSPmWwsbT76mDuyFOS/EJBYR8JJqGYWlDohVjc0aGiFsK6s3E+2rrOWblcWSUK
 sgWw==
X-Gm-Message-State: APjAAAVKT7lP/ipVsave2SJXP8urW9gPj8AJfj4OwCGNvtMAP0OYfV9R
 rfM8Mq7CljwdHBuJmakaiTRF1XKiToPInk1wwRI=
X-Google-Smtp-Source: APXvYqwu+C+7GEOmDwQMJ1OCXr0L1MJ1vO3XA/YvvHsO/1Pr4qqlLpiL2FeuSh8Rtqj95aStJGWL/5FEIAlw9Nv83x8=
X-Received: by 2002:a37:a43:: with SMTP id 64mr36517qkk.292.1579571606933;
 Mon, 20 Jan 2020 17:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20200120150113.2565-1-linux@neuralgames.com>
In-Reply-To: <20200120150113.2565-1-linux@neuralgames.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Jan 2020 01:53:15 +0000
Message-ID: <CACPK8XfuVN3Q=npEoOP-amQS0-wemxcx6LKaHHZEsBAHzq1wzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwrng: Add support for ASPEED RNG
To: Oscar A Perez <linux@neuralgames.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, 20 Jan 2020 at 15:12, Oscar A Perez <linux@neuralgames.com> wrote:
>
> This minimal driver adds support for the Hardware Random Number Generator
> that comes with the AST2400/AST2500/AST2600 SOCs from AspeedTech.
>
> The HRNG on these SOCs uses Ring Oscillators working together to generate
> a stream of random bits that can be read by the platform via a 32bit data
> register.

Thanks for the patch.

We've been using the timeriomem-rng driver for the past few years on
aspeed hardware. You can see how that's set up by looking at
arch/arm/boot/dts/aspeed-g{4,5,6}.dtsi

I suggest we continue to use the generic driver.

Cheers,

Joel



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
> +
> +
> +  reg:
> +    description:
> +      Base address and length of the register set of this block.
> +      Currently 'reg' must be eight bytes wide and 32-bit aligned.
> +
> +    maxItems: 1
> +
> +
> +  period:
> +    description:
> +      Wait time in microseconds to be used between reads.
> +      The RNG on these Aspeed SOCs generates 32bit of random data
> +      every one microsecond. Choose between 1 and n microseconds.
> +
> +    maxItems: 1
> +
> +
> +  mode:
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
