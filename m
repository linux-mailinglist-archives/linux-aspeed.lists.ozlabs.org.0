Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D66326C3575
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Mar 2023 16:19:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgwJK5P1xz3cQl
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 02:19:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a9/mRmDd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a9/mRmDd;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgwJC45Qkz3c6m
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Mar 2023 02:19:39 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id eg48so60997194edb.13
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Mar 2023 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679411975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2mP2BnsQm5zh6A2HZUTUjLmcpObY/zGao0pM3PGo0g=;
        b=a9/mRmDdoKZe4hhJTvpyCKClqpUYC+NK2bBvbKm60dxzY9gnmfTSZj8AiS80GfNyk5
         bW6FwwOD+ms6rmCHj72eMQyXwxGqM9POwKXiUBNj0wELc5Y7PPdEMGFyijxPA1c7iZ49
         OVUqYTmOcT6j8aF9yvCnG5LdN8RzMaZfcIZ00Q4ZBPIf8GXklbycWNde2wHRexk/ppcY
         vQrPhozeuNvycoFLmZs/9ZeWDp2iMSiI/+ApBNMqCXbwXojKQ3xqr6gr440O5yoTVWi6
         /Ky3g6vptPcGfsW9xcc/6VTqiYx9Q5vQmtZ5579ab7l1uS/9hAnYJmN0KeiGEkmD+xyw
         3D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679411975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2mP2BnsQm5zh6A2HZUTUjLmcpObY/zGao0pM3PGo0g=;
        b=seHVM1G9WlehjonTXql+mjnxKkewOb8vOQ+JzfcjaMYEQGD5VoyLik4Q6okLP8M7pU
         3qJf596TC+T9RLZ8PdbfF/4kJcvnWb/O1sykwxV/URm73kXtFMjH+wRKwowfMLSUlEYG
         g6TH35Am8UiI3W6MFooyFgK3eRauOD4Pgu+7yX2RHnK/pc6s24xLqEU1nGax4QYwirIS
         9eaK2/PjnM4bbtgUlTUarhcDZ24LeWZPHyaTfWgHj1vWWGDCDqgDf8esbc5zv+3td6Jo
         w3JjmLwQNsa77d4X+p4GF1NEQDcasNghgT3rLgHXESDxpjHxiq63KM/bkK0uR+/s85RV
         TcKA==
X-Gm-Message-State: AO0yUKX6fSmkNpvd31xFXUBOTua27HbvyumMKtmJ7BuBfzzlr5FZgK1x
	HhaLIOxky+98icz9y4nwOHtVVQ==
X-Google-Smtp-Source: AK7set8T8K2wOtiJQwaJ+xGQGB6ZcAZOwXgU8n6yD90OeTQO2Khv8i5BOklJDUGRgKscZAFRclXJ8Q==
X-Received: by 2002:a17:907:75d8:b0:8aa:502c:44d3 with SMTP id jl24-20020a17090775d800b008aa502c44d3mr3318942ejc.41.1679411975153;
        Tue, 21 Mar 2023 08:19:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906318b00b008d606b1bbb1sm5899106ejy.9.2023.03.21.08.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:19:34 -0700 (PDT)
Message-ID: <6d4cf513-0787-6b39-8d38-30484be7ddff@linaro.org>
Date: Tue, 21 Mar 2023 16:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] doc: Add Atmel AT30TSE serial eeprom
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20230321151642.461618-1-eajames@linux.ibm.com>
 <20230321151642.461618-3-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321151642.461618-3-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/03/2023 16:16, Eddie James wrote:
> The AT30TSE is compatible with the JEDEC EE1004 standard. Document it
> as a trivial I2C device.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 6f482a254a1d..43e26c73a95f 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -47,6 +47,8 @@ properties:
>            - ams,iaq-core
>              # i2c serial eeprom (24cxx)
>            - at,24c08
> +            # i2c serial eeprom (EE1004 standard)

AT30TSE?

> +          - atmel,at30tse

Microchip does not find anything on AT30TSE. Are you sure this is the
model name?


Best regards,
Krzysztof

