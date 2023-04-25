Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A9F6EE296
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Apr 2023 15:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Mtn6Dh8z3cLT
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Apr 2023 23:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npeWsqFv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npeWsqFv;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5Mtf3S0Rz3cKn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Apr 2023 23:15:19 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94f6c285d92so1078579266b.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Apr 2023 06:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682428510; x=1685020510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3BikuggXhWs1OPUQPTsPuMkYRDNlCEeDeec0U2qCGU=;
        b=npeWsqFvrxdDEjHJ40Ljy4HgJG2I6Qag8a8pP//WROOGC4bMMXJXG3NUbeC2rI+Agm
         zM9WBSRzLcIEKfcvxacDUawYlNSrP0XYjoBLYQGI6uUElAthC5524feJDJUWQ+PehVdc
         22poIpMVGBO5EQJrClH4W5BuJtjELXcdAgYPtFQAD9z5BOd9XCCXF+MvEBJ3A6ef5SXB
         4pHezttks4lY4jLY79TrMulHjKlLvwIpKISxTo7x1l5cUonXCI4y1LUOAyfSiS0LeiIT
         jQ83HGi1AWY3Utj5K0L0cnNQlqX/oqhs2cOYsjyRCbRG/N4b7Tw9S7bca+7qjcYjynjM
         fDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682428510; x=1685020510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3BikuggXhWs1OPUQPTsPuMkYRDNlCEeDeec0U2qCGU=;
        b=F/qX9I21AAdbN7sVJ3YSPzP6ES4vmnAElBECh0juuWEPWu4eZlmKxx7qICp5CwByt5
         CMyT5Dr3T2wdvtfqAfBI+MaZKye5WL/GvTVYx+z9XfYB9WgPi/zBBMlrUY/c2z3vaU55
         JGgT2d3y+PQsPc9vLlIc1V5nxIf2o6gwrVEe7YX2PH8Sk/vq5pYTpp7GzF4sPlvRBToO
         Ojz6BJN4qg8vGcMYF/XNSpac2Ikdw81ddskfXCxW+dduJvo9zcefW2/oqxqkBQxkbTet
         waqCnFC3k5BIx5X9i0TN+O9j5frAduf7vYr+vR81zwsWuR3YL/yUskmu50Ev64qxzGGU
         B2xg==
X-Gm-Message-State: AAQBX9fRKiNhBY5K7CT60aIGl500iAFrdGvKSKA6baYpSm1l8Z6WlsZ1
	1GCaO1WacfmGV+zyt4Y+VrIBsQ==
X-Google-Smtp-Source: AKy350Ykr4gtdZ1ZSW54CjRQJltXgFAHvYw5B1VZUVrxe/v1FVbbmrQbyexNMdoBYd1tjbR3rUIt/w==
X-Received: by 2002:a17:906:40f:b0:94f:a8fd:b69f with SMTP id d15-20020a170906040f00b0094fa8fdb69fmr14098617eja.18.1682428510422;
        Tue, 25 Apr 2023 06:15:10 -0700 (PDT)
Received: from [192.168.9.102] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id ox6-20020a170907100600b008f89953b761sm6753105ejb.3.2023.04.25.06.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 06:15:09 -0700 (PDT)
Message-ID: <7ee3eec8-b5b4-2591-adcd-1831bf7de02b@linaro.org>
Date: Tue, 25 Apr 2023 15:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] ARM: dts: aspeed: mtmitchell: Add I2C Fan
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
 <20230425065715.21871-3-chanh@os.amperecomputing.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230425065715.21871-3-chanh@os.amperecomputing.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 25/04/2023 08:57, Chanh Nguyen wrote:
> Add the MAX31790 node as a Fan I2C controller. It controls the
> TACH and PWM for Fan Mt.Mitchell system.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> index e79f56208b89..6455cf80da0e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -477,6 +477,18 @@
>  			line-name = "bmc-ocp0-en-n";
>  		};
>  	};
> +
> +	max31790@20 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "maxim,max31790";

Unfortunately the compatible is undocumented.

Please run scripts/checkpatch.pl and fix reported warnings.

Best regards,
Krzysztof

