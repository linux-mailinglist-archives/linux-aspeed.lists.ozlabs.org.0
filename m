Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6510625523
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Nov 2022 09:22:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7sBW0tlyz3cNN
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Nov 2022 19:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a2g3SnvK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a2g3SnvK;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7sBL4FTPz3cDv
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Nov 2022 19:21:59 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id f37so7276757lfv.8
        for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Nov 2022 00:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaXB6dN6ptekdk24JrkBO1mYR3sj0qJtXHnyugR9QHo=;
        b=a2g3SnvKK+xz2sLTjlgXMio5mgQbURrE6LawvamLerfbL6eLSdhUDPCIPevb/dnFbr
         Y7KnjrOgYh045wITt8Nkot3LveepWYCFC1txDsXBhLNne7ZzGdeis9E8I34Ewl1/Vcew
         no/tiezkwXS2HfLR2LlsPQJ2Qvr7G51IBgTLiby61DPCqjJAArYtq2rKDsfaNGudOK8g
         bU0F6sNXDijc0TkplafA4wvsztaKnz2VaVxYfw7aD+B7oicKI0RAiuv6hSwaKYkSl98V
         GiQN13fkkCQmatFEj9c4In6eToZO6ms+imQp3PmeQWnX4YSSAKlk1UnACGawwB9Sc9m+
         L3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaXB6dN6ptekdk24JrkBO1mYR3sj0qJtXHnyugR9QHo=;
        b=mK2cv4RQeGQlCiUZpdZWfIPg0i+Le139PLIavh/H8It1rYgDx4i8O7ha17HqaWVyuz
         envdiGNHYdylDVSbyFB0Wos5AOti7kVit8gjKJStKlRgf/t7cWS6OVWajkMkuf6iMN5P
         KuhCw3mjsA9otf286rg7i9cb9+fKpOL1oKCgEwnP8s5Hqg+Zlph+/mF6/zi0jGh20xiW
         4weqlVmF4OZ+bODEX/WbYPvaWogpOOoZ6QjYa21VqIXr0l5iHdGzSgu51KjKO9bMZGM+
         bjyjyK+nenNv7hcUrGIosxiaHLJ/HKV66qHsTz+7KnbGHGGuttqUUJkOCvnXxij2vMg0
         HCeQ==
X-Gm-Message-State: ANoB5plR3ijbmkw/T3cxMBziRK750w5Mqa56ZNrwZqlBzDf+jB0IvihA
	vWiasPq6f9JeJElYsnDbnR56qg==
X-Google-Smtp-Source: AA0mqf5H8FEamvhBHsnS1Kb+wkjKZTuntz658YH1Sdaz0Lniv1d8nAxLjpLbjbvtqRkJtkzrb4z2ew==
X-Received: by 2002:a19:6553:0:b0:4b0:fbfe:84fb with SMTP id c19-20020a196553000000b004b0fbfe84fbmr367750lfj.417.1668154913117;
        Fri, 11 Nov 2022 00:21:53 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id f29-20020a05651c03dd00b0026e897e3236sm282161ljp.6.2022.11.11.00.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:21:52 -0800 (PST)
Message-ID: <affc49a4-ecbc-23c7-3d24-25cec1c302c7@linaro.org>
Date: Fri, 11 Nov 2022 09:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Facebook Greatlakes
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
 <20221111034828.2377-2-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111034828.2377-2-Delphine_CC_Chiu@Wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com, linux-kernel@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/11/2022 04:48, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Greatlakes
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

