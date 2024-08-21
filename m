Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF5C9596DE
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 10:51:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpg6p0X4Hz2yL0
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2024 18:51:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.50
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.50; helo=mail-wm1-f50.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wpg6l0f8fz2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 18:51:26 +1000 (AEST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso70098885e9.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2024 01:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230282; x=1724835082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1grTtpsOD7QxOvlav66VEj13IRTNdzSA+6cdUBz9z7c=;
        b=wF0iZs+XodWhVF545lA8hrfIHYH9WI/v3T6zrHNzHNSWi3BbznN1pVeWNIbjANH9eq
         IYZu7aUVM3GUFAqHn3sdO6pRyt0Lt7V2dz/dZWOFVKptkNYQCRyrO78KTXjW8CSEasEv
         h+Gt2lnBRaumDbvhZ17uf7tVc4sPBK+REVqqbMC4O+6idXtX4QRdW4m095cpIYLGWljp
         q+WmJzCPLj/trJVz7/wQP7CETLA3T2oun/Kbj1hQJGbFb3NvFrLEYOFkZDM2J6ygS7vB
         554qDuP45ASIz9fR6ikc5Bazzf6UaL9P4oDpShxGVAOsYCa9R4pJa3ldutiWvYwsDGiI
         R8BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9GesLTpPK11P4gv00YpKZg/KxtDiNQMG6twnwGVds03SFhHmR2aBSlptL8sZPVapRrICRZnzcWRAIqYI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOjMkDTzSD9UIirK4PF3vsSS74HGm+0dxX4nY49kpfoY+nMhZf
	y3mi0LFj26Yxle7lqQiBhzb62MHeks/YyEebjv8tPtG/LAuJUJLM
X-Google-Smtp-Source: AGHT+IFSv9dRDxRxssoEwFJ9zMxpMyAVM3DX9QE+lXjk5ISrbFMnahGU4oGJcJr3eIQD0eScUDcIrQ==
X-Received: by 2002:a05:600c:a01:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-42abd2149d0mr17554295e9.10.1724230281780;
        Wed, 21 Aug 2024 01:51:21 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718984980dsm15121871f8f.40.2024.08.21.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:51:21 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:51:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Message-ID: <rdbnhk6hsgusamxn3c6vol47xoliad57gwy4i7tbitb6n2dkhe@hnd7vgbstpvw>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
 <20240821070740.2378602-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240821070740.2378602-2-billy_tsai@aspeedtech.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2024 at 03:07:39PM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
> controllers: one with 12 GPIO pins and another with 216 GPIO pins.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> index cf11aa7ec8c7..4d439972c14b 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> @@ -15,6 +15,7 @@ properties:
>        - aspeed,ast2400-gpio
>        - aspeed,ast2500-gpio
>        - aspeed,ast2600-gpio
> +      - aspeed,ast2700-gpio
>  
>    reg:
>      maxItems: 1
> @@ -42,7 +43,7 @@ properties:
>      const: 2
>  
>    ngpios:
> -    minimum: 36
> +    minimum: 12
>      maximum: 232
>  
>  required:
> @@ -93,6 +94,20 @@ allOf:
>            enum: [ 36, 208 ]
>        required:
>          - ngpios
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2700-gpio
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 12
> +          maxItems: 216
> +        ngpios:
> +          enum: [ 12, 216 ]
> +      required:
> +        - ngpios
>  
>  additionalProperties: false
>  
> @@ -146,3 +161,32 @@ examples:
>          gpio-ranges = <&pinctrl 0 208 36>;
>          ngpios = <36>;
>      };
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        gpio2: gpio@14c0b000 {
> +            compatible = "aspeed,ast2700-gpio";

No need for new example, no relavant/important differences here.


> +            reg = <0x0 0x14c0b000 0x0 0x1000>;
> +            interrupts-extended = <&soc1_intc2 18>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            #gpio-cells = <2>;
> +            gpio-controller;
> +            gpio-ranges = <&pinctrl1 0 0 216>;
> +            ngpios = <216>;
> +        };
> +
> +        gpio3: gpio@12c11000 {
> +            compatible = "aspeed,ast2700-gpio";

Especially for two the same examples...

Best regards,
Krzysztof

