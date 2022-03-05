Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E434CEEEA
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Mar 2022 01:15:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBf9V0v6xz3bP9
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Mar 2022 11:15:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=C3WQQ6ZW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=C3WQQ6ZW; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9yzc1k6gz2xX8
 for <linux-aspeed@lists.ozlabs.org>; Sun,  6 Mar 2022 08:49:14 +1100 (AEDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 038973F5F2
 for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Mar 2022 21:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646516948;
 bh=xIGwC4dMVAbcNM9VbnP/VQuX2kHBkqPx10EnWit2MpM=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=C3WQQ6ZWZJWssoxtQ5iO92qyAkxlBX0zMHFXrG9V2UWmWK5ukzsDQzWaqmZlNHkHx
 2YMMZgab7ZkSMxIxJZ0PxXkJWddDJkeeMB4ohWF31IDuDXgxuebaw5UzIrJJK2ixMp
 3I6KyWP6LcFCw0xbcC3H7kfcPt91MY+MxnGqT63oaAXY406xCbFcDUfoY7X9OLRSZB
 4zxhm1MGMPxMlNQTHEXimgB0vA25a4RdufWF2jLkfOZ9PfKjv14h3iO+/oNLTAZpy/
 oDfGuWKvJEvDSHEsEMpuM6eGuXrEck5Ff2Ouu+7M7YXTZl0wc1VcxxVYb625aLuWkR
 HLehW+TjKlx0Q==
Received: by mail-ej1-f71.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so5969256ejw.9
 for <linux-aspeed@lists.ozlabs.org>; Sat, 05 Mar 2022 13:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xIGwC4dMVAbcNM9VbnP/VQuX2kHBkqPx10EnWit2MpM=;
 b=mSWdDurIj2/ANCUySRVgToFlwGQCCWPUD0a4gT4sIvrQgrSZYaOjVSJmExVYqhLw/f
 YRm3UzyASjiJMMA7hN3wawGciWWsTD6NJb+1GvW0sWMoB+w0EDRbxIKI4QcogOjhjY+Y
 A/Jq0JbWp6tfWok6Qfjem54R11OqpDwb9iDNe2zxyJ+lChMRu4te5upFVyTUTM8l5kF9
 gEwHvhSDeNi/mpgNbWyFSMUm73ANiup4e5s/s8D/8wfnnqePNKV8nUDZI8h1xLxe+Xdx
 ztU+GQZ6CYcWXEFI6IBTrfOMfsUww9kzJsuWIuQ5ZBAgVCRK7oNEh2oVHWTfsl+GmAVu
 YtsA==
X-Gm-Message-State: AOAM5303NzdveLcLtihwrAfyNrEltKRSEfExhchMgzHWCry4N29Pffsv
 sqg0dZtDQS3PkV6BF4TAii+U3VBnv1tbEVKh5NGM+IC3nxGOoPWLpZkGAhyonyWUO+JPuERtkH+
 6pKsL0Go7PeqCVbwfFreBRxUx85xIcy8cG6KRL4G1PrE=
X-Received: by 2002:a17:906:a10:b0:6ce:7107:598b with SMTP id
 w16-20020a1709060a1000b006ce7107598bmr3838150ejf.653.1646516947607; 
 Sat, 05 Mar 2022 13:49:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr2kT1aeQLLJO9FBVlLCJJEpNgkXx6haeqI+gPwVq8L5czrgAUT8X08CZ0HwZ0nOoFqxAA7Q==
X-Received: by 2002:a17:906:a10:b0:6ce:7107:598b with SMTP id
 w16-20020a1709060a1000b006ce7107598bmr3838131ejf.653.1646516947209; 
 Sat, 05 Mar 2022 13:49:07 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b006da6436819dsm3247439eje.173.2022.03.05.13.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 13:49:06 -0800 (PST)
Message-ID: <44308465-db4c-80e7-2beb-b0f676d16edf@canonical.com>
Date: Sat, 5 Mar 2022 22:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] dt-bindings: gpu: Convert aspeed-gfx bindings to
 yaml
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-3-joel@jms.id.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220304000311.970267-3-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 07 Mar 2022 11:14:09 +1100
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 04/03/2022 01:03, Joel Stanley wrote:
> Convert the bindings to yaml and add the ast2600 compatible string.
> 
> The legacy mfd description was put in place before the gfx bindings
> existed, to document the compatible that is used in the pinctrl
> bindings.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
>  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
>  .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
>  3 files changed, 69 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> new file mode 100644
> index 000000000000..8ddc4fa6e8e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/aspeed,gfx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED GFX display device
> +
> +maintainers:
> +  - Joel Stanley <joel@jms.id.au>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2400-gfx
> +          - aspeed,ast2500-gfx
> +          - aspeed,ast2600-gfx

That's different than original bindings - new patch. It's not currently
supported, so adding it is more than just updating bindings to current
state.

> +      - const: syscon
> +
> +  reg:
> +    minItems: 1

maxItems?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  memory-region: true
> +
> +  syscon: true

You need at least description. I see old bindings did not mention it
(except that it is required)... I think you also need a type, because it
is not a standard property.

> +
> +  reg-io-width: true

Some constraints? Can it be anything from syscon schema?

Best regards,
Krzysztof
