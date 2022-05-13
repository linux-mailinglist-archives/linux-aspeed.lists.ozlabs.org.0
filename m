Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233E529506
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 01:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FVk2BWPz3bp5
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 09:16:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l8ZqzODx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=l8ZqzODx; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L02pS32p3z3bl1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 May 2022 19:07:10 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id i5so10499987wrc.13
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 May 2022 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tQhMv5wgd6P5e5ZPKnJXTqhF5TWWKVPkk+00hnqjRXs=;
 b=l8ZqzODxTeK4g2pTFG9ZfVYndijHwk3ii/cTxtexptHo590e35fS20iJwufNZdEh92
 2jnMvPNFHcft1cWJ2CbcRhtpHmMAmc8dJINengKkOOb5LUd5kbGum+qa3F+Uqhq9WxGl
 Y+4vNppopCVyTh/NMA/pHCUtSirsXcuUpHKpHmqmDSiZwaJhIZS9BkwROWE1xhfpXly0
 vSZYHS/eCsuDxwTwx4exGV1Fcw0wIFsgGORQL+NhF0F+GT4P72xlIFvgV2ehYcMbmDo+
 /yl0yWZV9wzV5KCbXL8PYSXGFZ+bnosYCEC8iFJe3AHNNRz4j1c+vziQGTi+0eTaY+OS
 xqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tQhMv5wgd6P5e5ZPKnJXTqhF5TWWKVPkk+00hnqjRXs=;
 b=eVgGQpgepjpOly05h9s3HZiIHrHi2XMLFI49Q1Cd1MvodpN3jCs7fnCiFwm0HQt/V8
 e/0DmCVNW+r9Xptur/g05mZ/bpgWb3n7D/7jer60Hu87wSD2ubK48e7n2ccTTXCiedpy
 Ucrh1fAFSsEPFOy+v3U2uwtMjp7e04rAYCa0hT6LiSlcV+BMsYVYJwn0wmhsvBwtXM9y
 rPMxxFtzw18tQKmIOR2XBqjYlwyd0KO39K6LVNFn5KHn7FcR04jOtzfvGyhtGL5ey+HR
 KROcSjVaM5yUwO/VVsqYNviBrkZLBs7l64SabREMujEdKwtOhN6wlJFTPXsTmyDYWiah
 bhUg==
X-Gm-Message-State: AOAM532VfUTUP98y/tJOcOzWkFXhkP7PEqY0aVsrCdMfRd/F7tksW0Ly
 VAQRfn5FSpnpBvPZHoHMs/hUduuzORkUY9xx
X-Google-Smtp-Source: ABdhPJy98bvsVxNsD1pSSLGnY3/tw/4jQw9PX2RSQLFiZDfcJuBduq4HwVBFKrcSH9BcOE5sNaEWQA==
X-Received: by 2002:a5d:4090:0:b0:20c:8b91:3b17 with SMTP id
 o16-20020a5d4090000000b0020c8b913b17mr2991905wrp.348.1652432826026; 
 Fri, 13 May 2022 02:07:06 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s23-20020adfa297000000b0020c5253d8f4sm1662710wra.64.2022.05.13.02.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 02:07:05 -0700 (PDT)
Message-ID: <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
Date: Fri, 13 May 2022 11:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513065728.857722-4-neal_liu@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:46 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/05/2022 08:57, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed USB2.0 Device
> Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  .../devicetree/bindings/usb/aspeed,udc.yaml   | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,udc.yaml

Please name the file as first compatible, so "aspeed,ast2600-udc.yaml"


> 
> diff --git a/Documentation/devicetree/bindings/usb/aspeed,udc.yaml b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
> new file mode 100644
> index 000000000000..d1d2f77d1c54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 Facebook Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/aspeed,udc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED USB 2.0 Device Controller
> +
> +maintainers:
> +  - Neal Liu <neal_liu@aspeedtech.com>
> +
> +description: |+
> +  The ASPEED USB 2.0 Device Controller implements 1 control endpoint and
> +  4 generic endpoints for AST260x.
> +
> +  Supports independent DMA channel for each generic endpoint.
> +  Supports 32/256 stages descriptor mode for all generic endpoints.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-udc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

No child properties? No ports or any other devices? No usb-hcd.yaml?
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    udc: udc@1e6a2000 {

Node name: usb

> +            compatible = "aspeed,ast2600-udc";
> +            reg = <0x1e6a2000 0x300>;
> +            interrupts = <9>;
> +            clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_usb2bd_default>;
> +    };


Best regards,
Krzysztof
