Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6575015B
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jul 2023 10:24:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gj90BQgm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R19kb6y9Zz3byP
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jul 2023 18:24:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gj90BQgm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R19kR01h8z3bZ3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jul 2023 18:23:56 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-992b2249d82so847899166b.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jul 2023 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689150230; x=1691742230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GoWAyxLM68nERAkQpmx0i5zgpgXqPVi7D6ZJJROAh9I=;
        b=Gj90BQgmuftkYvA0l4Ooh6N1Y2ExFLxV0JKw5LVaYCep1g+FD8fD81wuYazmUzOV6S
         QgyseppeIghxUAE8LcT8iNQ9m5V2jc5rSLXwAOI5PxczACAvXcKkQollsFKVp94zNh9K
         /QvkADuGCbi49oCNzRyLMPDJnn3O2N+LVbm8oDA2nh/bk2nedQVhFaDnMAQhAIjxQjiW
         QPy6ff0xPADmJAVpnT0jUkWDq3pK1lEbz6RTZM6h9EVJKYtyD1+54LKcO+BT6Kc9gwsc
         Zlg2upivsLSa/WMQvmq3pSe6zHAgQ+DGV6huo5kk3h0MltpiWaY6b1IN9TASx/nl3vlz
         Q1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689150230; x=1691742230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoWAyxLM68nERAkQpmx0i5zgpgXqPVi7D6ZJJROAh9I=;
        b=R/5gwvM9zydPxnL63V7C7skTk/i+NvMEVQO6vPTgvRxScxa5hdlZGFaeyZc7zZ8Wm0
         GQVcw3wojuzRaLe3ZOSv+BSOoYv14ygdyrqHgeFnSsqx7tL6WAO5KQeRUaLmpVCZsFh/
         gO92u4SCF+/hM8B6ZcUaI74Nmw7uEO5ZkwCMbnEI6gT8WGEbOeSDNnkCWUjVBTRA2NgL
         gfDI8i4CK7JXxuo0IRG3qYfXH80bnhhNrJZtsjUTXFL12x7rPFEg+8nhYY9Kzp33haJ2
         iHkyHrg9pcUQISRC6LyuqHBw9NitdpOnKazwxsT1Vo20m+C6WgVNlSRSLKSI+0kwzXDR
         htGw==
X-Gm-Message-State: ABy/qLb2KKBgXncUH4kkTEv9GDpBmwgIROehBkUvUx4n5HEad9HFP19K
	Djc5XKXFUBWWNLTKG5yP8Y4ENQ==
X-Google-Smtp-Source: APBJJlEVDQQfQgUOLip5inCMiTiDTMsHjp3rA0fGmDo6HsHEM7grTTl4v9xfKo7wZYmdTEDQa5gXow==
X-Received: by 2002:a17:907:f97:b0:992:a618:c3c2 with SMTP id kb23-20020a1709070f9700b00992a618c3c2mr18039068ejc.76.1689150230655;
        Wed, 12 Jul 2023 01:23:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f26-20020a1709062c5a00b0098242730348sm2246342ejh.72.2023.07.12.01.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 01:23:49 -0700 (PDT)
Message-ID: <13854167-fe20-2568-4865-80f263898871@linaro.org>
Date: Wed, 12 Jul 2023 10:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230712073752.54624-1-Delphine_CC_Chiu@wiwynn.com>
 <20230712073752.54624-2-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712073752.54624-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 12/07/2023 09:37, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite V4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

