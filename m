Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB50773C1C
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 18:00:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PwDjsnZP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKyZX2Ct0z304b
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 02:00:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PwDjsnZP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKyZN1jX5z2xbC
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 02:00:12 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe0eb0ca75so9186047e87.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Aug 2023 09:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510404; x=1692115204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RE7wtMExHdhFwKLLqjqt4LfjR7+37ThDsOcCDy3qTQQ=;
        b=PwDjsnZPpEOON21XmhMp+u0sisjWLyBSPad9QxaLPGHW7nSgAhPQ1LjU8UOwI1vfor
         45ifcbnWH1NYoLzcAuTvGv4NZkjNtXLa5B6BV17UibKiSQyTh8i/wDL3p27vY8Fzo7LU
         2DEQiC1nO0B/mkA/afSZBymtADJ2geddDbPz+lpTZHxbRYPlKJt/uJyqkdm0ZOS0AgRE
         dqIS/yf3dlUwkL0lvfcDs237LoV3SHlzAVxCBlRku/R4G1vjxTgUuTCzfA7xkw1lOL54
         7mdiOer0rm7E2e6f1jzUu1hGB8TrtXdhr+55sG74Fhwm+KDUGQGjkteDF4AXRAFFw/fg
         sv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510404; x=1692115204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RE7wtMExHdhFwKLLqjqt4LfjR7+37ThDsOcCDy3qTQQ=;
        b=auJBXiiW43ilaKtpQ5XQzubZiOxcpdKCHnZKC17Q76Guqnu6QRq+/h5v4BhIJxQEUI
         fifV5cZcDhCyl3+DR8GpbuAGYYstQ33LgU7WJ51CXkmfuiAoLzIscbhpSCtoQW/exJ8j
         tU3OKa1fJT/fcvaEfOe1KT4ZYi6PSm6fdlaXqqfxxuiH8DKqC6hjJi5j3dsEjpa5YZzz
         HsCW1Wxn3CLgJg7y3vmCLdIXAq6trP/euO/jkWEfZ4foRp1RmjuV6xTvoqE0QVSqBNt6
         FaP/1jyNf+9s329YTo+Fn7Mkp2/XQ87MJn7Igqlq2iIdauYPnJzpyH0sqX43H1PNai9j
         /tOA==
X-Gm-Message-State: AOJu0Yxbl2/qfJ+vsb/kpwVfvQ9UAsyHLVPcL/PKhpfrzdBL92ZeCyj1
	e6Feik0hn8OzE2T3UAExYWrqJQ==
X-Google-Smtp-Source: AGHT+IHbksfzqPLdhw5/yCLJTbCZEOgLAM2KQI/YGEb2WX3hUJsxDJkD4J/0HYLK1y1YsVgSMdIzhA==
X-Received: by 2002:ac2:4850:0:b0:4fe:56d8:631d with SMTP id 16-20020ac24850000000b004fe56d8631dmr8327458lfy.25.1691510404500;
        Tue, 08 Aug 2023 09:00:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id j18-20020aa7c0d2000000b0052239012c65sm6837797edp.82.2023.08.08.09.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 09:00:03 -0700 (PDT)
Message-ID: <f85df327-c321-8c1e-2043-c60210fbed56@linaro.org>
Date: Tue, 8 Aug 2023 18:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] i3c: ast2600: Add reset deassertion for global
 registers
Content-Language: en-US
To: Dylan Hung <dylan_hung@aspeedtech.com>, jk@codeconstruct.com.au,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@aj.id.au, p.zabel@pengutronix.de, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
 <20230808154241.749641-4-dylan_hung@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808154241.749641-4-dylan_hung@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, kobedylan@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08/08/2023 17:42, Dylan Hung wrote:
> Add missing reset deassertion of the I3C global control registers.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
>  drivers/i3c/master/ast2600-i3c-master.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
> index 09ed19d489e9..5d9d060134e0 100644
> --- a/drivers/i3c/master/ast2600-i3c-master.c
> +++ b/drivers/i3c/master/ast2600-i3c-master.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/reset.h>
>  
>  #include "dw-i3c-master.h"
>  
> @@ -128,6 +129,7 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct of_phandle_args gspec;
>  	struct ast2600_i3c *i3c;
> +	struct reset_control *rst;
>  	int rc;
>  
>  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> @@ -156,6 +158,13 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "invalid sda-pullup value %d\n",
>  			i3c->sda_pullup);
>  
> +	rst = devm_reset_control_get_shared(&pdev->dev, "global_rst");
> +	if (IS_ERR(rst)) {
> +		dev_err(&pdev->dev, "missing of invalid reset entry");
> +		return PTR_ERR(rst);

return dev_err_probe

Best regards,
Krzysztof

