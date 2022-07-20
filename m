Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E033757B493
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Jul 2022 12:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnsX63gPmz3bnH
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Jul 2022 20:34:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ltJqGHsb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ltJqGHsb;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnsWz2zM5z304m
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Jul 2022 20:34:38 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id o12so20629888ljc.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Jul 2022 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cAufcfrmkWuteWD367j9pVSwfJbo/oWC1itAdvShsqk=;
        b=ltJqGHsbiHXO2gIE5UMCyzKJ8bm+ulL2MHk28tc8dz9IQH3ZvLAOmAY+DFVByST3c5
         jQbvTx4K0y2+gpV5PJviqb06wrxVFSl9lidZqDzv3W6jxZqejRrs5NCB/oCwc2NIGoa/
         YQerNMqfBLihRlQkt85JThzJgrDhm8FXhKRD2o7Hq4gt5wFdRScKTAqfNWFfnIzLfULp
         rnCwQmE18vP0bAypXzz7rcnrPAoCMq5tcszPYxhrKJucKpX+Jjg7FPIcFdQBz0pcbmN/
         gJeAKSCQlAhOP4oD2WiiCeOydlLoC0HNgI+xUjhnUnwHgsJVY9zVoGPfJHRBDvduUAxR
         /nSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cAufcfrmkWuteWD367j9pVSwfJbo/oWC1itAdvShsqk=;
        b=VgAHkPlk130vlMbaIPlZFTOupn1WXhm4dkRnee0Z4edrYwRlq36lLWgqzFgpb9/5EK
         U0BCN9ZE0GfcTTYo/dfcDpXFrdkr8rdoWevXGn/azEeTGkdSbmXL3eF/G9GFPB4cID+S
         6sjxO5K9a0ejkkNd/sE9P7zf3W6u8bB4fvx11kQ4zwwVOjJbjNX84v9mmJCjIwVfBOFx
         mA2GtX4OKbmpdIXz8TQ6cC6rH0z+fq6F4ub+8HNyPbKnZ8nXzwsm/UJjp231zaTexlqH
         6gSKae0v6XSezFhoptSkK99ThhkP14/WVsGMPUeQB4fCpgqRig38aIELtsvQ3s6xra91
         T0zg==
X-Gm-Message-State: AJIora9uyBCHhqnY2n6HoKW6wY43zAvcuELRqUu/5k1dG1sHFdUi8nAg
	XZv3xmUb58dlL5IrGpmbSlTBgg==
X-Google-Smtp-Source: AGRyM1sBD67/jtTKZ/dxu9zBMrKpp6yvgqRJYuzxj3GLE5Nuf02oFFNJCD8KmiGKyAMOt3cy4E6HEA==
X-Received: by 2002:a05:651c:204a:b0:25d:4ef0:80a9 with SMTP id t10-20020a05651c204a00b0025d4ef080a9mr17167757ljo.319.1658313270296;
        Wed, 20 Jul 2022 03:34:30 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id i10-20020a2ea22a000000b0025d9552fcafsm3153679ljm.97.2022.07.20.03.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 03:34:29 -0700 (PDT)
Message-ID: <0a5cbaaa-565a-7215-5e31-12c52f4bbcbd@linaro.org>
Date: Wed, 20 Jul 2022 12:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: document Ampere
 Mt.Mitchell BMC compatibles
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-2-quan@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720085230.3801945-2-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 20/07/2022 10:52, Quan Nguyen wrote:
> Document Ampere Mt.Mitchell BMC board compatible.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Thank you for your patch. There is something to discuss/improve.

> ---
> v2:
>   + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]
> 
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index d61408194998..b8146d5c4431 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -71,6 +71,7 @@ properties:
>            - enum:
>                - aspeed,ast2600-evb
>                - aspeed,ast2600-evb-a1
> +              - ampere,mtmitchell-bmc

Put the entry ordered alphabetically.


Best regards,
Krzysztof
