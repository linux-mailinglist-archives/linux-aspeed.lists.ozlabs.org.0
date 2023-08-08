Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45C77392C
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 10:53:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oZ71hndr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKn6J617cz2ypt
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Aug 2023 18:53:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oZ71hndr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKn6C5Km2z2xbC
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Aug 2023 18:53:37 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c1d03e124so708366166b.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Aug 2023 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691484813; x=1692089613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0VsB+3QcpVhSzXsrcJCWQORogKC8v/3XnAGMVr+XVo=;
        b=oZ71hndrg+6W1FNHPKG0uEmjnXnOrZCqTkP42+CeQwxd2LFKtWyViSVR+FHxXsxa8L
         yT7sHq7jI9hgm765DShqHRJfKEZvLM0APDZyA67A9gS2ppFxVz7SLb/pky5beYembcB5
         yzYRiBdPnACBbuROAaY7zJc1DkL1Uzl2V3aTIZvImTNltWlCuEu8toTM6iQJGo3vRUE2
         YAbU3WyxFD0LfumxFu4G0T4maWTVS85IyTfNfXDOh6PTTSBUQEGnVmFdZIk0Zg+snSRr
         b07MK9OL/PiWkfDexw4rI3E7+ppHfVop1Ydfb/USTEw8NH6E+jNzPjj+FRX5+ZngWKD3
         Zr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691484813; x=1692089613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0VsB+3QcpVhSzXsrcJCWQORogKC8v/3XnAGMVr+XVo=;
        b=cMwiPepOsg0XEpxFJSax1IdY5vKyXp2RGbw+DB3Ok7xam3cFgihhrwK1gLMokWNUeb
         hHb1BpCIaQL9SLpOq+8L6rTOKLl974Pe5esouZnkqtdUm/3b3G6GfrbQhjdgtkwnW30k
         hH3Ye8sDKIRmAwtgVswZTMWpu/G2ig8J0QXjjWk8EQ4Yk8Y5FqVJ2J6Z3zmN1aXyowCz
         +RNkRRoYghakB6UASvD7xMwakMwoJj2C+1I97CVPonPWidCXUf47FljBvyRzuolcolj/
         +M8iScS+AzJwrhv4IiZNuYQwoCn8cUUZ2geu+G6A0+ikj2xHQq5PL5Uv5l9S7FmFAB/f
         EohA==
X-Gm-Message-State: AOJu0Yxusf0d8SJxChaVfs20YrhG7NZpWZ+hKWrFj6CCZiXLbpW2l2hR
	4QnZ3lvyhG2+9uq86o/BzBnZlQ==
X-Google-Smtp-Source: AGHT+IGZyMVu45JR/04bE0n1F2vFeCDrbv7qqr++NR+xxeRIqEcFbGzKT0+3PpQKpAcf10kY0QPC8w==
X-Received: by 2002:a17:906:8a51:b0:99b:d075:18ba with SMTP id gx17-20020a1709068a5100b0099bd07518bamr8071366ejc.56.1691484813775;
        Tue, 08 Aug 2023 01:53:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b00985ed2f1584sm6290546ejd.187.2023.08.08.01.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:53:33 -0700 (PDT)
Message-ID: <9a9a073b-91d8-08f3-c738-38171a9e8640@linaro.org>
Date: Tue, 8 Aug 2023 10:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite 4
 board
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230808084248.1415678-1-Delphine_CC_Chiu@wiwynn.com>
 <20230808084248.1415678-2-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808084248.1415678-2-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08/08/2023 10:42, Delphine CC Chiu wrote:
> Document the new compatibles used on Facebook Yosemite 4.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

