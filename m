Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862F6B5585
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 00:22:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYMWs6Qmrz3cMl
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 10:22:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BktmKXSz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BktmKXSz;
	dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYMWk6SPBz3cL1
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Mar 2023 10:21:52 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1755e639b65so7642416fac.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 15:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678490509;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+4y9DSm8ynkkCS+XSEXgy/9eh94uAA62/oUDVLpYc6w=;
        b=BktmKXSzhgo6DPj6CTvH9qXgbBQmCy+2y9qI1RByiVWf0vFjG0MF+BO4C3ULs0WLmh
         NZnh+Bb/sbsm0Uad+sVYPxxACGD9mhIWlIYK2vdCmZm4iHz8zF90OxZGYSYCkVupYPou
         igL2AWcS3SYSkibrMxNxvLkap191TZQTrsrinotZqPsRZzdDc0GxEPou7MT2ravHUlVL
         utY9jFflL7ke5362MHxeYOW3u+YozXhK7xUMv2yFAk/hKKvQMB4WJIS94iZHAlfLs8ON
         /X+JI2rL6SzdvrtKTm3UQA8brJGzf2GM9ADmKTv4ywkYTFmd5mIwwVyjfU7qU+w2m7bE
         VplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678490509;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4y9DSm8ynkkCS+XSEXgy/9eh94uAA62/oUDVLpYc6w=;
        b=LsmHkogSpNlS62kbl2M+MqhcJ5LLePvqUsM2r+Zi6j3wkZMabl0QwMm3mZ/zVWETAI
         pfFvCO/Nh71O0oWSbCA4oQw1JcQgDYxdROQEj9qi7HkDh2ivzIPRmmU5nqH9xXySPbCr
         TLQ2L9JWOtHDHB30/kKox5/qEMg/Co1xMwwuxnh7wXMccBAD5ci9pzk0J/L4Y8Z6H4rx
         vDIv2tuyHHKgKpWQaFb7/2lGtohuIAJlyoDg+mit1jVmvT3GrJPOkj3MW423BOoatTmF
         II722Lc8qiRkB0tr+P0UtVFYYdQiJZrUalAHrGHlLXkxOHNYe2FpvirZRfKiFsvLNQu0
         SFhQ==
X-Gm-Message-State: AO0yUKVSWMFaZGUNHo3WG+M4E7Oy+G1Zrj/jhI/p4Yhwi+yyx4N8BeUc
	1al/w6eCUGkR4nhY8YUxKvY=
X-Google-Smtp-Source: AK7set+CbshHIW4LX3YgkJxz0P5eVsDphB+JZDhfWXPZq5ddCmq2K/A9fPdDXJg/FYqPq7UlGC+qhA==
X-Received: by 2002:a05:6870:1718:b0:16d:2b42:811a with SMTP id h24-20020a056870171800b0016d2b42811amr16027401oae.17.1678490509083;
        Fri, 10 Mar 2023 15:21:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z21-20020a056870515500b001728d38a41asm538474oak.55.2023.03.10.15.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 15:21:48 -0800 (PST)
Message-ID: <5aaa5a5d-a5e2-0052-f840-67abe0ba6d47@roeck-us.net>
Date: Fri, 10 Mar 2023 15:21:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] watchdog: aspeed: Drop of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230310223012.315897-1-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230310223012.315897-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/10/23 14:30, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).
> 
>    drivers/watchdog/aspeed_wdt.c:56:34: error: ‘aspeed_wdt_of_table’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/aspeed_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index c1e79874a2bb..b72a858bbac7 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -465,7 +465,7 @@ static struct platform_driver aspeed_watchdog_driver = {
>   	.probe = aspeed_wdt_probe,
>   	.driver = {
>   		.name = KBUILD_MODNAME,
> -		.of_match_table = of_match_ptr(aspeed_wdt_of_table),
> +		.of_match_table = aspeed_wdt_of_table,
>   	},
>   };
>   

