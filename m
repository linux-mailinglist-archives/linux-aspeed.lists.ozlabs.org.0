Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766078D4DF
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 11:45:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aX98U+qM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbKD55nKMz3bnN
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Aug 2023 19:45:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aX98U+qM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbKCy1vxZz2yq4
	for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 19:45:34 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9936b3d0286so727199466b.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Aug 2023 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693388730; x=1693993530; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suKY6OufGdFjOXeITy2SI/gqtW5sC+Q15RnB0RhvKmQ=;
        b=aX98U+qMHlovki5qscGZ13KXaULjNCc2xEKe46Fbes+B+C7pI2NedMokUocH0G+GPW
         2mMUsMba28gIUsqAJ5SkgqA4gFFxFF9XlZITttGKMy+Go23eoaT4Y7eddh42zbwi4KM/
         zkUAMgibyXD361ZnxrQSA7AQlNKu/Q+WpOPk4UaQZO31nqHcifdo8aqH2N4haV8Ycxt6
         9WwG2me4T2GOzKnOEKE4YEcfwa9UgDimhe8rHf7zifE9bqDUYgImPRKpQ71dMlnzqv6n
         6EFeNYX6QwCmZjmoEonMbOj5DyOemudEMHF81rPWb/Vwj6cVhmXq4pYrSG7RZVRyznXd
         f5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693388730; x=1693993530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suKY6OufGdFjOXeITy2SI/gqtW5sC+Q15RnB0RhvKmQ=;
        b=bXrI12txkv/eVxvORH3XVrtsh4ftdAo4cBmkHtcrLEMEg3VEYjnNswLmfb8Xotw+br
         LCIsw8nLzHJOHsL40QbpHG08I9R96rN8PvCvNNI3vbkbYSqYMswa5ArduEWd7VO8sN3O
         jDCJq/jFTEqCP/BwYwllVuGkZNVwipz7EBFYJrbIKjy2HO2H3Pf8AHqLZeLm2O3H5Yae
         N+JVNFaQwP55ZTyW6SUEI5mhT4U5V8uD7+5ALgqUBwyLTVPo4RQ+894cvuN+jgUrqfR3
         thm+0rQtpss63ZZG5Sl5Rs39Y12b9xT6Xxy3FZ4QGDW9OqnRCR8d3HuHmU63uNAFOQ11
         9hEg==
X-Gm-Message-State: AOJu0YxX1dixiNT1tnYG45ROU/58872DESwmkIwFAglo0hErk82KrDeY
	VZJyPTfI1dAgFXeAk6q9NyyHQA==
X-Google-Smtp-Source: AGHT+IEJc1E1Orxis2sVRcoNfH2DjYDXEvgRu8kKboCKIIWJBA0TxFoly1iyx8MPZDRkDacSyA528g==
X-Received: by 2002:a17:906:3d22:b0:9a1:bb8f:17de with SMTP id l2-20020a1709063d2200b009a1bb8f17demr1526973ejf.35.1693388730278;
        Wed, 30 Aug 2023 02:45:30 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id w24-20020a17090649d800b009930308425csm6973974ejv.31.2023.08.30.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 02:45:29 -0700 (PDT)
Message-ID: <1d531692-5455-fbfd-0775-50856bf0fbc7@linaro.org>
Date: Wed, 30 Aug 2023 11:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
To: peteryin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
 <20230830090212.3880559-3-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830090212.3880559-3-peteryin.openbmc@gmail.com>
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, daniel-hsu@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 30/08/2023 11:02, peteryin wrote:
> Document the new compatibles used on Meta Minerva.
> 
> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 6b0a6683ccae..b681bbf960d1 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -80,6 +80,7 @@ properties:
>                - facebook,fuji-bmc
>                - facebook,greatlakes-bmc
>                - facebook,yosemite4-bmc
> +              - facebook,minerva-bmc

m is not after y. Keep things sorted, I already wrote this in your v2.

Best regards,
Krzysztof

